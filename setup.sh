#!/usr/bin/env bash

while [ $(getent hosts ${REDIS_SERVICE} | wc -l) -lt ${CLUSTER_SIZE} ]
do
  echo "waiting for the $CLUSTER_SIZE nodes to be ready"
  sleep 5
done

NODES=$(getent hosts ${REDIS_SERVICE} | awk '{ printf("%s:6379 ", $1) }')

yes "yes" | ./redis-trib.rb create --replicas ${REPLICATION_FACTOR} ${NODES}

./redis-trib.rb check ${REDIS_SERVICE}:6379
