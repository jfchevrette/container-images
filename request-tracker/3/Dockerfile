FROM phusion/baseimage:0.9.17

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install Request-Tracker dependencies
COPY rt-deps /tmp/rt-deps
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -q -y install \
        $(cat /tmp/rt-deps | tr '\n' ' ') \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# Request-Tracker install configs
ENV PERL_MM_USE_DEFAULT 1
ENV RT rt-3.8.17
ENV RTSRC ${RT}.tar.gz

# Install Request-Tracker
RUN cd /usr/src \
    && curl -sLO http://download.bestpractical.com/pub/rt/release/${RTSRC} \
    && tar xzf ${RTSRC} \
    && cd ${RT} \
    && ./configure \
    && make testdeps \
    && make install \
    && apt-get remove -y build-essential \
    && apt-get autoremove -y \
    && apt-get clean

COPY etc/ /etc/
COPY RT_SiteConfig.pm /opt/rt3/etc/RT_SiteConfig.pm
RUN chown -R www-data:www-data /opt/rt3

VOLUME ["/opt/rt3/var"]
EXPOSE 80

CMD ["/sbin/my_init"]
