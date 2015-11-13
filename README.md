#ELK for Audit Log
###A consolidated docker image that facilitates ELK for Audit Log from Percona Server

##Usage

###Prerequisites
1. This guide assumes that you have docker or docker machine installed. Out of scope.
2. You have generated a JSON based audit log file using Percona's Audit Plugin  

###Clone this repo

```git clone git@github.com:mysqlboy/ps_audit_elk.git```

###Build the Docker image

```cd ps_audit_elk```
```docker build -t mysqlboy/ps_audit_elk```

###Start a container using the image

```docker run \
-d \
--name docker_audit \
-v $PWD/locallogs/sample_audit.log:/var/log/mysql/audit.log \
-v $PWD/config/logstash.conf:/etc/logstash/conf.d/logstash.conf \
-p 5601:5601 \
mysqlboy/ps_audit_elk```

###Connect to the Kibana

With ```-p 5601:5601``` we are mapping the local port to the docker port inside the container  
