from pyspark import SparkContext, SparkConf
from pyspark.sql import SQLContext

conf = SparkConf()
sc = SparkContext(conf=conf)
sqlContext = SQLContext(sc)

df = sqlContext.read.format('jdbc').options(url='jdbc:solr://solr:9983?collection=test', dbtable='test').load()

df.show()

