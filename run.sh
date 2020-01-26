IMAGE_NAME=trasis/proxy
CONTAINER_NAME=proxy

docker run --rm -it --name $CONTAINER_NAME \
-p 3128:3128 $IMAGE_NAME
