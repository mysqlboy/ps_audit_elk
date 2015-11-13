#ELK for Audit Log
###A consolidated docker image that facilitates ELK for Audit Log from Percona Server

##Usage
Clone this repo

```git clone git@github.com:mysqlboy/ps_audit_elk.git```

###Build the Docker image

```cd ps_audit_elk
docker build -t mysqlboy/ps_audit_elk```

###Start a container using the image
```docker run --rm -ti --name docker_audit -v $PWD/locallogs/sample_audit.log:/var/log/mysql/audit.log -v $PWD/config/logstash.conf:/etc/logstash/conf.d/logstash.conf -p 5601:5601 mysqlboy/ps_audit_elk```
