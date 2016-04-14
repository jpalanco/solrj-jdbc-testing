# https://www.rforge.net/RJDBC/

install.packages("RJDBC", dep=TRUE)

library("RJDBC")

solrCP <- c(list.files('/opt/solr/dist/solrj-lib', full.names=TRUE), list.files('/opt/solr/dist', pattern='solrj', full.names=TRUE, recursive = TRUE))

drv <- JDBC("org.apache.solr.client.solrj.io.sql.DriverImpl",
           solrCP,
           identifier.quote="`")
conn <- dbConnect(drv, "jdbc:solr://solr:9983?collection=test", "user", "pwd")
dbGetQuery(conn, "select fielda, fieldb, fieldc, fieldd_s, fielde_i from test limit 10")

#dbListTables(conn)
#data(iris)
#dbWriteTable(conn, "iris", iris, overwrite=TRUE)
#dbGetQuery(conn, "select count(*) from iris")
#d <- dbReadTable(conn, "iris")

dbDisconnect(conn)
