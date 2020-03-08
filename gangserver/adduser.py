#!/usr/bin/python3

import getpass
import hashlib
import json
import os


# Read config and data
with open(os.path.expanduser('~/gangserver-config.json')) as f:
    config = json.loads(f.read())


username = input('username: ')
password = getpass.getpass('password: ')

h = hashlib.sha256()
h.update(password.encode('utf-8'))
h.update(config['pre-shared-key'].encode('utf-8'))
signature = h.hexdigest()

config['users'][username] = signature

with open(os.path.expanduser('~/gangserver-config.json'), 'w') as f:
    f.write(json.dumps(config, indent=4, sort_keys=True))
