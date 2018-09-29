FROM mono:latest
MAINTAINER deddryk

WORKDIR /tmp/docker-build

RUN groupadd -g 999 jackett && \
    useradd -r -u 999 -g jackett -d /jackett -m jackett
RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev
RUN curl -o Jackett.Binaries.Mono.tar.gz -L https://github.com/Jackett/Jackett/releases/download/v0.10.221/Jackett.Binaries.Mono.tar.gz
RUN tar xzf Jackett.Binaries.Mono.tar.gz -C /opt/
RUN cd /root
RUN rm -rf /tmp/docker-build

USER jackett

VOLUME /jackett

EXPOSE 9117

CMD ["mono", "/opt/Jackett/JackettConsole.exe"]
