#!/bin/bash
if [ ! -d /var/run/sshd ] ; then
  mkdir --parents --mode="0755" /var/run/sshd
fi
exec /start-sshd.sh
