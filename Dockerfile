FROM ruby:2.4-alpine

ENV INIT_FOLDER "/docker-entrypoint-init-jekyll.d"
ENV EXAMPLE_SITE "/example-blog"
ENV SITE "/blog"

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

RUN apk add --no-cache build-base gcc cmake bash git dcron

RUN gem install jekyll bundler

#RUN jekyll new $SITE_NAME
COPY ./blog $EXAMPLE_SITE

RUN cd $EXAMPLE_SITE && bundle install

WORKDIR $SITE

EXPOSE 4000

#COPY ./scripts/runthat /etc/periodic/15min/runthat

COPY ./setup $INIT_FOLDER

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

#RUN /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

#CMD ["jekyll", "serve", "-H", "0.0.0.0"]

