#!/usr/bin/python

import hashlib
import json
import sys

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522(bus=1, device=0, nrstpd=36)

with open('config.json') as f:
    config = json.loads(f.read())

last_read = None
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

finally:
    GPIO.cleanup()
