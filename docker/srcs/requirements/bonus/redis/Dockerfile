
FROM debian:12

RUN apt-get update && apt-get install -y redis-server

CMD ["redis-server", "--protected-mode", "no"]