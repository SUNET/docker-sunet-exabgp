#!/bin/bash

if [ ! -z "$CONFIG" ]; then
   LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
   TMP_CONFIG=`mktemp`
   sed "s!%LOCAL_IP%!$LOCAL_IP!g" < $CONFIG > $TMP_CONFIG
   exec exabgp $TMP_CONFIG $*
else
   exec exabgp $*
fi
