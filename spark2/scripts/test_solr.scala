val jdbcDF = spark.read.format("jdbc").options(Map("url" -> "jdbc:solr://solr:9983?collection=test", "dbtable" -> "test")).load()

:quit
