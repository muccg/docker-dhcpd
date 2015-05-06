#!/bin/bash

# dhcpd entrypoint
if [ "$1" = 'dhcpd' ]; then
    if [ ! -f /data/dhcpd.leases ]; then
        touch /data/dhcpd.leases
    fi
    /usr/sbin/dhcpd -f -cf /data/dhcpd.conf -lf /data/dhcpd.leases --no-pid 2>&1 | tee /data/dhcpd.log
    exit $?
fi

exec "$@"
