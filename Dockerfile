FROM centos:centos7
MAINTAINER ChungThanhMinh

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd; yum clean all

RUN mkdir /opt/share
RUN mkdir /var/run/sshd
RUN echo 'root:bkhpcc' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

# Create accounts for class MT14TN on CS1
RUN for i in ctminh; do echo ${i}; useradd -ms /bin/bash ${i}; echo ${i}:${i} | chpasswd; done

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
