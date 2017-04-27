#! /bin/sh

docker build --file dockerfiles/Dockerfile.centos6 --tag irods-dev-build:4.1.10-centos6 .
docker run --rm --tty --user=$(id -u):$(id -g) --volume=$(pwd)/src:/src --name=setavu-builder \
	   irods-dev-build:4.1.10-centos6 make clean all
mkdir --parents libraries/centos6
mv src/libmsiSetAVU.so libraries/centos6
