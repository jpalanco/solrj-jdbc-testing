#!/usr/bin/env jython

# http://www.jython.org/jythonbook/en/1.0/DatabasesAndJython.html
# https://wiki.python.org/jython/DatabaseExamples#SQLite_using_ziclix

import sys

from com.ziclix.python.sql import zxJDBC

if __name__ == '__main__':
  jdbc_url = "jdbc:solr://solr:9983?collection=test"
  driverName = "org.apache.solr.client.solrj.io.sql.DriverImpl"
  statement = "select fielda, fieldb, fieldc, fieldd_s, fielde_i from test limit 10"

  with zxJDBC.connect(jdbc_url, None, None, driverName) as conn:
    with conn:
      with conn.cursor() as c:
        c.execute(statement)
        print(c.fetchall())

  sys.exit(0)
