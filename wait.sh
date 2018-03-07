#!/bin/bash

echo "waiting for the $CLUSTER_SIZE nodes to be ready"
while [ $(getent hosts ${REDIS_SERVICE} | wc -l) -lt ${CLUSTER_SIZE} ]
do
    echo -n "."
    sleep 2
done

echo $(getent hosts ${REDIS_SERVICE})
sleep 15