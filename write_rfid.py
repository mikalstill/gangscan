#!/usr/bin/python

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522()

try:
    reader.write('This is a card!')
    print 'Written'
finally:
    GPIO.cleanup()
