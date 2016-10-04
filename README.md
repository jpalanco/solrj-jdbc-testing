# solrj-jdbc-testing

[![Docker Automated](https://img.shields.io/docker/automated/risdenk/solrj-jdbc-testing.svg)](https://hub.docker.com/r/risdenk/solrj-jdbc-testing/)

Travis CI [![Build Status](https://travis-ci.org/risdenk/solrj-jdbc-testing.svg?branch=master)](https://travis-ci.org/risdenk/solrj-jdbc-testing)

## How to Use
1. Install Docker
2. `git clone https://github.com/risdenk/solrj-jdbc-testing`
3. `cd solrj-jdbc-testing`
4. `./run_solr.sh`
5. Run any of non interative or interactive testing
6. `docker-compose down -v`

### Helper Scripts
* `./run_solr.sh`
* `./run_test.sh`
* `./run_x11.sh`
* `./run_web.sh`

### Non interactive testing
For one of the following do `docker-compose up ITEM`

* jisql
* jython
* python
* r-base
* spark
* spark2

### Interactive testing
For one of the following do `docker-compose up -d ITEM`

* dbvisualizer
  * Note: before running the `X11_DISPLAY` environment variable must be set
* squirrelsql
  * Note: before running the `X11_DISPLAY` environment variable must be set
* calcite (port 8765)
  * Example: jdbc:avatica:remote:url=http://localhost:8765;zk=solr:9983;lex=MYSQL
* rstudio (port 8787)
  * `open http://localhost:$(docker-compose port rstudio 8787 | cut -d':' -f2)`
  * Username: `rstudio`
  * Password: `rstudio`
  * Example script: `/opt/scripts/test_solr.R`
* zeppelin (port 8080)
  * `open http://localhost:$(docker-compose port zeppelin 8080 | cut -d':' -f2)`
  * Example notebook: `Solr JDBC`
To get the dynamic port, `docker-compose port ITEM PORT`

### ODBC->JDBC Bridge
See [ODBC->JDBC README](odbc/README.md)

## Development
* `docker-compose -f docker-compose.yml -f docker-compose-dev.yml build`
* `docker-compose -f docker-compose.yml -f docker-compose-fixed-ports.yml ...`
* Add `solr` to `/etc/hosts` for some testing

