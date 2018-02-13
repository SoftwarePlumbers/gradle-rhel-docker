#!/bin/bash
if [[ $1 ]]
then
	sed -e 's/LOCAL_REPO_SERVER/'$1'/g' /opt/yumconfig/Local-Centos-Base.repo > /etc/yum.repos.d/Local-Centos-Base.repo
	rm /etc/yum.repos.d/Centos-Base.repo
fi
