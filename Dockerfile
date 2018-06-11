FROM ruby:2.5-slim

ENV ELIXIR_VERSION="v1.5.3"
ENV LANG=C.UTF-8
ENV ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/releases/download/${ELIXIR_VERSION}/Precompiled.zip"
ENV ELIXIR_DOWNLOAD_SHA256="70972b844c12bc1a3960136d628ab4f21ca87dd5539c544ebabe41d6c9239ba9"

RUN apt-get update -qq && \
    apt-get install -yqq \
      git \
      cmake \
      pkg-config \
      libgit2-dev \
      ca-certificates \
      curl \
      unzip \
      erlang && \
    curl -fSL -o elixir-precompiled.zip $ELIXIR_DOWNLOAD_URL && \
    echo "$ELIXIR_DOWNLOAD_SHA256  elixir-precompiled.zip" | sha256sum -c - && \
    unzip -d /usr/local elixir-precompiled.zip && \
    rm elixir-precompiled.zip

RUN mix local.hex --force && \
    git clone --depth 1 https://github.com/rrrene/bunt.git && \
    cd bunt && \
    mix archive.build && \
    mix archive.install --force && \
    cd .. && \
    git clone --depth 1 https://github.com/rrrene/credo.git && \
    cd credo && \
    mix deps.get && \
    mix deps.compile && \
    mix archive.build && \
    mix archive.install --force

COPY Gemfile Gemfile.lock ./
RUN bundle install --system --jobs=4 --retry=3

COPY script.sh /bin/
RUN chmod +x /bin/script.sh

ENTRYPOINT /bin/script.sh