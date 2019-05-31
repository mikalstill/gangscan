#!/usr/bin/python

# This code is derived from the work of BehindTheSciences.com and Brian Lavery

#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so.

import datetime
import hashlib
import json
import os
import psutil
import requests
import select
import spidev
import subprocess
import sys
import time
import uuid

import RPi.GPIO as GPIO

from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont

import filequeue
from lib_tft24T import TFT24T
import util


# For LCD TFT GPIOs. Numbering is GPIO.
DC = 26
RST = 25
LED = 23

# Constants
ICON_SIZE = 30


util.log('Started')

# Setup GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Initialize display.
TFT = TFT24T(spidev.SpiDev(), GPIO, landscape=False)
TFT.initLCD(DC, RST, LED)
TFT.clear((125, 255, 125))
util.log('Initialized screen')

# Update clock
try:
    subprocess.check_output('sudo ntpdate -s time.nist.gov', shell=True)
    util.log('Updated the clock')
except:
    # This will fail if we don't have network connectivity
    pass

# Find old RFID reader processes and terminate them at lot
for proc in psutil.process_iter():
    try:
        pinfo = proc.as_dict(attrs=['pid', 'cmdline', 'username'])
    except psutil.NoSuchProcess:
        # Process ended before we got to kill it!
        pass
    else:
        if pinfo['cmdline'] == ['/usr/bin/python3', 'read_rfid.py']:
            util.log('Found stale process: %s' % pinfo)
            os.kill(pinfo['pid'], 9)

# Determine our network info
ipaddress, macaddress = util.ifconfig()

# Read config from server, if required
config = {}
config_path = os.path.expanduser('~/gangscan.json')
if os.path.exists(config_path):
    with open(config_path) as f:
        config = json.loads(f.read())

# Ensure an updated config if there is one
connected, config = util.heartbeat_and_update_config('gangscan', config)

# Create the file queue
queue = filequeue.FileQueue('gangscan-%s' % config['device-name'])

# Objects we need to draw things
icons = ImageFont.truetype('gangscan/materialdesignicons-webfont.ttf',
                           ICON_SIZE)
text = ImageFont.truetype('gangscan/BebasNeue.ttf', ICON_SIZE)
small_text = ImageFont.truetype('gangscan/BebasNeue.ttf', int(ICON_SIZE / 2))
giant_text = ImageFont.truetype('gangscan/BebasNeue.ttf', int(ICON_SIZE * 1.3))

images = {}
images['logo'] = Image.open('gangscan/gangscan.jpeg').convert('RGBA')
images['logo'] = images['logo'].resize((320, 240))
util.log('Loaded logo')

for (icon_name, icon, font, inset) in [
        ('wifi_on', chr(0xf5a9), icons, 0),
        ('wifi_off', chr(0xf5aa), icons, 0),
        ('connect_on', chr(0xf1f5), icons, ICON_SIZE + 5),
        ('connect_off', chr(0xf1f8), icons, ICON_SIZE),
        ('location', config['location'], text, (ICON_SIZE + 5) * 2)]:
    img = Image.new('RGBA', (320, 240))
    img_writer = ImageDraw.Draw(img)
    width, height = img_writer.textsize(icon, font=font)
    img_writer.text(((ICON_SIZE - width) / 2 + 5, inset + 5),
                    icon, fill='black', font=font)

    images[icon_name] = img
    util.log('Loaded %s icon' % icon_name)
    
# Start the RFID reader process
(pipe_read, pipe_write) = os.pipe()
reader_flo = os.fdopen(pipe_read)
reader = subprocess.Popen(('/usr/bin/python3 gangscan/read_rfid.py '
                           '--presharedkey=%s --linger=%d'
                           %(config['pre-shared-key'], config['name-linger'])),
                          shell=True, stdout=pipe_write, stderr=pipe_write)

last_scanned = None
last_scanned_time = 0
last_status_time = 0

ipaddress = '...'
connected = False
last_netcheck_time = 0

