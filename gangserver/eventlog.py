# Storage and reporting for scan events

import sqlite3


def dict_factory(cursor, row):
    d = {}
    for idx, col in enumerate(cursor.description):
        d[col[0]] = row[idx]
    return d


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

        conn.commit()
        conn.close()

    def add(self, uuid, cardid, device, location, owner, timestamp_device,
            timestamp_server):
        conn = sqlite3.connect(self.path)

        cursor = conn.cursor()
        cursor.execute('INSERT INTO events(uuid, cardid, device, location, '
                       'owner, timestamp_device, timestamp_server) '
                       'VALUES(?, ?, ?, ?, ?, ?, ?);',
                       (uuid, cardid, device, location, owner,
                        timestamp_device, timestamp_server))

        conn.commit()
        conn.close()

    def list_all(self):
        conn = sqlite3.connect(self.path)
        conn.row_factory = dict_factory

        cursor = conn.cursor()
        cursor.execute('SELECT * FROM events ORDER BY timestamp_device DESC '
                       'LIMIT 300;')
        for row in cursor.fetchall():
            yield row

        conn.close()

    def list_one(self, owner):
        conn = sqlite3.connect(self.path)
        conn.row_factory = dict_factory

        cursor = conn.cursor()
        cursor.execute('SELECT * FROM events WHERE owner=? '
                       'ORDER BY timestamp_device DESC '
                       'LIMIT 300;', [owner])
        for row in cursor.fetchall():
            yield row

        conn.close()
