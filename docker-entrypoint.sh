#!/bin/sh

run-parts $INIT_FOLDER

#echo $EXAMPLE_SITE
#git clone https://github.com/crazycapivara/docker-jekyll.git --branch feature/blog
#jekyll build -s /blog/docker-jekyll/blog -d /blog/_site
#jekyll build -s /blog/docker-jekyll/blog -d /blog/_site
crond
#cd /blog/docker-jekyll/blog
#exec "$@"
#jekyll server -s $EXAMPLE_SITE -H 0.0.0.0

