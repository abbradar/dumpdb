#!/usr/bin/env python3

import psycopg2
import json
 
connstr = "dbname=shlomo"
outfile = "output.json"

conn = psycopg2.connect(connstr)
cursor = conn.cursor()
 
cursor.execute("""
            SELECT *
            FROM person
            """)

with open(outfile, "w") as of:
  for record in cursor:
    t = { 'id': record[0],
          'name': record[1],
          'age': record[2]
        }
    json.dump(t, of)
 
conn.close()
