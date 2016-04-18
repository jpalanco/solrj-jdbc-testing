# solrj-jdbc-testing

## How to Use
1. Install Docker Toolbox
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
  * Note: before running dbvisualizer the X11_DISPLAY environment variable must be set
* rstudio (port 8787)
* zeppelin (port 8080)

To get the dynamic port, `docker-compose port ITEM PORT`

## GUI SQL UI Development
1. `git checkout dev`
2. Add your Docker host ip as docker to your `/etc/hosts` file
3. `docker-compose up -d solr`
4. Test your SQL client by pointing to `jdbc:solr://docker:9983?collection=test`
5. `docker-compose down -v`

