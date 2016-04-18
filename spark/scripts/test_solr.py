df = sqlContext.read.format('jdbc').options(url='jdbc:solr://solr:9983?collection=test', dbtable='test').load()
