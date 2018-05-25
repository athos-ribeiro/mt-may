#!/bin/bash

scp provision.pp root@159.65.42.49:
ssh root@159.65.42.49 'dnf install -y puppet'
ssh root@159.65.42.49 'puppet apply provision.pp'
echo 'Here is the initial admin password:'
ssh root@159.65.42.49 'cat /var/lib/jenkins/secrets/initialAdminPassword'
