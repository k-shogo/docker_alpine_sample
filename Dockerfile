FROM alpine:3.6

RUN apk update && apk --update --no-cache add bash ruby \
    ruby-bundler

ADD Gemfile /app/
ADD Gemfile.lock /app/

RUN apk --update --no-cache add --virtual build-dependencies ruby-dev build-base \
    mariadb-dev libffi-dev && \
    cd /app ; bundle install -j 4 && \
    apk del build-dependencies

ADD . /app

WORKDIR /app
