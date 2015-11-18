FROM elasticsearch
MAINTAINER andrew.moore@percona.com

# Installing Logstash and dependencies
WORKDIR ~
ADD $PWD/config/logstash.list /etc/apt/sources.list.d/logstash.list
RUN apt-get -qq update
RUN apt-get -y -qq install wget tar gzip logstash

# Installing Kibana
RUN mkdir /usr/kibana
RUN wget -q https://download.elastic.co/kibana/kibana/kibana-4.2.1-linux-x64.tar.gz
RUN tar -xzf kibana-4.2.1-linux-x64.tar.gz -C /opt
RUN ln -s /opt/kibana-4.2.1-linux-x64 /opt/kibana

ADD $PWD/config/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

CMD '/tmp/setup.sh'
