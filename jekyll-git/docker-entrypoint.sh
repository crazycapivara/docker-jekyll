#!/bin/sh
REPOSITORY=""
git clone https://github.com/crazycapivara/docker-jekyll.git --branch feature/blog .
exec "$@"

