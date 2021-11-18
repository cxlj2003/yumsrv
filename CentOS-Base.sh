#!/bin/bash
ipaddr=$(ip addr | egrep "enp|ens"  | awk '/^[0-9]+: / {}; /inet.*global/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}')
basearch="\$basearch"
releasever="\$releasever"
infra="\$infra"
cat <<EOF >./CentOS7-Base.repo
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the #mirrorlist= does not work for you, as a fall back you can try the 
# remarked out baseurl= line instead.
#
#

[base]
name=CentOS-$releasever - Base
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra
baseurl=http://$ipaddr/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#released updates 
[updates]
name=CentOS-$releasever - Updates
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates&infra=$infra
baseurl=http://$ipaddr/centos/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra
baseurl=http://$ipaddr/centos/$releasever/extras/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra
baseurl=http://$ipaddr/centos/$releasever/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF

cat <<EOF >./CentOS8-Base.repo
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the 
# remarked out baseurl= line instead.
#
#
 
[base]
name=CentOS-$releasever - Base
failovermethod=priority
baseurl=http://$ipaddr/centos/$releasever/BaseOS/$basearch/os/
        
gpgcheck=1
gpgkey=http://$ipaddr/centos/RPM-GPG-KEY-CentOS-Official
 
#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras 
failovermethod=priority
baseurl=http://$ipaddr/centos/$releasever/extras/$basearch/os/
        
gpgcheck=1
gpgkey=http://$ipaddr/centos/RPM-GPG-KEY-CentOS-Official
 
#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
failovermethod=priority
baseurl=http://$ipaddr/centos/$releasever/centosplus/$basearch/os/
       
gpgcheck=1
enabled=0
gpgkey=http://$ipaddr/centos/RPM-GPG-KEY-CentOS-Official
 
[PowerTools]
name=CentOS-$releasever - PowerTools
failovermethod=priority
baseurl=http://$ipaddr/centos/$releasever/PowerTools/$basearch/os/
        
gpgcheck=1
enabled=0
gpgkey=http://$ipaddr/centos/RPM-GPG-KEY-CentOS-Official


[AppStream]
name=CentOS-$releasever - AppStream 
failovermethod=priority
baseurl=http://$ipaddr/centos/$releasever/AppStream/$basearch/os/
        
gpgcheck=1
gpgkey=http://$ipaddr/centos/RPM-GPG-KEY-CentOS-Official
EOF


cat <<EOF >./CentOS6-Base.repo
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the 
# remarked out baseurl= line instead.
#
#
 
[base]
name=CentOS-6.10 - Base 
failovermethod=priority
baseurl=http://$ipaddr/centos-vault/6.10/os/$basearch/
gpgcheck=1
gpgkey=http://$ipaddr/centos-vault/RPM-GPG-KEY-CentOS-6
 
#released updates 
[updates]
name=CentOS-6.10 - Updates 
failovermethod=priority
baseurl=http://$ipaddr/centos-vault/6.10/updates/$basearch/
gpgcheck=1
gpgkey=http://$ipaddr/centos-vault/RPM-GPG-KEY-CentOS-6
 
#additional packages that may be useful
[extras]
name=CentOS-6.10 - Extras 
failovermethod=priority
baseurl=http://$ipaddr/centos-vault/6.10/extras/$basearch/
gpgcheck=1
gpgkey=http://$ipaddr/centos-vault/RPM-GPG-KEY-CentOS-6
 
#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-6.10 - Plus
failovermethod=priority
baseurl=http://$ipaddr/centos-vault/6.10/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=http://$ipaddr/centos-vault/RPM-GPG-KEY-CentOS-6
 
#contrib - packages by Centos Users
[contrib]
name=CentOS-6.10 - Contrib
failovermethod=priority
baseurl=http://$ipaddr/centos-vault/6.10/contrib/$basearch/
gpgcheck=1
enabled=0
gpgkey=http://$ipaddr/centos-vault/RPM-GPG-KEY-CentOS-6
EOF
