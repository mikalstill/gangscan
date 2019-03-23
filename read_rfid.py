#!/usr/bin/python

import sys

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522(bus=1, device=0, nrstpd=35)

try:
    cardid, text = reader.read()
    print(cardid)
    print(text)

finally:
    GPIO.cleanup()
