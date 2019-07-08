# Utility methods

import datetime
import json
import os
import re
import requests
import socket
import subprocess
import sys


INET_RE = re.compile(' +inet ([^ ]+) .*')
ETHER_RE = re.compile(' +ether ([^ ]+) .*')


def ifconfig():
    ipaddress = '...'
    macaddress = '...'

    # Determine the interface to look inspect
    uname = subprocess.check_output('uname').rstrip()
    log('Uname says "%s"' % uname)
    if uname == b'Linux':
        interface = 'wlan0'
    elif uname == b'Darwin':
        interface = 'en0'
    else:
        interface = 'eth0'

    ifconfig = subprocess.check_output('/sbin/ifconfig %s' % interface,
                                       shell=True)
    for line in ifconfig.decode('utf-8').split('\n'):
        m = INET_RE.match(line)
        if m:
            ipaddress = m.group(1)
            log('ipaddress is %s' % ipaddress)

        m = ETHER_RE.match(line)
        if m:
            macaddress = m.group(1)
            log('macaddress is %s' % macaddress)

    return ipaddress, macaddress

def uptime():
    log(subprocess.check_output('/usr/bin/uptime', shell=True).decode('utf-8'))


def heartbeat_server(address, port, deviceid):
    connected = False
    config = None

    if address and port:
        try:
            check_url = 'http://%s:%d/health/%s' %(address, port, deviceid)
            r = requests.get(check_url)
            log('Connectivity check URL: %s' % check_url)
            log('Connectivity check HTTP status code: %s' % r.status_code)
            if r.status_code == 200:
                connected = True
                config = json.loads(r.text)

        except Exception as e:
            log('Connectivity check error: %s' % e)

    else:
        log('Not connectivity checking a missing server')

    return connected, config


def log(s):
    sys.stderr.write('%s\n' % s)
    sys.stderr.flush()


def _safe_read_file(path):
    if not os.path.exists(path):
        return None
    with open(path) as f:
        return f.read()[:-1].rstrip()


def hardware_ident():
    if not os.path.exists('/proc/device-tree/hat'):
        return None

    product = _safe_read_file('/proc/device-tree/hat/product')
    version = _safe_read_file('/proc/device-tree/hat/product_ver')

    return product, version
