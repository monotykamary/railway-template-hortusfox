FROM ghcr.io/danielbrendel/hortusfox-web:v6.3@sha256:a26d2333a4c0c0786c9d384c176d45c3f15bb748d327c1340a64ce636555a51e

RUN cp /usr/local/bin/docker-entrypoint.sh /usr/local/bin/hortusfox-upstream-entrypoint
COPY entrypoint.sh /usr/local/bin/hortusfox-railway-entrypoint
COPY apache-start.sh /usr/local/bin/hortusfox-apache-start
RUN chmod +x /usr/local/bin/hortusfox-railway-entrypoint /usr/local/bin/hortusfox-apache-start

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/hortusfox-railway-entrypoint"]
