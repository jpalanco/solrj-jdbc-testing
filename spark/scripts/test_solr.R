library(SparkR)

sc <- sparkR.init()
sqlContext <- sparkRSQL.init(sc)

df <- loadDF(sqlContext, source="jdbc", url="jdbc:solr://solr:9983?collection=test", dbtable="test")

quit(save="no")
