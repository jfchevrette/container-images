FROM jfchevrette/elixir

# Install deps
RUN apt-get update \
  && apt-get install -y inotify-tools npm nodejs \
  && ln -s /usr/bin/nodejs /usr/bin/node \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV PHOENIX_VERSION 1.0.0

# Install the Hex package manager
RUN mix local.hex --force

# Install the rebar Erlang build tool
RUN mix local.rebar --force

# Install Phoenix
RUN mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v${PHOENIX_VERSION}/phoenix_new-${PHOENIX_VERSION}.ez --force

# Workaround bug where mix deps wont compile without --erl "-smp disable"
RUN mv /usr/local/bin/mix /usr/local/bin/mix.real
COPY mix.wrapper /usr/local/bin/mix

RUN ln -sf /code/.hex /root/.hex

RUN mkdir /code
WORKDIR /code

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
