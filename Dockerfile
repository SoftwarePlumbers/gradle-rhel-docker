FROM almalinux:8.9

RUN dnf install -y 'dnf-command(config-manager)'
RUN dnf config-manager --set-enabled powertools
RUN dnf install -y epel-release
RUN dnf install -y vim java-1.8.0-openjdk-devel java-11-openjdk-devel java-17-openjdk-devel java-21-openjdk-devel which git davix unzip python39 python39-pip curl && yum clean all
RUN update-alternatives --set jre_openjdk java-21-openjdk.x86_64
RUN update-alternatives --set javac java-21-openjdk.x86_64
RUN update-alternatives --set java java-21-openjdk.x86_64
WORKDIR /usr/local
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY gradle-8.5 .
# Set up environment
ENV \
	PATH=$PATH:/usr/local/gradle-8.5/bin 

RUN pip3 install awscli

COPY root/.vimrc /root/.vimrc
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


