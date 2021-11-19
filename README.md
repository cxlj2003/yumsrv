使用Dock和Nginx搭建私有yum源
=
1.启动容器 
--
    docker run -d -p 80:80 --name yumsrv cxlj2003/yumsrv
    或
    docker run -d -p 80:80 --name yumsrv ghcr.io/cxlj2003/yumsrv
2.自定义配置
--
    docker exec -it yumsrv bash 
    配置文件在/etc/nginx/conf.d/
    可根据需求修改
3.客户端配置文件生成
--
    3.1 CentOS-Base.sh 可生成CentOS6/7/8-Base.repo和RHEL6/7/8-Base.repo，将生成文件复制至/etc/yum.repos.d/,运行yum makecache fast更新缓存。
    3.2 epel.sh 可生成epel6/7.repo,将生成文件复制至/etc/yum.repos.d/,运行yum makecache fast更新缓存。
    3.4
    3.5
    3.6 Ubuntu-list.sh 可生成Ubuntu14/16/18/20.list，将生成文件复制至/etc/apt/list.d/,运行apt update更新缓存。


