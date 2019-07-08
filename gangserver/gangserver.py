#!/usr/bin/python3

import datetime
import flask
import flask_restful
import hashlib
import jinja2
import json
import mimetypes
import os
import requests
import time
import uuid

import eventlog
import filequeue
import util


# Read config and data
with open(os.path.expanduser('~/gangserver-config.json')) as f:
    config = json.loads(f.read())


app = flask.Flask(__name__)
app.secret_key = config['pre-shared-key']
api = flask_restful.Api(app)


ipaddress, macaddress = util.ifconfig()

queue = filequeue.FileQueue(os.path.expanduser('~/gangserver-%s' % macaddress))
mimetypes.init()
event_log = eventlog.Log(os.path.expanduser('~/gangserver-eventlog.sqlite'))


class Root(flask_restful.Resource):
    def get(self):
        # Enforce logins
        if 'username' in flask.session:
            username = flask.escape(flask.session['username'])
        else:
            return flask.redirect('/login')

        # Read template and data
        with open('gangserver/report.html.tmpl') as f:
            t = jinja2.Template(f.read())
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
        filter = flask.request.args.get('filter')

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
        resp = flask.Response(
            t.render(
                timestamp=str(datetime.datetime.now()),
                groups=groups,
                statuses=sorted(statuses),
                username=username,
            ),
            mimetype='text/html')
        resp.status_code = 200
        return resp


class Event(flask_restful.Resource):
    def put(self, event_id):
        data = json.loads(flask.request.form['data'])
        return process_event(data)


class EventLog(flask_restful.Resource):
    def get(self):
        # Enforce logins
        if 'username' in flask.session:
            username = flask.escape(flask.session['username'])
        else:
            return flask.redirect('/login')

        # Read template and data
        with open('gangserver/eventlog.html.tmpl') as f:
            t = jinja2.Template(f.read())

        # Is a filter being used?
        filter = flask.request.args.get('filter')
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
        resp = flask.Response(
            t.render(
                timestamp=str(datetime.datetime.now()),
                rows=rows,
            ),
            mimetype='text/html')
        resp.status_code = 200
        return resp


class Health(flask_restful.Resource):
    def get(self, device):
        util.log('Health check from %s' % device)
        returned_config = {'device-name': device,
                           'location': config['devices'].get(device, '???'),
                           'pre-shared-key': config['pre-shared-key'],
                           'name-linger': config['name-linger']}
        util.log('Returning config: %s' % returned_config)
        return returned_config


class Local(flask_restful.Resource):
    def get(self, path):
        filepath = os.path.join('gangserver/local', path.replace('..', ''))
        if not os.path.exists(filepath):
            flask.abort(404)

        mime = mimetypes.MimeTypes().guess_type(filepath)[0]
        return flask.send_file(
            os.path.join('local', path),
            mimetype=mime)


class Login(flask_restful.Resource):
    def get(self):
        return self._get_with_message('')

    def _get_with_message(self, message):
        # Read template and data
        with open('gangserver/login.html.tmpl') as f:
            t = jinja2.Template(f.read())

        # Do a dance to return HTML not JSON
        resp = flask.Response(
            t.render(message=message),
            mimetype='text/html')
        resp.status_code = 200
        return resp

    def post(self):
        username = flask.request.form['username']
        password = flask.request.form['password']

        if not username in config.get('users', {}):
            util.log('User %s not found' % username)
            return self._get_with_message('Incorrect username or password.')

        h = hashlib.sha256()
        h.update(password.encode('utf-8'))
        h.update(config['pre-shared-key'].encode('utf-8'))
        signature = h.hexdigest()

        util.log('Auth for user %s, comparing %s with %s'
                 %(username, config['users'].get(username), signature))
        if signature != config['users'].get(username):
            return self._get_with_message('Incorrect username or password.')

        flask.session['username'] = username
        return flask.redirect('/')


class Logout(flask_restful.Resource):
    def get(self):
        # Enforce logins
        if 'username' in flask.session:
            username = flask.escape(flask.session['username'])
        else:
            return flask.redirect('/login')

        flask.session.pop('username', None)
        return flask.redirect('/login')


class ManualEvent(flask_restful.Resource):
    def get(self):
        # Enforce logins
        if 'username' in flask.session:
            username = flask.escape(flask.session['username'])
        else:
            return flask.redirect('/login')

        # Read template and data
        with open('gangserver/manualevent.html.tmpl') as f:
            t = jinja2.Template(f.read())

        # Do a dance to return HTML not JSON
        resp = flask.Response(
            t.render(),
            mimetype='text/html')
        resp.status_code = 200
        return resp

    def post(self):
        # Enforce logins
        if 'username' in flask.session:
            username = flask.escape(flask.session['username'])
        else:
            return flask.redirect('/login')

        data = {
            'cardid': 'webui',
            'device': str(username),
            'event_id': str(uuid.uuid4()),
            'location': flask.request.form['location'],
            'outcome': True,
            'owner': flask.request.form['person'],
            'sha': None,
            'timestamp-device': time.time()
            }

        h = hashlib.sha256()
        for key in data:
            s = '%s:%s' %(key, data[key])
            h.update(s.encode('utf-8'))
        data['signature'] = h.hexdigest()

        process_event(data)
        return flask.redirect('/')


def process_event(data):
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
    #     "timestamp-server": 1553634528.421658
    # }
    data['timestamp-server'] = time.time()

    with open(os.path.expanduser('~/gangserver-status.json')) as f:
        status = json.loads(f.read())
    status[data['owner']] = data['location']
    with open(os.path.expanduser('~/gangserver-status.json'), 'w') as f:
        f.write(json.dumps(status, indent=4, sort_keys=True))

    util.log('Stored event %s: %s' %(data['event_id'], data))
    queue.store_event('received', data['event_id'], data)

    event_log.add(data['event_id'], data['cardid'], data['device'],
                  data['location'], data['owner'],
                  data['timestamp-device'], data['timestamp-server'])
    queue.change_state('received', 'logged', data['event_id'])
    util.log('Logged event %s' % data['event_id'])

    return {data['event_id']: data}


api.add_resource(Root, '/')
api.add_resource(Event, '/event/<string:event_id>')
api.add_resource(EventLog, '/eventlog')
api.add_resource(Health, '/health/<string:device>')
api.add_resource(Local, '/local/<string:path>')
api.add_resource(Login, '/login')
api.add_resource(Logout, '/logout')
api.add_resource(ManualEvent, '/manualevent')

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
