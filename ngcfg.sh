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
        #3.1CentOS/RHEL_OldVersion
        location /centos-vault/ {
           proxy_pass https://archive.kernel.org/centos-vault/ ;
        }
        #3.1CentOS/RHEL Base
        location /centos/ {
            proxy_pass http://mirrors.ustc.edu.cn/centos/ ;
        }
        #3.2epel
        location /epel/ {
            proxy_pass http://mirrors.ustc.edu.cn/epel/ ;
        }
        #3.3rpmforge
        location /rpmforge/ {
            proxy_pass http://mirrors.ustc.edu.cn/rpmforge/ ;
        }
        #3.4feaora
        location /fedora/ {
            proxy_pass http://mirrors.ustc.edu.cn/fedora/ ;
        }
        #3.5Debian
         location /debian/ {
            proxy_pass http://mirrors.ustc.edu.cn/debian/ ;
        }
        location /debian-security/ {
            proxy_pass http://mirrors.ustc.edu.cn/debian-security/ ;
        }
        #3.6ubuntu
        location /ubuntu/ {
            proxy_pass http://mirrors.ustc.edu.cn/ubuntu/ ;
        }
        #3.7OpenSUSE
        location /opensuse/ {
            proxy_pass http://mirrors.ustc.edu.cn/opensuse/ ;
        }
        #3.8Linux Kernel
                location /linux-kernel/ {
            proxy_pass http://mirrors.ustc.edu.cn/linux-kernel/ ;
        }
        #3.9rpmfusion
        location /rpmfusion/ {
            proxy_pass http://mirrors.ustc.edu.cn/rpmfusion/ ;
        }
        #4.0MySQL
        location /mysql/ {
            proxy_pass https://mirrors.tuna.tsinghua.edu.cn/mysql/ ;
        }
        #4.1K8S
        location /kubernetes/ {
            proxy_pass http://mirrors.ustc.edu.cn/kubernetes/ ;
        }
        #4.2pypi
        location /pypi/ {
            proxy_pass http://mirrors.ustc.edu.cn/pypi/ ;
        }
        #4.3zabbix
        location /zabbix/ {
            proxy_pass http://mirrors.ustc.edu.cn/zabbix/ ;
        }
        #4.4openssh
        location /openssh/ {
            proxy_pass http://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/ ;
        }
        #4.5zlib.h
        location /zlib/ {
            proxy_pass  http://www.zlib.net/ ;
        }
        #4.6openssl
        location /openssl/ {
            proxy_pass  http://www.openssl.org/source/ ;
        }
         #4.7mssql
        location /mssql2k17/ {
            proxy_pass  https://packages.microsoft.com/rhel/7/mssql-server-2017/ ;
        }
        location /mssql2k19/ {
            proxy_pass  https://packages.microsoft.com/rhel/7/mssql-server-2019/ ;
        }
}
EOF
