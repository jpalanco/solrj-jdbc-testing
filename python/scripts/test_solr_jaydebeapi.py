#!/usr/bin/env python

# https://pypi.python.org/pypi/JayDeBeApi/

import jaydebeapi
import sys

if __name__ == '__main__':
  jdbc_url = "jdbc:solr://solr:9983?collection=test"
  driverName = "org.apache.solr.client.solrj.io.sql.DriverImpl"
  statement = "select fielda, fieldb, fieldc, fieldd_s, fielde_i from test limit 10"

  conn = jaydebeapi.connect(driverName, jdbc_url)
  curs = conn.cursor()
  curs.execute(statement)
  print(curs.fetchall())

  conn.close()

  sys.exit(0)
