FROM ruby:latest
MAINTAINER leadowl@leadowl.eu

ENV ROR_UID 1000
ENV APPNAME ror-app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && \
    useradd -r -u ${ROR_UID} -m -c "nexus role account" -d /opt/${APPNAME} -s /bin/false ror

VOLUME /opt/${APPNAME}/

WORKDIR /opt/${APPNAME}/

ADD Gemfile* /opt/${APPANME}/

RUN chown -Rv ror:ror /opt/${APPNAME}/

RUN bundle install

USER ror
