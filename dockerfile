



FROM ubuntu

RUN apt-get update && \
        apt-get install -y openjdk-8-jdk && \
        apt-get install -y ant && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        rm -rf /var/cache/oracle-jdk8-installer;

RUN apt-get update && \
        apt-get install -y ca-certificates-java && \
        apt-get clean && \
        update-ca-certificates -f && \
        rm -rf /var/lib/apt/lists/* && \
        rm -rf /var/cache/oracle-jdk8-installer;

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

RUN export JAVA_HOME

RUN apt-get update && \
    apt-get install -y wget &&\
    rm -rf /var/lib/apt/lists/* ;

RUN wget http://www-us.apache.org/dist/kafka/2.2.1/kafka_2.12-2.2.1.tgz

RUN tar xzf kafka_2.12-2.2.1.tgz
