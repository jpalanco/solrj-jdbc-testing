#!/usr/bin/env jython

# http://www.jython.org/jythonbook/en/1.0/DatabasesAndJython.html
# https://wiki.python.org/jython/DatabaseExamples#SQLite_using_JDBC

import sys

from java.lang import Class
from java.sql  import DriverManager, SQLException

if __name__ == '__main__':
  jdbc_url = "jdbc:solr://solr:9983?collection=test"
  driverName = "org.apache.solr.client.solrj.io.sql.DriverImpl"
  statement = "select fielda, fieldb, fieldc, fieldd_s, fielde_i from test limit 10"

  dbConn = DriverManager.getConnection(jdbc_url)
  stmt = dbConn.createStatement()
  
  resultSet = stmt.executeQuery(statement)
  while resultSet.next():
    print(resultSet.getString("fielda"))

  resultSet.close()
  stmt.close()
  dbConn.close()
  
  sys.exit(0)
