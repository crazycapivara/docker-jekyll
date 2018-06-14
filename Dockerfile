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

COPY ./scripts/runthat /etc/periodic/15min/runthat

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

#RUN /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["jekyll", "serve", "--skip-initial-build", "-H", "0.0.0.0"]

