#!/usr/bin/python3

import datetime
import json
import mimetypes
import os
import time

from flask import abort
from flask import Flask
from flask import Response
from flask import request
from flask import send_file
from flask_restful import Api
from flask_restful import Resource

from jinja2 import Template

import eventlog
import filequeue
import util


app = Flask(__name__)
api = Api(app)


ipaddress, macaddress = util.ifconfig()

# Read config and data
with open(os.path.expanduser('~/gangserver-config.json')) as f:
    config = json.loads(f.read())

queue = filequeue.FileQueue(os.path.expanduser('~/gangserver-%s' % macaddress))
mimetypes.init()
event_log = eventlog.Log(os.path.expanduser('~/gangserver-eventlog.sqlite'))


class Root(Resource):
    def get(self):
        # Read template and data
        with open('gangserver/report.html.tmpl') as f:
            t = Template(f.read())
        with open(os.path.expanduser('~/gangserver-groupings.json')) as f:
            groupings = json.loads(f.read())
        with open(os.path.expanduser('~/gangserver-status.json')) as f:
            status = json.loads(f.read())

        # Determine possible statuses
        statuses = []
        for person in status:
            if not status[person] in statuses:
                statuses.append(status[person])

        # Is a filter being used?
        filter = request.args.get('filter')

        # Rearrange the data
        groups = []
        for group in groupings:
            members = []
            for person in groupings[group]:
                where = status[person]
                if not filter or filter == where:
                    members.append({'name': person,
                                    'location': where})

            groups.append({
                'name': group,
                'members': members
            })

        # Do a dance to return HTML not JSON
        resp = Response(
            t.render(
                timestamp=str(datetime.datetime.now()),
                groups=groups,
                statuses=sorted(statuses),
            ),
            mimetype='text/html')
        resp.status_code = 200
        return resp


class Event(Resource):
    def __init__(self):
        self.queue = filequeue.FileQueue(
            os.path.expanduser('~/gangserver-%s' % macaddress))

    def put(self, event_id):
        data = json.loads(request.form['data'])
        data['timestamp-server'] = time.time()

        # Events look like this:
        # {
        #     "cardid": 744452027206, 
        #     "device": "gangscan1", 
        #     "event_id": "5362ef36-3f43-41d5-b7ac-e47b400a664f", 
        #     "location": "out", 
        #     "outcome": true, 
        #     "owner": "Ben Ellis", 
        #     "sha": "35ef6d", 
        #     "signature": "55e1ffa7b1...cb54463f98f46b578", 
        #     "timestamp-device": 1553634527.921784, 
        #     "timestamp-server": 1553634528.421658, 
        #     "timestamp-transferred": 1553634527.924872
        # }
        with open(os.path.expanduser('~/gangserver-status.json')) as f:
            status = json.loads(f.read())
        status[data['owner']] = data['location']
        with open(os.path.expanduser('~/gangserver-status.json'), 'w') as f:
            f.write(json.dumps(status, indent=4, sort_keys=True))

        util.log('Stored event %s: %s' %(event_id, data))
        self.queue.store_event('received', event_id, data)

        event_log.add(event_id, data['cardid'], data['device'],
                      data['location'], data['owner'],
                      data['timestamp-device'], data['timestamp-server'])
        queue.change_state('received', 'logged', event_id)
        util.log('Logged event %s' % event_id)

        return {event_id: data}


class EventLog(Resource):
    def get(self):
        # Read template and data
        with open('gangserver/eventlog.html.tmpl') as f:
            t = Template(f.read())

        # Is a filter being used?
        filter = request.args.get('filter')
        if filter:
            query = event_log.list_one(filter)
        else:
            query = event_log.list_all()

        rows = []
        for row in query:
            row['timestamp'] = datetime.datetime.fromtimestamp(
                row['timestamp_device'])
            rows.append(row)

        # Do a dance to return HTML not JSON
        resp = Response(
            t.render(
                timestamp=str(datetime.datetime.now()),
                rows=rows,
            ),
            mimetype='text/html')
        resp.status_code = 200
        return resp


class Health(Resource):
    def get(self, device):
        util.log('Health check from %s' % device)
        returned_config = {'device-name': device,
                           'location': config['devices'].get(device, '???'),
                           'pre-shared-key': config['pre-shared-key'],
                           'name-linger': config['name-linger']}
        util.log('Returning config: %s' % returned_config)
        return returned_config


class Local(Resource):
    def get(self, path):
        filepath = os.path.join('gangserver/local', path.replace('..', ''))
        if not os.path.exists(filepath):
            abort(404)

        mime = mimetypes.MimeTypes().guess_type(filepath)[0]
        return send_file(
            os.path.join('local', path),
            mimetype=mime)


api.add_resource(Root, '/')
api.add_resource(Event, '/event/<string:event_id>')
api.add_resource(EventLog, '/eventlog')
api.add_resource(Health, '/health/<string:device>')
api.add_resource(Local, '/local/<string:path>')

# Process old received events
queue = filequeue.FileQueue(os.path.expanduser('~/gangserver-%s'
                                               % macaddress))

util.log('There are %d old events' % queue.count_events('received'))
event_id = queue.get_event('received')
while event_id:
    data = queue.read_event('received', event_id)
    event_log.add(event_id, data['cardid'], data['device'],
                  data['location'], data['owner'],
                  data['timestamp-device'], data['timestamp-server'])
    queue.change_state('received', 'logged', event_id)
    util.log('Logged old event %s' % event_id)

    event_id = queue.get_event('received')


if __name__ == '__main__':
    # Note this is not run with the flask task runner...
    app.run(host='0.0.0.0', debug=True)
