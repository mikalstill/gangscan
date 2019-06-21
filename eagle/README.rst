Board notes:

* v0.1: the first board to be fabbed. Has LCD and RFID on different SPI buses.
* ... (incremental tweaking including better track sizing, and nicer labels)
* v0.6: the second board to be fabbed. Has LCD and RFID on different SPI buses, and prototype
  audio support. Unfortunately, SPI1 conflicts with the audio hardware and the RFID reader
  needs to be moved onto SPI0 for this to work correctly.
* v0.7: tweaked footprint labels to be more accurate. Moved RFID reader onto SPIO bus to free
  up pins for audio. Corrected MKT capacitor pitch to 5mm.
* v0.8: correct resistor pitch (RCL_0207/7); connect RFID IRQ line to Raspberry Pi for
  later use (reduce CPU load for RFID reads by avoiding polling); moved LiPo socket down a
  little so the JST connector fits more naturally into a case; added an i2c EEPROM to
  comply with the HAT specification.
