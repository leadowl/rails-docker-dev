FROM ruby:latest

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && \
    useradd -r -u 1000 -m -c "nexus role account" -d /opt/ror-app -s /bin/false ror

VOLUME /opt/ror-app/

WORKDIR /opt/ror-app/

ADD Gemfile* /opt/ror-app/

RUN chown -Rv ror:ror /opt/ror-app/

RUN bundle install

USER ror
