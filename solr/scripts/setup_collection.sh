OUTPUT=/opt/docker-solr/status.log
echo "starting $0; logging to $OUTPUT"
{
    /opt/docker-solr/scripts/wait-for-solr.sh
    /opt/solr/bin/solr create -c test -d /opt/sa_conf/
    /opt/solr/bin/post -c test /opt/sa_data/
} </dev/null >$OUTPUT 2>&1 &
