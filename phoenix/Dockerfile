FROM jfchevrette/elixir

# Install deps
RUN apt-get update \
  && apt-get install -y inotify-tools nodejs \
  && ln -s /usr/bin/nodejs /usr/bin/node \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV PHOENIX_VERSION 1.0.0

# Install Phoenix through the Hex package manager
RUN yes | mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v${PHOENIX_VERSION}/phoenix_new-${PHOENIX_VERSION}.ez
