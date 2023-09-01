#!/bin/bash

USERNAME=${USERNAME:-user}
PASSWORD=${PASSWORD:-user}

useradd -s /bin/bash -m $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd

su $USERNAME
git clone ${GIT_URL}

/usr/sbin/sshd -D -e
