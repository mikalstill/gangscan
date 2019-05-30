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

import filequeue


app = Flask(__name__)
api = Api(app)


# Read config and data
with open('gangserver/config.json') as f:
    config = json.loads(f.read())

queue = filequeue.FileQueue('gangscan-%s' % config['device-name'])
mimetypes.init()


class Root(Resource):
    def get(self):
        # Read template and data
        with open('gangserver/report.html.tmpl') as f:
            t = Template(f.read())
        with open('gangserver/groupings.json') as f:
            groupings = json.loads(f.read())
        with open('gangserver/status.json') as f:
            status = json.loads(f.read())

        # Rearrange the data
        person_to_group = {}
        for group in groupings:
            for person in groupings[group]:
                person_to_group[person] = group
        
        by_group = {}
        for person in status:
            by_group.setdefault(person_to_group[person], {})
            by_group[person_to_group[person]].setdefault('in', [])
            by_group[person_to_group[person]].setdefault('out', [])
            by_group[person_to_group[person]][status[person]].append(person)

        in_groups = []
        out_groups = []
        for group in by_group:
            in_groups.append({
                'name': group,
                'members': by_group[group]['in']
            })
            out_groups.append({
                'name': group,
                'members': by_group[group]['out']
            })
        
        # Do a dance to return HTML not JSON
        resp = Response(
            t.render(
                timestamp=str(datetime.datetime.now()),
                in_groups=in_groups,
                out_groups=out_groups
            ),
            mimetype='text/html')
        resp.status_code = 200
        return resp


class Local(Resource):
    def get(self, path):
        filepath = os.path.join('gangserver/local', path.replace('..', ''))
        if not os.path.exists(filepath):
            abort(404)

        mime = mimetypes.MimeTypes().guess_type(filepath)[0]
        return send_file(
            os.path.join('local', path),
            mimetype=mime)


class Health(Resource):
    def get(self, device):
        print('%s Health check from %s' %(datetime.datetime.now(), device))
        return {'device-name': device,
                'location': 'demo',
                'pre-shared-key': config['pre-shared-key'],
                'name-linger': config['name-linger']}


class Event(Resource):
    def __init__(self):
        self.queue = filequeue.FileQueue('gangserver-%s'
                                         % config['device-name'])

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
        with open('gangserver/status.json') as f:
            status = json.loads(f.read())
        status[data['owner']] = data['location']
        with open('gangserver/status.json', 'w') as f:
            f.write(json.dumps(status, indent=4, sort_keys=True))

        print('%s Stored event %s: %s'
              %(datetime.datetime.now(), event_id, data))
        self.queue.store_event('received', event_id, data)
        return {event_id: data}


api.add_resource(Root, '/')
api.add_resource(Local, '/local/<string:path>')
api.add_resource(Health, '/health/<string:device>')
api.add_resource(Event, '/event/<string:event_id>')

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
