FROM ruby:2.4-alpine

ENV EXAMPLE_SITE "/example-blog"

ENV SITE "/blog"

ENV JEKYLL_SITE "/jekyll-site"

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

RUN apk add --no-cache build-base gcc cmake bash git dcron

RUN mkdir /etc/periodic/1min \
	&& mkdir /etc/periodic/_drafts \
	&& gem install jekyll bundler

COPY ./crontabs/root /etc/crontabs/root

COPY ./scripts/pullandbuild /etc/periodic/_drafts/pullandbuild

COPY ./blog $EXAMPLE_SITE

RUN cd $EXAMPLE_SITE && bundle install

WORKDIR $SITE

# NEW FEATURE
RUN mkdir /webhook \
	&& mkdir $JEKYLL_SITE \
	&& gem install sinatra thin

COPY /app/server.rb /webhook/server.rb
# END

EXPOSE 4000

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["ruby", "/webhook/server.rb"]
#CMD ["sh", "-c", "jekyll serve -s $EXAMPLE_SITE -H 0.0.0.0"]

