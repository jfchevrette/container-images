FROM perl:latest

RUN cpan App::Sqitch && \
    cpan DBD::mysql

RUN apt-get update && apt-get install -y mariadb-client postgresql-client && apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /src
WORKDIR /src
ENV HOME=/src

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
