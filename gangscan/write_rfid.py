#!/usr/bin/python

# Take a database in the same format as that used by the idcards directory
# and use it to encode cards one at a time in a very annoying manner.
#
# Run like this:
#
# python3 gangscan/write_rfid.py --presharedkey wibble --linger 3 \
#   --startwith "Fred Nerk"

import argparse
import csv
import hashlib
import json
import time

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522(bus=0, device=1, pin_rst=36)

parser = argparse.ArgumentParser()
parser.add_argument('--presharedkey')
parser.add_argument('--linger', type=int)
parser.add_argument('--startwith')
args = parser.parse_args()

processing = False
try:
    with open('idcards/db.csv') as f:
        csvreader = csv.DictReader(f)
        print('We have these fields: %s' % csvreader.fieldnames)
        for row in csvreader:
            owner = ''
            if row['Preferred name'] != '':
                owner += row['Preferred name']
            else:
                owner += row['Firstname']
            owner += ' '
            owner += row['Last name']
            print('Stored owner is %s' % owner)

            if owner != args.startwith and not processing:
                print('...skipping')
                continue

            processing = True

            print('Place card on reader...')
            cardid, text = reader.read()
            print('Card id is %s' % cardid)

            h = hashlib.sha256()
            h.update(owner.encode('utf-8'))
            h.update(str(cardid).encode('utf-8'))
            h.update(args.presharedkey.encode('utf-8'))
            print('Hash is %s' % h.hexdigest())

            attempts = 0
            while attempts < 5:
                try:
                    reader.write('%s%s' %(owner, h.hexdigest()))
                    break
                except Exception as e:
                    print('Write failed (attempt %d): %s' %(attempts, e))
                    attempts +=1

            if attempts >= 5:
                raise Exception('Failed to write')

            print('Written')
            print()

            time.sleep(args.linger)

finally:
    GPIO.cleanup()
