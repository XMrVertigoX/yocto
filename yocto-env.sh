#!/bin/bash

export USER_ID=$(id -u)
export USER_NAME=$(id -nu)
export GROUP_ID=$(id -g)
export GROUP_NAME=$(id -ng)

export IMAGE=yocto

for command in $@; do
	case $command in
		build )
			docker-compose --file $(dirname $0)/docker-compose.yml build
			;;
		run )
			docker-compose --file $(dirname $0)/docker-compose.yml run --rm ${IMAGE}
			;;
		* )
			echo "unknown command"
			;;
	esac
done
