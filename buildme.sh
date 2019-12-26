#!/bin/bash

if [ -f ~/.nexus.settings ]
then
	source ~/.nexus.settings
else
	echo -n "Input nexus id:"
	read nexus_id
	echo -n "Input nexus password:"
	read nexus_pass

	echo "
		nexus_id=${nexus_id}
		nexus_pass=${nexus_pass}
	" >  ~/.nexus.settings

	chmod o-r ~/.nexus.settings
fi

docker build \
	-t softwareplumbers/gradle-centos \
	--build-arg dev_uid=`id -u` \
	--build-arg nexus_id=${nexus_id} \
	--build-arg nexus_pass=${nexus_pass} \
	.

