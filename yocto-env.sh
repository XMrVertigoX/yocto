#!/bin/bash

docker run \
       --interactive \
       --mount=type=bind,source=$(pwd),target=/workdir \
       --mount=type=volume,src=downloads,dst=/var/tmp/yocto/downloads,volume-driver=local,volume-opt=type=nfs4,volume-opt=device=:/srv/yocto/downloads,volume-opt=o=addr=192.168.178.123 \
       --mount=type=volume,src=sstate-cache,dst=/var/tmp/yocto/sstate-cache,volume-driver=local,volume-opt=type=nfs4,volume-opt=device=:/srv/yocto/sstate-cache,volume-opt=o=addr=192.168.178.123 \
       --rm \
       --tty \
       --workdir=/workdir \
       crops/poky
