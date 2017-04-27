#! /bin/sh

for os in centos6 centos7
do
  docker build --file dockerfiles/Dockerfile."$os" --tag irods-dev-build:4.1.10-"$os" .

  docker run --rm --tty --user=$(id -u):$(id -g) --volume=$(pwd)/src:/src --name=setavu-builder \
	           irods-dev-build:4.1.10-"$os" make clean all

  mkdir --parents libraries/"$os"
  mv --force src/libmsiSetAVU.so libraries/"$os"
done
