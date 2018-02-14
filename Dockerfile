FROM centos:7
ARG http_proxy
ARG no_proxy
ARG local_yum_repo
ENV http_proxy=${http_proxy} no_proxy=${no_proxy}
COPY yumconfig /opt/yumconfig
RUN /opt/yumconfig/config.sh ${local_yum_repo}
#yum-plugin-ovl fixes issues with overlay filesystem causing yum to fail
RUN yum --disablerepo=epel -y install yum-plugin-ovl && yum --disablerepo=epel -y install vim java-1.8.0-openjdk-devel java-1.7.0-openjdk-devel which git
COPY gradle-4.4.1 /usr/local/gradle-4.4.1
COPY gradle.sh /etc/profile.d/gradle.sh
COPY root/.vimrc /root/.vimrc
ENTRYPOINT ["/bin/bash","-l"]


