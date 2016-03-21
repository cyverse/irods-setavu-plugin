FROM centos:6.6
MAINTAINER tedgin@iplantcollaborative.org

RUN yum --assumeyes install \
        boost gcc-c++ openssl-devel \
        ftp://ftp.renci.org/pub/irods/releases/4.1.8/centos6/irods-dev-4.1.8-centos6-x86_64.rpm \
        ftp://ftp.renci.org/pub/irods/releases/4.1.8/centos6/irods-runtime-4.1.8-centos6-x86_64.rpm

