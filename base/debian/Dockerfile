FROM debian:jessie

ADD etc /etc
RUN DEBIAN_FROMTEND=noninteractive apt-get update && apt-get upgrade -y && \
	apt-get install -y ca-certificates inotify-tools nano procps pwgen supervisor unrar unzip wget && \
	apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -u 500 data

RUN mkdir -p /config /data
ADD config /config
RUN chmod +x /config/init

CMD /config/init
