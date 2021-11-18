#!/bin/bash
mkdir -p /opt/www/html
cat <<EOF >/etc/nginx/conf.d/default.conf
server
    {
        listen 80;
        location / {
                root /opt/www/html;
                autoindex on;
                autoindex_exact_size off;
                autoindex_localtime on;
                #proxy_pass http://www.baidu.com;
        }
        #CentOS/RHEL/fedora
        location /centos-vault/ {
           proxy_pass https://archive.kernel.org/centos-vault/ ;
        }
        location /centos/ {
            proxy_pass http://mirrors.ustc.edu.cn/centos/ ;
        }
        location /epel/ {
            proxy_pass http://mirrors.ustc.edu.cn/epel/ ;
        }
        location /rpmforge/ {
            proxy_pass http://mirrors.ustc.edu.cn/rpmforge/ ;
        }
        location /fedora/ {
            proxy_pass http://mirrors.ustc.edu.cn/fedora/ ;
        }
        #Debian/Ubuntu
         location /debian/ {
            proxy_pass http://mirrors.ustc.edu.cn/debian/ ;
        }
        location /debian-security/ {
            proxy_pass http://mirrors.ustc.edu.cn/debian-security/ ;
        }
        location /ubuntu/ {
            proxy_pass http://mirrors.ustc.edu.cn/ubuntu/ ;
        }
        #OpenSUSE
        location /opensuse/ {
            proxy_pass http://mirrors.ustc.edu.cn/opensuse/ ;
        }
        #Linux Kernel
                location /linux-kernel/ {
            proxy_pass http://mirrors.ustc.edu.cn/linux-kernel/ ;
        }
        #rpmfusion
        location /rpmfusion/ {
            proxy_pass http://mirrors.ustc.edu.cn/rpmfusion/ ;
        }
        #Remi MySQL&PHP
        location /Remi/ {
            proxy_pass http://mirrors.ustc.edu.cn/Remi/ ;
        }
        #K8S
        location /kubernetes/ {
            proxy_pass http://mirrors.ustc.edu.cn/kubernetes/ ;
        }
        #pypi
        location /pypi/ {
            proxy_pass http://mirrors.ustc.edu.cn/pypi/ ;
        }
        #zabbix
        location /zabbix/ {
            proxy_pass http://mirrors.ustc.edu.cn/zabbix/ ;
        }
        #openssh
        location /openssh/ {
            proxy_pass http://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/ ;
        }
        #zlib.h
        location /zlib/ {
            proxy_pass  http://www.zlib.net/ ;
        }
        #openssl
        location /openssl/ {
            proxy_pass  http://www.openssl.org/source/ ;
        }
}
EOF
