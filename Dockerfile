FROM alpine:3.6

RUN apk update && apk --update --no-cache add bash ruby

ADD Gemfile /app/
ADD Gemfile.lock /app/

ADD . /app

WORKDIR /app
