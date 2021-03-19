###指定镜像
FROM centos:7
###yum安装依赖
RUN  yum -y  install \
	gcc gcc-c++ autoconf automake make \
	zlib zlib-devel openssl openssl-devel pcre pcre-devel
###复制nginx目录
COPY nginx-1.19.8 /usr/local/src/nginx-1.19.8
###开始编辑安装
RUN  cd /usr/local/src/nginx-1.19.8  \
	&& /usr/local/src/nginx-1.19.8/configure --prefix=/usr/local/nginx  --with-http_sub_module \
	&& make && make install \
	&& useradd nginx -s /sbin/nologin  \
	&& ln -sv /usr/local/nginx/sbin/nginx   /usr/sbin/nginx  \
	&& echo "test   hhh"  > /usr/local/nginx/html/index.html 
###暴露端口
EXPOSE  80  443
###启动nginx
CMD  ["nginx" , "-g" , "daemon off;"]


