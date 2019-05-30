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
  * `sudo raspi-config`
  * Join wifi (network options)
  * Enable ssh (interfacing options)
  * Expand filesystem (advanced options)
  * Reboot
* Update the operating system:
  * `sudo apt-get update`
  * `sudo apt-get dist-upgrade`
* Install ansible:
  * `sudo apt-get install python3-pip`
  * `sudo pip3 install ansible`
* Install git and vim, then clone gangscan:
  * `sudo apt-get install git vim`
  * `git clone https://github.com/mikalstill/gangscan`
  * `cd gangscan`
  * `git submodule update --init --recursive`

Installation: Gang Server
=========================

The gangserver advertises itself using mdns via avahi. It is assumed that
the server will be running on raspberry pi running debian (called raspbian).
This can be one of the gangscan devices if that is desirable for your
deployment. First follow the common installation steps above, once those
steps are done we have enough of a system to be able to do the rest of the
install via ansible plays.

Run ansible to install gangserver:

~~~~
$ /usr/local/bin/ansible-playbook -i hosts deploy/gangserver.yml
~~~~

This should install all the required software for the gangserver, and start
it on port 80. The server advertises itself on the network using avahi /
zeroconf networking, so you don't need to have the server running on a
machine with a known IP. You can verify that it is being advertized correctly
by browsing all the zeroconf adverts for your network:

~~~~
$ avahi-browse --all | grep gangserver
+  wlan0 IPv6 gangserver                                    _http._tcp     local
+  wlan0 IPv4 gangserver                                    _http._tcp     local
(hit ctrl-c to exit)
~~~~

Installation: Gang Scan
=======================

The RFID reader hardware runs a program called gangscan. To install it,
follow the common installation steps above, and then install gangscan with
ansible:

~~~~
$ /usr/local/bin/ansible-playbook -i hosts deploy/gangscan.yml
~~~~

Because the ansible changes the boot configuraiton of the raspberry pi (it
turns on SPI and PWN audio), you need to reboot before the scanner will work
correctly:

~~~~
$ sudo reboot
~~~~

Checking the status of Gang Scan
================================

Because Gang Scan uses systemd, you can check the status of the various
components using systemd commands. To see the general status of the server,
do this:

~~~~
$ sudo systemctl status gangserver
~~~~

To see recent log messages from the server, do this:

~~~~
$ sudo journalctl -u gangserver
~~~~

Credits
=======

Various parts of Gang Scan draw on previous Open Source or Creative Commons
artifacts:

* Material Design Icons are from https://cdn.materialdesignicons.com/3.5.95/.
** This includes the TTF Font, as well as account.png
* BebaseNeue is licensed under the creative commons and is from https://fontlibrary.org/en/font/bebas
* blip.wav is "Robot Blip" by Marianne Gagnon from http://soundbible.com/1682-Robot-Blip.html which is released under a CC Attribution 3.0 license.
