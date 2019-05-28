Introduction
============

Gang Scan is a simple attendance tracking system built for Scouts ACT's
Canberra Gang Show. It uses custom RFID badge reader devices based on
Raspberry Pis to track badge read events, which are streamed to a server.
Each badge reader is configured to either be an "in" or and "out" reader, and
therefore attendance can be calculated. The badge readers will queue scan
events and stream them to the server later if connectivity is intermittent.

Structure
=========

The structure of this repository is:

* deploy: deployment scripts.
* eagle: PCB layouts for the gang scan hardware.
* gangscan: the software stack for the badge readers.
* gangserver: the server side of the application.
* vendor: git sub-modules for dependancies.

Installation: Common Steps
==========================

First off, flash the latest raspberry pi debian to an SD card. You can find
it at https://www.raspberrypi.org/downloads/raspbian/ . I have been using the
Debian Stretch Lite image for development. I use Balena Etcher to flash the
SD cards, and this process is well documented elsewhere.

Insert this SD card into your raspberry pi and boot it. You'll need to have
the raspberry pi plugged into a HDMI monitor and USB keyboard and mouse for
the next steps.

* Log in: username is "pi" and password is "raspberry".
* Change the password: "passwd".
* Configure the pi:
  * sudo raspi-config
  * Join wifi (network options)
  * Enable ssh (interfacing options)
  * Expand filesystem (advanced options)
  * Reboot
* Update the operating system:
  * sudo apt-get update
  * sudo apt-get dist-upgrade
* Install ansible:
  * sudo apt-get install ansible
* Install git and clone gangscan:
  * sudo apt-get install git
  * git clone https://github.com/mikalstill/gangscan

Installation: Gang Server
=========================

The gangserver advertises itself using mdns via avahi. It is assumed that
the server will be running on raspberry pi running debian (called raspbian).
This can be one of the gangscan devices if that is desirable for your
deployment. First follow the common installation steps above, once those
steps are done we have enough of a system to be able to do the rest of the
install via ansible plays.




Credits
=======

Various parts of Gang Scan draw on previous Open Source or Creative Commons
artifacts:

* Material Design Icons are from https://cdn.materialdesignicons.com/3.5.95/.
** This includes the TTF Font, as well as account.png
* BebaseNeue is licensed under the creative commons and is from https://fontlibrary.org/en/font/bebas
* blip.wav is "Robot Blip" by Marianne Gagnon from http://soundbible.com/1682-Robot-Blip.html which is released under a CC Attribution 3.0 license.
