FROM ghcr.io/danielbrendel/hortusfox-web:v6.2@sha256:5f4b90126b0b9cb35e5a1c445e49fdfd9c8dc820697fafe7674f23e42b050a2d

RUN cp /usr/local/bin/docker-entrypoint.sh /usr/local/bin/hortusfox-upstream-entrypoint
COPY entrypoint.sh /usr/local/bin/hortusfox-railway-entrypoint
COPY apache-start.sh /usr/local/bin/hortusfox-apache-start
RUN chmod +x /usr/local/bin/hortusfox-railway-entrypoint /usr/local/bin/hortusfox-apache-start

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/hortusfox-railway-entrypoint"]
