package org.apache.solr.client.solrj;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;

public class SolrJJDBCTestingJava {
  private static final Logger LOGGER = LoggerFactory.getLogger(SolrJJDBCTestingJava.class);

  public static void main(String[] args) throws Exception {
    String sql = args[0];

    try (Connection con = DriverManager.getConnection("jdbc:solr://solr:9983?collection=test")) {
      try (Statement stmt = con.createStatement()) {
        try (ResultSet rs = stmt.executeQuery(sql)) {
          ResultSetMetaData rsMetaData = rs.getMetaData();
          int columns = rsMetaData.getColumnCount();
          StringBuilder header = new StringBuilder();
          for(int i = 1; i < columns + 1; i++) {
            header.append(rsMetaData.getColumnLabel(i)).append(",");
          }
          LOGGER.info(header.toString());

          while (rs.next()) {
            StringBuilder row = new StringBuilder();
            for(int i = 1; i < columns + 1; i++) {
              row.append(rs.getObject(i)).append(",");
            }
            LOGGER.info(row.toString());
          }
        }
      }
    }
  }
}
