FROM redis
RUN mkdir /tmp/docker
RUN chmod 777 /tmp/docker
COPY ./redis/redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
