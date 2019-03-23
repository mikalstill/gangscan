#!/usr/bin/python

# tft24T modified by BehindTheSciences.com
# Credits to  Brian Lavery

#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so.

# A demo of LCD/TFT SCREEN DISPLAY

import time
import RPi.GPIO as GPIO

from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont

from lib_tft24T import TFT24T
import spidev

# For LCD TFT SCREEN:
DC = 24
RST = 25
LED = 23

# Setup GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Initialize display.
TFT = TFT24T(spidev.SpiDev(), GPIO, landscape=False)
TFT.initLCD(DC, RST, LED)

# Objects we need to draw things
draw = TFT.draw()
font = ImageFont.truetype('FreeSerifItalic.ttf', 40)
logo = Image.open('gangscan.jpeg')
logo = logo.rotate(90, 0, 1).resize((240, 320))

TFT.display(logo)
draw.textwrapped((0,0), 'online: 192.168.1.1', 38, 20, font, 'lightblue')
TFT.display()

time.sleep(60)
