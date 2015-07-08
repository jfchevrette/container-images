FROM debian:jessie

ADD etc /etc
RUN DEBIAN_FROMTEND=noninteractive apt-get update && apt-get upgrade -y && \
	apt-get install -y ca-certificates inotify-tools nano procps pwgen supervisor unrar unzip wget && \
	apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
