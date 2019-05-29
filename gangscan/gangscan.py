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
import re
import requests
import select
import socket
import subprocess
import time
import uuid

import RPi.GPIO as GPIO

from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont

import filequeue
from lib_tft24T import TFT24T
import spidev

import zeroconf

# For LCD TFT GPIOs. Numbering is GPIO.
DC = 26
RST = 25
LED = 23

# Constants
ICON_SIZE = 30
INET_RE = re.compile(' +inet ([^ ]+) .*')

print('%s Started' % datetime.datetime.now())

# Setup GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Initialize display.
TFT = TFT24T(spidev.SpiDev(), GPIO, landscape=False)
TFT.initLCD(DC, RST, LED)
TFT.clear((125, 255, 125))
print('%s Initialized screen' % datetime.datetime.now())

# Update clock
try:
    subprocess.check_output('sudo ntpdate -s time.nist.gov', shell=True)
    print('%s Updated clock' % datetime.datetime.now())
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
        if pinfo['cmdline'] == ['/usr/bin/python', 'read_rfid.py']:
            print('%s Found process: %s' %(datetime.datetime.now(), pinfo))
            print('%s Killing stale process' % datetime.datetime.now())
            os.kill(pinfo['pid'], 9)

# Find server
zc = zeroconf.Zeroconf()
si = zc.get_service_info('_http._tcp.local.', 'gangserver._http._tcp.local.')
server_address = socket.inet_ntoa(si.address)
server_port = int(si.port)
print('%s Found server at %s:%d' %(datetime.datetime.now(), server_address,
                                   server_port))
            
# Read config from server
with open('gangserver/config.json') as f:
    config = json.loads(f.read())
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
print('%s Loaded logo' % datetime.datetime.now())

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
    print('%s Loaded %s icon' %(datetime.datetime.now(), icon_name))
    
# Start the RFID reader process
(pipe_read, pipe_write) = os.pipe()
reader_flo = os.fdopen(pipe_read)
reader = subprocess.Popen('/usr/bin/python3 gangscan/read_rfid.py',
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
                    r = requests.put('%s/event/%s' %(config['server'],
                                                     event_id),
                                     data={'data': json.dumps(data)})
                    if r.status_code == 200:
                        print('%s Wrote queued event %s'
                              %(datetime.datetime.now(), event_id))
                        queue.change_state('new', 'sent', event_id)
                except Exception as e:
                    # Failed to stream event to server
                    print('%s Failed to stream queued event %s: %s'
                          %(datetime.datetime.now(), event_id, e))
                    connected = False

        if len(select.select([pipe_read], [], [], 0)[0]) == 1:
            scan = reader_flo.readline().rstrip('\n')
            print('%s RFID reader said: %s' %(datetime.datetime.now(), scan))

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
                        h.update('%s:%s' %(key, data[key]))
                    data['signature'] = h.hexdigest()

                    queue.store_event('new', event_id, data)
                    data['timestamp-transferred'] = time.time()

                    try:
                        r = requests.put('%s/event/%s' %(config['server'],
                                                         event_id),
                                         data={'data': json.dumps(data)})
                        if r.status_code == 200:
                            print('%s Wrote event %s'
                                  %(datetime.datetime.now(), event_id))
                            queue.change_state('new', 'sent', event_id)
                        else:
                            # Failed to write event to server
                            print('%s Failed to store event %s with HTTP '
                                  'status %s'
                                   %(datetime.datetime.now(), event_id,
                                     r.status_code))

                    except Exception as e:
                        # Failed to stream event to server
                        print('%s Failed to stream event %s: %s'
                              %(datetime.datetime.now(), event_id, e))

            except Exception as e:
                print('%s Ignoring malformed data: %s'
                      %(datetime.datetime.now(), e))

        elif time.time() - last_netcheck_time > 30:
            # Determine IP address
            ipaddress = '...'
            last_netcheck_time = time.time()

            ifconfig = subprocess.check_output('/sbin/ifconfig wlan0',
                                               shell=True)
            for line in str(ifconfig).split('\n'):
                m = INET_RE.match(line)
                if m:
                    ipaddress = m.group(1)
                    print('%s ipaddress is %s' %(datetime.datetime.now(),
                                                 ipaddress))

            # Check for the server
            try:
                connected = False
                r = requests.get('%s/health/%s' %(config['server'],
                                                  config['device-name']))
                print('%s Connectivity check HTTP status code: %s'
                      %(datetime.datetime.now(), r.status_code))
                if r.status_code == 200:
                    connected = True
            except Exception as e:
                print('%s Connectivity check error: %s'
                      %(datetime.datetime.now(), e))

        elif time.time() - last_status_time > 5:
            last_status_time = time.time()
            print('%s Updating status screen' % datetime.datetime.now())
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
    print('%s The RFID reader process exitted with code %d'
          %(datetime.datetime.now(), reader.returncode))

finally:
    TFT.clear((255, 125, 125))
