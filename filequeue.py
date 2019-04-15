#!/usr/bin/python

import json
import os


class FileQueue(object):
    def __init__(self, queue_name):
        self.queue_dir = 'queue-%s' % queue_name

        if not os.path.exists(self.queue_dir):
            os.mkdir(self.queue_dir)

    def get_event(self, state_name):
        state_dir = os.path.join(self.queue_dir, state_name)
        if not os.path.exists(state_dir):
            os.makedirs(state_dir)

        for ent in os.listdir(state_dir):
            return ent

        return None

    def count_events(self, state_name):
        state_dir = os.path.join(self.queue_dir, state_name)
        if not os.path.exists(state_dir):
            os.makedirs(state_dir)

        return len(os.listdir(state_dir))

    def read_event(self, state_name, event_id):
        state_dir = os.path.join(self.queue_dir, state_name)
        with open(os.path.join(state_dir, event_id)) as f:
            return json.loads(f.read())

    def store_event(self, state_name, event_id, data):
        state_dir = os.path.join(self.queue_dir, state_name)
        if not os.path.exists(state_dir):
            os.makedirs(state_dir)

        with open(os.path.join(state_dir, event_id), 'w') as f:
            f.write(json.dumps(data, indent=4, sort_keys=True))

    def change_state(self, old_state, new_state, event_id):        
        if not os.path.exists(os.path.join(self.queue_dir, new_state)):
            os.makedirs(os.path.join(self.queue_dir, new_state))

        os.rename(
            os.path.join(os.path.join(self.queue_dir, old_state, event_id)),
            os.path.join(os.path.join(self.queue_dir, new_state, event_id)))
