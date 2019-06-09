#!/usr/bin/python

# Take a database in the same format as that used by the idcards directory
# and use it to encode cards one at a time in a very annoying manner.

import csv
import hashlib
import json

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522(bus=0, device=1, pin_rst=36)

parser = argparse.ArgumentParser()
parser.add_argument('--presharedkey')
parser.add_argument('--linger', type=int)
args = parser.parse_args()

with open('db.csv') as f:
    reader = csv.DictReader(f)
    print('We have these fields: %s' % reader.fieldnames)
    for row in reader:

try:
    owner = ''
    if row['Preferred name'] != '':
        owner += row['Preferred name'])
    else:
        owner += row['Firstname'])
    owner += ' '
    owner += row['Last name']
    print('Stored owner is %s' % owner)

    print('Place card on reader...')
    cardid, text = reader.read()
    print('Card id is %s' % cardid)

    h = hashlib.sha256()
    h.update(owner.encode('utf-8'))
    h.update(str(cardid).encode('utf-8'))
    h.update(args.presharedkey.encode('utf-8'))
    print('Hash is %s' % h.hexdigest())
    reader.write('%s%s' %(owner, h.hexdigest()))
    print 'Written'

    time.sleep(args.linger)

finally:
    GPIO.cleanup()
