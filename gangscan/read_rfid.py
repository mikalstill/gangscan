#!/usr/bin/python

import argparse
import hashlib
import json
import sys
import time

import RPi.GPIO as GPIO
GPIO.setwarnings(False)

from mfrc522 import SimpleMFRC522

PIN_IRQ = 19 # (physical pin 35)
PIN_RST = 16 # (physical pin 36)

parser = argparse.ArgumentParser()
parser.add_argument('--presharedkey')
parser.add_argument('--linger', type=int)
args = parser.parse_args()

last_read = None
last_read_time = 0
reader = None


def read_card(channel):
    """Read a card based on getting an interrupt to say we should."""

    global last_read
    global last_read_time
    global reader

    print('Read card')
    sys.stdout.flush()

    try:
        cardid, text = reader.read()
        owner, sig = text.rstrip(' ').split(',')

        h = hashlib.sha256()
        h.update(owner.encode('utf-8'))
        h.update(str(cardid).encode('utf-8'))
        h.update(args.presharedkey.encode('utf-8'))
        s = h.hexdigest()[-6:]

        outcome = True
        if s != sig:
            outcome = False

        data = {'cardid': cardid,
                'owner': owner,
                'sha': sig,
                'outcome': outcome}

        if last_read != data:
            print(json.dumps(data))
            sys.stdout.flush()
            last_read = data
            last_read_time = time.time()

        elif time.time() - last_read_time > args.linger - 1:
            last_read = None
            last_read_time = time.time()

    except Exception as e:
        print('Exception: %s' % e)


try:
    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)
    GPIO.setup(PIN_IRQ, GPIO.IN)   #, pull_up_down=GPIO.PUD_UP)

    reader = SimpleMFRC522(bus=0, device=1, pin_rst=PIN_RST) #, gain=48)

    GPIO.add_event_detect(PIN_IRQ, GPIO.BOTH, callback=read_card)

    while True:
        time.sleep(0.01)

finally:
    GPIO.cleanup()
