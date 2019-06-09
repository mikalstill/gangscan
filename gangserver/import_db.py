#!/usr/bin/python

# Take a database in the same format as that used by the idcards directory
# and use it to bootstrap the groupings and status databases.
#
# Run like this:
#
# python3 gangserver/import_db.py

import csv
import json

with open('gangserver/status.json') as f:
    status = json.loads(f.read())

with open('gangserver/groupings.json') as f:
    groupings = json.loads(f.read())

with open('idcards/db.csv') as f:
    csvreader = csv.DictReader(f)
    print('We have these fields: %s' % csvreader.fieldnames)
    for row in csvreader:
        owner = ''
        if row['Preferred name'] != '':
            owner += row['Preferred name']
        else:
            owner += row['Firstname']
        owner += ' '
        owner += row['Last name']

        if not owner in status:
            status[owner] = 'new'

        if not row['Patrol'] in groupings:
            groupings[row['Patrol']] = []

        if not owner in groupings[row['Patrol']]:
            groupings[row['Patrol']].append(owner)

with open('gangserver/status.json', 'w') as f:
    f.write(json.dumps(status, indent=4, sort_keys=True))

with open('gangserver/groupings.json', 'w') as f:
    f.write(json.dumps(groupings, indent=4, sort_keys=True))
