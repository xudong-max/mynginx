FROM  nginx
LABEL  owner="test"
COPY   nginx.conf   /etc/nginx/nginx.conf
COPY   html/  /var/www/html

