FROM ruby:2.4-alpine

ENV SITE_NAME "blog"

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

RUN apk add --no-cache build-base gcc cmake bash git dcron

RUN gem install jekyll bundler

#RUN jekyll new $SITE_NAME
COPY ./blog $SITE_NAME

WORKDIR $SITE_NAME

RUN bundle install && jekyll build

EXPOSE 4000

CMD ["jekyll", "serve", "-H", "0.0.0.0"]

