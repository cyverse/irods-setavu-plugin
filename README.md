# irods-setavu-plugin
An iRODS plugin that provides a microservice for setting AVUs

This is just a migration of the iRODS 3 `irods-setavu-module` package to an iRODS 4 module.

## Compilation

A shared object, `libmsiSetAVU.so`, is build by a CentOS 6 docker container. To build the object,
just run the `build.sh` script. The object will be built in the `src/` subdirectory.
