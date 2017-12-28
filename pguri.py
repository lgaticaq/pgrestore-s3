#!/usr/bin/env python

import os
from urlparse import urlparse

uri = os.environ['POSTGRESQL_URI']
data = urlparse(uri)
port = data.port or 5432
dbname = data.path[1:]
cmd = (
    'PGPASSWORD=%s pg_restore --verbose --clean --no-acl --no-owner -h %s -p '
    '%s -U %s -d %s %s' % (
        data.password, data.hostname, port, data.username, dbname,
        '/backup/latest.dump'
    )
)
print(cmd)
