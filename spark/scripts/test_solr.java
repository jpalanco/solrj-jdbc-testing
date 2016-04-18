Map<String, String> options = new HashMap<String, String>();
options.put("url", "jdbc:solr://solr:9983?collection=test");
options.put("dbtable", "test");

DataFrame jdbcDF = sqlContext.read().format("jdbc"). options(options).load();
