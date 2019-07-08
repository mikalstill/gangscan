# Cache client configuration across restarts

import json
import os

import util


class ConfigManager(object):
    def __init__(self):
        self.config = {}
        self.config_path = os.path.expanduser('~/.gangscan.json')

        if os.path.exists(self.config_path):
            with open(self.config_path) as f:
                self.config = json.loads(f.read())

        self.heartbeat()

    def get(self, key, default=None):
        return self.config.get(key, default)

    def set(self, key, value):
        self.config[key] = value
        with open(self.config_path, 'w') as f:
            f.write(json.dumps(self.config, indent=4, sort_keys=True))

    def heartbeat(self):        
        ipaddress, macaddress = util.ifconfig()
        self.config['ipaddress'] = ipaddress
        self.config['macaddress'] = macaddress

        if self.config.get('server_address') and self.config.get('server_port'):
            connected, newconfig = util.heartbeat_server(
                self.get('server_address'), self.get('server_port'),
                self.get('macaddress'))

            if connected and newconfig:
                for key in newconfig:
                    self.set(key, newconfig[key])
