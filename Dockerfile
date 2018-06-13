FROM ruby:2.4-alpine

ENV SITE_NAME "bender-blog"

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

RUN apk add --no-cache build-base gcc cmake bash git

RUN gem install jekyll bundler

RUN jekyll new $SITE_NAME

WORKDIR $SITE_NAME

RUN jekyll build

EXPOSE 4000

CMD ["jekyll", "serve", "-H", "0.0.0.0"]

