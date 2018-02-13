FROM centos:7
ARG http_proxy
ENV http_proxy=${http_proxy}
#yum-plugin-ovl fixes issues with overlay filesystem causing yum to fail
RUN yum -y install yum-plugin-ovl && yum -y install vim java-1.8.0-openjdk-devel java-1.7.0-openjdk-devel which git epel-release
COPY gradle-4.4.1 /usr/local/gradle-4.4.1
COPY gradle.sh /etc/profile.d/gradle.sh
COPY root/.vimrc /root/.vimrc
ENTRYPOINT ["/bin/bash","-l"]


