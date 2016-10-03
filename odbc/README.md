# solrj-jdbc-testing ODBC

## References
* http://uda.openlinksw.com/odbc-jdbc-st/
* http://wikis.openlinksw.com/UdaWikiWeb/PreinstallODBCJDBCLiteOSX
* http://wikis.openlinksw.com/UdaWikiWeb/InstallODBCJDBCLiteOSX

## Setup
1. Download and install [OpenLink ODBC-JDBC Single-Tier (Lite Edition)](http://uda.openlinksw.com/odbc-jdbc-st/)
2. Setup the Solr libraries:
 * `./setup_solr_odbc_bridge.sh`
3. Setup a System DSN (localsolr) with the following:
 * `open /Applications/iODBC/iODBC\ Administrator64.app`
 * DSN: `localsolr`
 * JDBC Driver: `org.apache.solr.client.solrj.io.sql.DriverImpl`
 * URL String: `jdbc:solr://localhost:9983?collection=test`
4. Start Solr:
 * `docker-compose -f ../docker-compose.yml -f ../docker-compose-dev.yml up -d solr`
5. Test the DSN:
 * `/Library/Application\ Support/iODBC/bin/iodbctest "DSN=localsolr;UID=user;PWD=password"`

