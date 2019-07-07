# Storage and reporting for scan events

import sqlite3


class Log(object):
    def __init__(self, path):
        self.path = path

        conn = sqlite3.connect(self.path)
        conn.execute('CREATE TABLE IF NOT EXISTS events('
                     'uuid TEXT PRIMARY KEY, '
                     'cardid text, '
                     'device text, '
                     'location text, '
                     'owner text, '
                     'timestamp_device INTEGER, '
                     'timestamp_server INTEGER);')
        conn.execute('CREATE INDEX IF NOT EXISTS '
                     'idx_events_owner ON events(owner);')
        conn.execute('CREATE INDEX IF NOT EXISTS '
                     'idx_events_timestamp_device ON '
                     'events(timestamp_device);')
        conn.close()

    def add(self, uuid, cardid, device, location, owner, timestamp_device,
            timestamp_server):
        conn = sqlite3.connect(self.path)
        conn.execute('INSERT INTO events(uuid, cardid, device, location, '
                     'owner, timestamp_device, timestamp_server) '
                     'VALUES(?, ?, ?, ?, ?, ?, ?);',
                     (uuid, cardid, device, location, owner,
                      timestamp_device, timestamp_server))
        conn.close()
