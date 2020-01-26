FROM alpine

RUN apk add --no-cache squid tzdata && \
	cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
COPY files /tmp
RUN mv /tmp/run.sh / && chmod 755 /run.sh
RUN mv /tmp/squid.conf /etc/squid/ && \
	chown -R squid:squid /etc/squid/squid.conf
RUN install -d -o squid -g squid \
                /var/cache/squid \
                /var/log/squid \
                /var/run/squid && \
        chmod +x /usr/lib/squid/*

USER squid
EXPOSE 3128
#CMD [ "/usr/sbin/squid", "--foreground" ]
CMD ["/usr/sbin/squid", "-NYCd 1"]
