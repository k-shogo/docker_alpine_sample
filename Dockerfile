FROM alpine:3.6

RUN apk update && apk --update --no-cache add bash ruby \
    ruby-bundler ruby-json ruby-bigdecimal \
    mariadb-client-libs tzdata \
    nodejs

WORKDIR /app

ADD Gemfile /app/
ADD Gemfile.lock /app/

RUN apk --update --no-cache add --virtual build-dependencies ruby-dev build-base \
    mariadb-dev libffi-dev && \
    bundle install -j 4 && \
    apk del build-dependencies

ADD . /app

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
