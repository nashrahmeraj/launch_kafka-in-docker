# launch_kafka-in-docker

create docker image
 docker build -t image_name .
run container 
 docker run -i -d --name cont_name image_name
  through i option we can run container continously
 run container in interactive mode so that u can run commands to launch kafka
  docker exec -it cont_name /bin/bash
  
  this will create terminal for container in bash language
  
  now to launch kafka
  
 step1: start zookeeper server
 before that change directory where kafka unzip directory is available , then use this command
 bin/zookeeper-server-start.sh config/zookeeper.properties
 step2: start kafka server
 bin/kafka-server-start.sh config/server.properties
 step3: create topic in another terminal
 bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic testTopic
 step4 : create producer in another terminal and write some message, it stores in kafka cluster
 bin/kafka-console-producer.sh --broker-list localhost:9092 --topic testTopic
 step5: in another terminal create consumer which accept message from broker sent by producer
 bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic testTopic --from-beginning
