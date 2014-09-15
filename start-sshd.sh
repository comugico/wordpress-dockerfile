#!/bin/bash
exec /usr/sbin/sshd -D -p 22 -d -f /custom_sshd_config
