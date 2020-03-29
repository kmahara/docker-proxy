#!/bin/sh

IMAGE_NAME=trasis/proxy

# =================================================================

PROXY_IP=`(docker inspect proxy | jq -r .[0].NetworkSettings.Networks.bridge.IPAddress) 2> /dev/null`

if [ $PROXY_IP != null ]; then
	echo "use proxy: $PROXY_IP"
	OPT="--build-arg http_proxy=$PROXY_IP:3128"
fi

# =================================================================
echo "## Build Docker Image: $IMAGE_NAME"

START_TIME=$SECONDS

docker build -t $IMAGE_NAME $OPT .

ELAPSED_TIME=$(($SECONDS - $START_TIME))
echo "Duration: $ELAPSED_TIME secs"

