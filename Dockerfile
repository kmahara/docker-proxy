FROM centos:6
EXPOSE 3128
CMD [ "/run.sh" ]

RUN yum -y install squid

COPY files /tmp
RUN mv /tmp/run.sh / && chmod 755 /run.sh
RUN mv /tmp/squid.conf /etc/squid/
