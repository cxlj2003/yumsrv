使用Dock搭建私有yum源
临时搭建yum转发服务器，可转发CentOS/Ubuntu/epel 
docker run -d -p 80:80 --name yumsrv cxlj2003/yumsrv 
docker exec -it yumsrv bash 配置文件/etc/nginx/conf.d可根据需求修改 将本地yum文件中baseurl改成宿主机IP即可实现转发。
