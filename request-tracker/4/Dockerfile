FROM phusion/baseimage:0.9.17

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -q -y install --no-install-recommends \
      postfix \
      nginx-light \
      request-tracker4 \
      rt4-fcgi \
      rt4-db-mysql \
      spawn-fcgi \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

COPY etc/ /etc/
COPY RT_SiteConfig.pm /etc/request-tracker4/RT_SiteConfig.pm

VOLUME ["/var/lib/request-tracker4"]
EXPOSE 80

CMD ["/sbin/my_init"]
