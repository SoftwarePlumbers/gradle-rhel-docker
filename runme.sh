#!/bin/bash

docker run -it --network=softwareplumbers.net --sysctl net.ipv6.conf.all.disable_ipv6=1 -v/tmp/db2:/var/db2 --name gradle1 --hostname=gradle1.softwareplumbers.net softwareplumbers/gradle-centos
