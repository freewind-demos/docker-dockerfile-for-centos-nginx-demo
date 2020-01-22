FROM centos:centos6

ENV nginxversion="1.14.0-1" \
    os="centos" \
    osversion="6"

RUN yum install -y wget openssl sed initscripts &&\
    yum clean all &&\
    wget http://nginx.org/packages/$os/$osversion/x86_64/RPMS/nginx-$nginxversion.el$osversion.ngx.x86_64.rpm &&\
    rpm -iv nginx-$nginxversion.el$osversion.ngx.x86_64.rpm

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /data/www/index.html
VOLUME [ "/data/www" ]
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
