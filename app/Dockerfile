FROM ghcr.io/danielbrendel/hortusfox-web:v5.9@sha256:04fe9851ced2ab9c30431eb113a53c5088f5958b137e9587342036e01e87a8a0

RUN cp /usr/local/bin/docker-entrypoint.sh /usr/local/bin/hortusfox-upstream-entrypoint
COPY entrypoint.sh /usr/local/bin/hortusfox-railway-entrypoint
COPY apache-start.sh /usr/local/bin/hortusfox-apache-start
RUN chmod +x /usr/local/bin/hortusfox-railway-entrypoint /usr/local/bin/hortusfox-apache-start

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/hortusfox-railway-entrypoint"]
