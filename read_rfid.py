#!/usr/bin/python

import hashlib
import json
import sys
import time

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522(bus=0, device=1, nrstpd=36)

with open('config.json') as f:
    config = json.loads(f.read())

last_read = None
last_read_time = 0

try:
    while True:
        cardid, text = reader.read()
        text = text.rstrip(' ')
        owner = text[:-6]
        sig = text[-6:]

        h = hashlib.sha256()
        h.update(owner)
        h.update(str(cardid))
        h.update(config['pre-shared-key'])
        s = h.hexdigest()[-6:]

        outcome = True
        if s != sig:
            outcome = False

        data = {'cardid': cardid,
                'owner': owner,
                'sha': sig,
                'outcome': outcome}

        if last_read != data:
            print json.dumps(data)
            sys.stdout.flush()
            last_read = data
            last_read_time = time.time()

        elif time.time() - last_read_time > config['name-linger'] - 1:
            last_read = None
            last_read_time = time.time()

finally:
    GPIO.cleanup()
