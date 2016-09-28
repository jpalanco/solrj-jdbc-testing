# solrj-jdbc-testing

[![Build Status](https://travis-ci.org/risdenk/solrj-jdbc-testing.svg?branch=master)](https://travis-ci.org/risdenk/solrj-jdbc-testing)

## How to Use
1. Install Docker
2. `git clone https://github.com/risdenk/solrj-jdbc-testing`
3. `cd solrj-jdbc-testing`
4. `docker-compose up -d solr`
5. Run any of non interative or interactive testing
6. `docker-compose down -v`

### Non interactive testing
For one of the following do `docker-compose up ITEM`

* jisql
* jython
* python
* r-base
* spark

### Interactive testing
For one of the following do `docker-compose up -d ITEM`

* dbvisualizer
  * Note: before running the `X11_DISPLAY` environment variable must be set
* squirrelsql
  * Note: before running the `X11_DISPLAY` environment variable must be set
* rstudio (port 8787)
* zeppelin (port 8080)

To get the dynamic port, `docker-compose port ITEM PORT`

