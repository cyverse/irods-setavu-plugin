#! /bin/sh

docker build --tag irods-dev-build .
docker run --rm --tty --volume=$(pwd)/src:/src --workdir=/src --name=setavu-builder \
	   irods-dev-build make $@ 
