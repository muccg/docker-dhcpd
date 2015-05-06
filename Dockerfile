#
FROM muccg/debian8-base
MAINTAINER ccg <devops@ccg.murdoch.edu.au>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  isc-dhcp-server \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN env --unset=DEBIAN_FRONTEND

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

VOLUME ["/data"]

EXPOSE 67/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["dhcpd"]
