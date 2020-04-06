FROM alpine

RUN \
	apk add --no-cache squid && \
	install -d -o squid -g squid \
                /var/cache/squid \
                /var/log/squid \
                /var/run/squid && \
        chmod +x /usr/lib/squid/*
COPY files /tmp
RUN mv /tmp/squid.conf /etc/squid/ && \
	chown -R squid:squid /etc/squid/squid.conf

USER squid
EXPOSE 3128
#CMD [ "/usr/sbin/squid", "--foreground" ]
CMD ["/usr/sbin/squid", "-NYCd 1"]
