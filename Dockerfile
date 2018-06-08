FROM ruby:2.5-slim

RUN apt-get update -qq && \
    apt-get install -yqq \
      cmake \
      pkg-config \
      libgit2-dev

COPY Gemfile Gemfile.lock ./
RUN bundle install --system --jobs=4 --retry=3

COPY script.sh /bin/
RUN chmod +x /bin/script.sh

ENTRYPOINT /bin/script.sh