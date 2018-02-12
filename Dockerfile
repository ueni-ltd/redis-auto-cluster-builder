FROM ubuntu

LABEL maintainer="anthony@ueni.com"

RUN apt-get update && \
    apt-get install -y ruby vim wget redis-tools && \
    gem install redis

RUN wget http://download.redis.io/redis-stable/src/redis-trib.rb && \
    chmod u+x redis-trib.rb

COPY setup.sh .
RUN chmod u+x setup.sh

CMD ["./setup.sh"]