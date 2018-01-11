FROM centos
#yum-plugin-ovl fixes issues with overlay filesystem causing yum to fail
RUN yum -y install yum-plugin-ovl && yum -y install java which epel-release
COPY gradle-4.4.1 /usr/local/gradle-4.4.1
COPY gradle.sh /etc/profile.d/gradle.sh
ENTRYPOINT ["/bin/bash","-l"]


