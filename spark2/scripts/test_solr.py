from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

df = spark.read.format('jdbc').options(url='jdbc:solr://solr:9983?collection=test', dbtable='test').load()

df.show()

