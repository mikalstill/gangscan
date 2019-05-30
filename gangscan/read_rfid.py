#!/usr/bin/python

import argparse
import hashlib
import json
import sys
import time

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522(bus=0, device=1, pin_rst=36)

parser = argparse.ArgumentParser()
parser.add_argument('presharedkey')
parser.add_argument('linger', type=int)
args = parser.parse_args()

last_read = None
last_read_time = 0

try:
    while True:
        cardid, text = reader.read()
        text = text.rstrip(' ')
        owner = text[:-6]
        sig = text[-6:]

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

finally:
    GPIO.cleanup()
