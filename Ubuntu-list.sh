#!/bin/bash
ipaddr=$(ip addr | egrep "enp|ens"  | awk '/^[0-9]+: / {}; /inet.*global/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}')


cat <<EOF >ubuntu14.list
#for ubuntu14
deb http://$ipaddr/ubuntu/ trusty main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ trusty main restricted universe multiverse
deb http://$ipaddr/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ trusty-security main restricted universe multiverse

deb http://$ipaddr/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ trusty-updates main restricted universe multiverse

deb http://$ipaddr/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ trusty-backports main restricted universe multiverse

## Not recommended
# deb http://$ipaddr/ubuntu/ trusty-proposed main restricted universe multiverse
# deb-src http://$ipaddr/ubuntu/ trusty-proposed main restricted universe multiverse
EOF

cat <<EOF >ubuntu16.list
##for ubuntu16
deb http://$ipaddr/ubuntu/ xenial main
deb-src http://$ipaddr/ubuntu/ xenial main

deb http://$ipaddr/ubuntu/ xenial-updates main
deb-src http://$ipaddr/ubuntu/ xenial-updates main

deb http://$ipaddr/ubuntu/ xenial universe
deb-src http://$ipaddr/ubuntu/ xenial universe
deb http://$ipaddr/ubuntu/ xenial-updates universe
deb-src http://$ipaddr/ubuntu/ xenial-updates universe

deb http://$ipaddr/ubuntu/ xenial-security main
deb-src http://$ipaddr/ubuntu/ xenial-security main
deb http://$ipaddr/ubuntu/ xenial-security universe
deb-src http://$ipaddr/ubuntu/ xenial-security universe
EOF

cat <<EOF >ubuntu18.list
##for ubuntu18
deb http://$ipaddr/ubuntu/ bionic main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ bionic main restricted universe multiverse

deb http://$ipaddr/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ bionic-security main restricted universe multiverse

deb http://$ipaddr/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ bionic-updates main restricted universe multiverse

deb http://$ipaddr/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ bionic-proposed main restricted universe multiverse

deb http://$ipaddr/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ bionic-backports main restricted universe multiverse
EOF

cat <<EOF >ubuntu18.list
##for ubuntu20
deb http://$ipaddr/ubuntu/ focal main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ focal main restricted universe multiverse

deb http://$ipaddr/ubuntu/ focal-security main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ focal-security main restricted universe multiverse

deb http://$ipaddr/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ focal-updates main restricted universe multiverse

deb http://$ipaddr/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ focal-proposed main restricted universe multiverse

deb http://$ipaddr/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://$ipaddr/ubuntu/ focal-backports main restricted universe multiverse
EOF