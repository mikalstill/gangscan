#!/usr/bin/python

import csv
import gzip
import RPi.GPIO as GPIO
import soundfile
import spidev
import time

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

data, samplerate = soundfile.read('blip.wav')
print 'WAV file sample rate is %d' % samplerate
maxval = pow(2, 12) - 1

# This is just here so I could do some visualization of the waveform elsewhere
csvfile = open('blip.csv', 'w')
csvwriter = csv.DictWriter(csvfile, fieldnames=['Frame', 'Value'])
csvwriter.writeheader()

start_time = time.time()
samples = []
i = 0
for d in data:
    # Just grab one channel, which is a float between -1 and +1
    d = d[0]

    # Scale d to the maximum range
    d *= maxval / 2

    # Shift the value's midpoint
    d += maxval / 2
    csvwriter.writerow({'Frame': i,
                        'Value': int(d)})
    i += 1

    try:
        # Channel 0 is 0x3000, channel 1 is 0xB000
        output = 0x3000
        output |= int(d)
        buf0 = (output >> 8) & 0xFF
        buf1 = output & 0xFF

        samples.append((buf0, buf1))

    except:
        pass

print 'Preparing took %.02f seconds' %(time.time() - start_time)

cs = 8
spi = spidev.SpiDev(0, 0)

# Toggling CS is handled by the spidev library, as long as we've set it up
# as an output already.
GPIO.setup(cs, GPIO.OUT)
GPIO.output(cs, 1)

try:
    while True:
        start_time = time.time()

        for s in samples:
            #GPIO.output(cs, 0)
            spi.xfer(s)
            #GPIO.output(cs, 1)
        print 'Took %.02f seconds' %(time.time() - start_time)

        # spi.xfer3(samples, int(samplerate * 26))
        
finally:
    # Drive the output channel at zero to stop noise from a floating line
    output = 0x3000
    buf0 = (output >> 8) & 0xff
    buf1 = output & 0xff
    spi.xfer([buf0, buf1])

    GPIO.cleanup()
