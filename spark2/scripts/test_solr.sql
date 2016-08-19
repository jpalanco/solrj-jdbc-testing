CREATE TEMPORARY TABLE jdbcTable
USING org.apache.spark.sql.jdbc
OPTIONS (
  url "jdbc:solr://solr:9983?collection=test",
  dbtable "test"
);

SELECT * FROM jdbcTable;
