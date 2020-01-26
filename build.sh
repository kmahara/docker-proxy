#!/bin/sh

IMAGE_NAME=kmahara/proxy

# =================================================================

STATE=`docker inspect proxy 2> /dev/null | jq -r ".[0].State.Running"`

if [ $STATE = true ]; then
	PROXY_IP=`docker inspect proxy 2> /dev/null | jq -r ".[0].NetworkSettings.Gateway"`

	if [ $PROXY_RUNNING != "null" ]; then
		echo "use proxy"
		OPT="--build-arg http_proxy=$PROXY_IP:3128"
	fi
fi

# =================================================================
echo "## Build Docker Image: $IMAGE_NAME"

START_TIME=$SECONDS

docker build -t $IMAGE_NAME $OPT .

ELAPSED_TIME=$(($SECONDS - $START_TIME))
echo "Duration: $ELAPSED_TIME secs"

