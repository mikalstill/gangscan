#!/usr/bin/python

import socket
import time

import util


if __name__ == '__main__':
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.bind(('', 0))
    s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    ip, mac = util.ifconfig()
    util.log('Will advertise server at %s' % ip)

    while True:
        msg = 'gangserver_advert %s:80' % ip
        s.sendto(msg.encode('utf-8'), ('<broadcast>', 5000))
        util.log('Advertised gangserver at %s:80' % ip)
        time.sleep(5)
