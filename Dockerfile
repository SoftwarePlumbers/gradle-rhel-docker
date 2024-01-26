FROM almalinux:8.9

RUN dnf install -y 'dnf-command(config-manager)'
RUN dnf config-manager --set-enabled powertools
RUN dnf install -y epel-release
RUN dnf install -y vim java-1.8.0-openjdk-devel java-11-openjdk-devel which git davix unzip python39 python39-pip curl && yum clean all
WORKDIR /usr/local
COPY gradle-8.5.zip .
RUN unzip gradle-8.5.zip; rm gradle-8.5.zip

# Set up environment
ENV \
	PATH=$PATH:/usr/local/gradle-8.5/bin 

RUN pip3 install awscli

COPY root/.vimrc /root/.vimrc
ENTRYPOINT ["/bin/bash","-l"]


