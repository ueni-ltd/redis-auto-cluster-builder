FROM ubuntu

RUN apt-get update
RUN apt-get install -y ruby vim wget redis-tools
RUN gem install redis
RUN wget http://download.redis.io/redis-stable/src/redis-trib.rb
RUN chmod u+x redis-trib.rb

ADD setup.sh .
RUN chmod u+x setup.sh

CMD ["./setup.sh"]
