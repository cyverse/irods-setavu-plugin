GCC = g++ 
INC=-I/usr/include/irods/ -I/usr/include/irods/boost/
all: msisetavu
msisetavu:
	${GCC} ${INC} -fPIC -shared -Wno-deprecated -o libmsiSetAVU.so msiSetAVU.cpp /usr/lib/irods/libirods_client.a
        
clean:
	@rm -f ./*.so
