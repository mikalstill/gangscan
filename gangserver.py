#!/usr/bin/python

import datetime
import json
import time

from flask import Flask
from flask import Response
from flask import request
from flask_restful import Api
from flask_restful import Resource

import filequeue


app = Flask(__name__)
api = Api(app)


# Read config
with open('config.json') as f:
    config = json.loads(f.read())
queue = filequeue.FileQueue('gangscan-%s' % config['device-name'])


class Root(Resource):
    def get(self):
        # Do a dance to return HTML not JSON
        resp = Response('<html><body>Gang Server</body></html>',
                        mimetype='text/html')
        resp.status_code = 200
        return resp


class Health(Resource):
    def get(self, device):
        print('%s Health check from %s' %(datetime.datetime.now(), device))
        return 'OK'


class Event(Resource):
    def __init__(self):
        self.queue = filequeue.FileQueue('gangserver-%s'
                                         % config['device-name'])

    def put(self, event_id):
        data = json.loads(request.form['data'])
        data['timestamp-server'] = time.time()

        print('%s Stored event %s: %s'
              %(datetime.datetime.now(), event_id, data))
        self.queue.store_event('received', event_id, data)
        return {event_id: data}


api.add_resource(Root, '/')
api.add_resource(Health, '/health/<string:device>')
api.add_resource(Event, '/event/<string:event_id>')

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
