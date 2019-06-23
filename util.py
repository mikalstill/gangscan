# Utility methods

import datetime
import json
import os
import re
import requests
import socket
import subprocess
import sys
import zeroconf


INET_RE = re.compile(' +inet ([^ ]+) .*')
ETHER_RE = re.compile(' +ether ([^ ]+) .*')


def ifconfig():
    ipaddress = '...'
    macaddress = '...'

    ifconfig = subprocess.check_output('/sbin/ifconfig wlan0', shell=True)
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


def heartbeat_and_update_config(process, config, server_address, server_port):
    config_path = os.path.expanduser('~/.%s.json' % process)
    ipaddress, macaddress = ifconfig()

    connected = False
    if server_address:
        connected, config = heartbeat_server(server_address, server_port,
                                             macaddress)

        if connected and config:
            with open(config_path, 'w') as f:
                f.write(json.dumps(config, indent=4, sort_keys=True))

    log('Heartbeat is returning this config: %s' % config)
    return connected, config, server_address, server_port


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
