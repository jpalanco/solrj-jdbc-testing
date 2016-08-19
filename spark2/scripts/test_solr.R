library(SparkR)

sc <- sparkR.session()

df <- read.jdbc("jdbc:solr://solr:9983?collection=test", "test")

:quit
