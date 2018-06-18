#!/bin/sh

BRANCH=${BRANCH:-master}

if [ $REPOSITORY ]; then
        git clone $REPOSITORY --branch $BRANCH .
	cp /etc/periodic/_drafts/pullandbuild /etc/periodic/1min
	#crond
else
        echo "Nothing to do!"
fi

exec "$@"

