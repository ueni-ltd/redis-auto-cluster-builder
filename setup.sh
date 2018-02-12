#!/usr/bin/env bash

NODES=$(getent hosts ${REDIS_SERVICE} | awk '{ printf("%s:6379 ", $1) }')

yes "yes" | ./redis-trib.rb create --replicas ${REPLICATION_FACTOR} ${NODES}
