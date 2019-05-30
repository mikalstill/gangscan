# Utility methods

import datetime
import json
import re
import requests
import socket
import subprocess
import zeroconf


INET_RE = re.compile(' +inet ([^ ]+) .*')
ETHER_RE = re.compile(' +ether ([^ ]+) .*')


def ifconfig():
    ipaddress = '...'
    macaddress = '...'

    ifconfig = subprocess.check_output('/sbin/ifconfig wlan0', shell=True)
    for line in str(ifconfig).split('\n'):
        m = INET_RE.match(line)
        if m:
            ipaddress = m.group(1)
            print('%s ipaddress is %s' %(datetime.datetime.now(),
                                         ipaddress))

        m = ETHER_RE.match(line)
        if m:
            macaddress = m.group(1)
            print('%s macaddress is %s' %(datetime.datetime.now(),
                                          macaddress))

    return ipaddress, macaddress


def lookup_server():
    zc = zeroconf.Zeroconf()
    si = zc.get_service_info('_http._tcp.local.',
                             'gangserver._http._tcp.local.')
    server_address = socket.inet_ntoa(si.address)
    server_port = int(si.port)
    print('%s Found server at %s:%d' %(datetime.datetime.now(),
                                       server_address,
                                       server_port))

    return server_address, server_port


def heartbeat_server(address, port, deviceid):
    connected = False
    config = None

    try:
        check_url = 'http://%s:%d/health/%s' %(address, port, deviceid)
        r = requests.get(check_url)
        print('%s Connectivity check URL: %s'
              %(datetime.datetime.now(), check_url))
        print('%s Connectivity check HTTP status code: %s'
              %(datetime.datetime.now(), r.status_code))
        if r.status_code == 200:
            connected = True
            config = json.loads(r.text)

    except Exception as e:
        print('%s Connectivity check error: %s'
              %(datetime.datetime.now(), e))

    return connected, config
