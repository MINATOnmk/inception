FROM debian:12

RUN apt-get update && apt-get install -y curl

RUN curl -Lo /usr/local/bin/cadvisor https://github.com/google/cadvisor/releases/download/v0.60.2/cadvisor-v0.60.2-linux-amd64 \
    && chmod +x /usr/local/bin/cadvisor

CMD ["cadvisor" , "-logtostderr"]