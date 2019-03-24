#!/usr/bin/python

import hashlib
import json

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522(bus=1, device=0, nrstpd=3)

with open('config.json') as f:
    config = json.loads(f.read())

try:
    owner = raw_input('Card owner: ')
    owner = owner[:64 - 7]
    print('Stored owner is %s' % owner)

    print('Place card on reader...')
    cardid, text = reader.read()
    print('Card id is %s' % cardid)

    h = hashlib.sha256()
    h.update(owner)
    h.update(str(cardid))
    h.update(config['pre-shared-key'])
    print('Full hash is %s' % h.hexdigest())
    s = h.hexdigest()[-6:]
    print('Short hash is %s' % s)
    
    reader.write('%s%s' %(owner, s))
    print 'Written'
finally:
    GPIO.cleanup()
