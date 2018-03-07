FROM ubuntu

RUN apt-get update && \
    apt-get install -y ruby vim wget redis-tools && \
    gem install redis

RUN wget http://download.redis.io/redis-stable/src/redis-trib.rb
RUN chmod u+x redis-trib.rb

COPY wait.sh .
COPY setup.sh .
RUN chmod u+x wait.sh
RUN chmod u+x setup.sh

CMD ["./setup.sh"]