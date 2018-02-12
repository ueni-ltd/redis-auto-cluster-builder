#!/usr/bin/env bash

NODES=$(getent hosts ${REDIS_SERVICE} | awk '{ printf("%s ", $1) }')

./redis-trib.rb create --replicas 1 ${NODES}
