FROM centos:7.7.1908
ARG http_proxy
ARG no_proxy
ARG local_yum_repo
ARG nexus_id
ARG nexus_pass

# Set up environment
ENV \
	PATH=$PATH:/usr/local/gradle-5.6.4/bin \
	BASE_REPO=https://nexus.softwareplumbers.com/repository 

COPY yumconfig /opt/yumconfig
RUN /opt/yumconfig/config.sh ${local_yum_repo}
#yum-plugin-ovl fixes issues with overlay filesystem causing yum to fail
RUN yum -y install yum-plugin-ovl && yum -y install vim java-1.8.0-openjdk-devel java-1.7.0-openjdk-devel which git davix unzip python36 python36-pip curl
RUN pip3 install awscli

# Install gradle from the SWP repo
WORKDIR /usr/local
RUN \
	curl -L -u ${nexus_id}:${nexus_pass} -vsf https://nexus.softwareplumbers.com/repository/generic/gradle/gradle-5.6.4.zip -o gradle.zip; \
	unzip gradle.zip; \
	rm gradle.zip

COPY root/.vimrc /root/.vimrc
ENTRYPOINT ["/bin/bash","-l"]


