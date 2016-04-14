# https://www.rforge.net/RJDBC/

install.packages("RJDBC", dep=TRUE)

library("RJDBC")

drv <- JDBC("org.apache.solr.client.solrj.io.sql.DriverImpl",
           Sys.getenv("CLASSPATH"),
           identifier.quote="`")
conn <- dbConnect(drv, "jdbc:solr://solr:9983?collection=test", "user", "pwd")
dbGetQuery(conn, "select fielda, fieldb, fieldc, fieldd_s, fielde_i from test limit 10")

#dbListTables(conn)
#data(iris)
#dbWriteTable(conn, "iris", iris, overwrite=TRUE)
#dbGetQuery(conn, "select count(*) from iris")
#d <- dbReadTable(conn, "iris")

dbDisconnect(conn)