try:
    while reader.poll() is None:
        if connected:
            event_id = queue.get_event('new')
            if event_id:
                data = queue.read_event('new', event_id)
                data['timestamp-transferred'] = time.time()
                try:
                    r = requests.put('http://%s:%d/event/%s'
                                     %(server_address, server_port,
                                       event_id),
                                     data={'data': json.dumps(data)})
                    if r.status_code == 200:
                        util.log('Wrote queued event %s' % event_id)
                        queue.change_state('new', 'sent', event_id)
                except Exception as e:
                    # Failed to stream event to server
                    util.log('Failed to stream queued event %s: %s'
                             %(event_id, e))
                    connected = False

        if len(select.select([pipe_read], [], [], 0)[0]) == 1:
            scan = reader_flo.readline().rstrip('\n')
            util.log('RFID reader said: %s' % scan)

            try:
                data = json.loads(scan)
                if data['outcome'] == True:
                    last_scanned = data['owner']
                    last_scanned_time = time.time()
                    last_status_time = 0

                    event_id = str(uuid.uuid4())
                    data['event_id'] = event_id
                    data['location'] = config['location']
                    data['device'] = config['device-name']
                    data['timestamp-device'] = time.time()

                    h = hashlib.sha256()
                    for key in data:
                        s = '%s:%s' %(key, data[key])
                        h.update(s.encode('utf-8'))
                    data['signature'] = h.hexdigest()

                    queue.store_event('new', event_id, data)
                    data['timestamp-transferred'] = time.time()

                    try:
                        r = requests.put('http://%s:%d/event/%s'
                                         %(server_address, server_port,
                                           event_id),
                                         data={'data': json.dumps(data)})
                        if r.status_code == 200:
                            util.log('Wrote event %s' % event_id)
                            queue.change_state('new', 'sent', event_id)
                        else:
                            # Failed to write event to server
                            util.log('Failed to store event %s with HTTP '
                                     'status %s'
                                     %(event_id, r.status_code))

                    except Exception as e:
                        # Failed to stream event to server
                        util.log('Failed to stream event %s: %s'
                                 %(event_id, e))

            except Exception as e:
                util.log('Ignoring malformed data: %s' % e)

        elif time.time() - last_netcheck_time > 30:
            # Determine IP address
            ipaddress = '...'
            last_netcheck_time = time.time()
            ipaddress, _ = util.ifconfig()
            connected, config = util.heartbeat_and_update_config('gangscan',
                                                                 config)

        elif time.time() - last_status_time > 5:
            last_status_time = time.time()
            util.log('Updating status screen')
            status = images['logo']

            # Paint status icons
            if ipaddress != '...':
                status = Image.alpha_composite(status, images['wifi_on'])
            else:
                status = Image.alpha_composite(status, images['wifi_off'])

            if connected:
                status = Image.alpha_composite(status, images['connect_on'])
            else:
                status = Image.alpha_composite(status, images['connect_off'])

            status = Image.alpha_composite(status, images['location'])

            now = datetime.datetime.now()
            status_writer = ImageDraw.Draw(status)

            # Display time
            status_writer.text((5, 240 - (ICON_SIZE / 2) - 5),
                               '%02d:%02d' % (now.hour, now.minute),
                               fill='black',
                               font=small_text)

            # Display queue size
            queued_string = '%d queued' % queue.count_events('new')
            width, height = status_writer.textsize(
                queued_string,
                font=small_text)
            status_writer.text((320 - width - 5, 240 - (ICON_SIZE / 2) - 5),
                               queued_string,
                               fill='black',
                               font=small_text)

            # Display network address
            width, height = status_writer.textsize(ipaddress, font=small_text)
            status_writer.text(((320 - width) / 2, 240 - (ICON_SIZE / 2) - 5),
                               ipaddress,
                               fill='black',
                               font=small_text)

            # Display recently scanned person
            if time.time() - last_scanned_time < config['name-linger']:
                width, height = status_writer.textsize(
                    last_scanned, font=giant_text)
                status_writer.rectangle(
                    (160 - width / 2 - 5, 120 - height / 2 - 5,
                     160 + width / 2 + 5, 120 + height / 2 + 5),
                    fill='white')
                status_writer.text(
                    ((320 - width) / 2, (240 - height) / 2),
                    last_scanned,
                    fill='green',
                    font=giant_text)

            TFT.display(status.rotate(90, resample=0, expand=1))

    # The RFID reader process exitted?
    os.close(pipe_read)
    os.close(pipe_write)
    util.log('The RFID reader process exitted with code %d'
             % reader.returncode)

finally:
    TFT.clear((255, 125, 125))
