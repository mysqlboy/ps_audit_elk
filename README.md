#ELK for Audit Log
###A consolidated docker image that facilitates ELK for Audit Log from Percona Server

##Usage

###Prerequisites
1. This guide assumes that you have docker or docker machine installed.  
  [Ubuntu guide here](http://docs.docker.com/v1.8/installation/ubuntulinux/)  
  [Mac guide here](http://docs.docker.com/v1.8/installation/mac/)  
  [Win guide here](http://docs.docker.com/v1.8/installation/windows/)  

2. You have generated a JSON based audit log file using Percona's Audit Plugin (Percona Server for MySQL 5.5/5.6 required).  
  [Percona Audit Plugin](https://www.percona.com/blog/2015/09/10/percona-server-audit-log-plugin-best-practices/)

in your `my.cnf`
```ini
  [mysqld]
  AUDIT_LOG_FORMAT=JSON
  AUDIT_LOG_HANDLER=FILE
```

###Our files and their significance in this project
```plain
ps_audit_elk
├── locallogs
├── config
|   ├── export.json      <-- kibana-4 export (json)
|   ├── kibana.yml       <-- kibana-4 yaml config (yaml)
|   ├── logstash.conf    <-- logstash config file (ini)
|   ├── logstash.list    <-- sources list for logstash repo
|   └── setup.sh         <-- shell script to launch all services
├── Dockerfile           <-- Dockerfile to build image
├── README.md
```

###Clone this repo

```shell
  git clone git@github.com:mysqlboy/ps_audit_elk.git
```

###Build the Docker image

```shell
  cd ps_audit_elk
```

```shell
  docker build -t mysqlboy/ps_audit_elk .
```

###Start a container using the image we built

```shell
  docker run \
  -d \
  --name docker_audit \
  -v $PWD/locallogs/sample_audit.log:/var/log/mysql/audit.log \
  -v $PWD/config/logstash.conf:/etc/logstash/conf.d/logstash.conf \
  -p 5601:5601 \
  mysqlboy/ps_audit_elk
```

with `-v` we are mapping files into the container into defined paths. To use your own audit.log file replace `$PWD/locallogs/sample_audit.log` path with your own file.  

###Connect to the Kibana

When we bring up the container we are mapping the local port to the docker port inside the container. So we can point our browser at localhost.

```plain
  http://127.0.0.1:5601
```
