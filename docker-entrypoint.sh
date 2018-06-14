#!/bin/sh

echo $REPOSITORY
git clone https://github.com/crazycapivara/docker-jekyll.git --branch feature/blog
#jekyll build -s /blog/docker-jekyll/blog -d /blog/_site
jekyll build -s /blog/docker-jekyll/blog -d /blog/_site
crond
cd /blog/docker-jekyll/blog
exec "$@"

