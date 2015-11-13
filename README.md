#ELK for Audit Log
###A consolidated docker image that facilitates ELK for Audit Log from Percona Server

##Usage

###Prerequisites
1. This guide assumes that you have docker or docker machine installed. Out of scope.
2. You have generated a JSON based audit log file using Percona's Audit Plugin
.. [mysqld]
.. AUDIT_LOG_FORMAT=JSON
.. AUDIT_LOG_HANDLER=FILE

###Clone this repo

```git clone git@github.com:mysqlboy/ps_audit_elk.git```

###Build the Docker image

```cd ps_audit_elk```
```docker build -t mysqlboy/ps_audit_elk```

###Start a container using the image we built

```docker run
  -d
  --name docker_audit
  -v $PWD/locallogs/sample_audit.log:/var/log/mysql/audit.log
  -v $PWD/config/logstash.conf:/etc/logstash/conf.d/logstash.conf
  -p 5601:5601
  mysqlboy/ps_audit_elk```

with `-v` we are mapping files into the container into defined paths. To use your own audit.log file replace `$PWD/locallogs/sample_audit.log` path with your own file.  

###Connect to the Kibana

When we bring up the container we are mapping the local port to the docker port inside the container. So we can point our browser at localhost.

```http://127.0.0.1:5601```
