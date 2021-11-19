#!/bin/bash
ipaddr=$(ip addr | egrep "enp|ens"  | awk '/^[0-9]+: / {}; /inet.*global/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}')
basearch="\$basearch"
releasever="\$releasever"
infra="\$infra"
cat <<EOF >epel6.repo
[epel]
name=Extra Packages for Enterprise Linux 6 - $basearch
baseurl=http://$ipaddr/epel/6/$basearch
failovermethod=priority
enabled=1
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7

[epel-debuginfo]
name=Extra Packages for Enterprise Linux 6 - $basearch - Debug
baseurl=http://$ipaddr/epel/6/$basearch/debug
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=0

[epel-source]
name=Extra Packages for Enterprise Linux 6 - $basearch - Source
baseurl=http://$ipaddr/epel/6/SRPMS
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=0
EOF

cat <<EOF >epel7.repo
[epel]
name=Extra Packages for Enterprise Linux 7 - $basearch
baseurl=http://$ipaddr/epel/7/$basearch
failovermethod=priority
enabled=1
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7

[epel-debuginfo]
name=Extra Packages for Enterprise Linux 7 - $basearch - Debug
baseurl=http://$ipaddr/epel/7/$basearch/debug
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=0

[epel-source]
name=Extra Packages for Enterprise Linux 7 - $basearch - Source
baseurl=http://$ipaddr/epel/7/SRPMS
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=0
EOF                                        