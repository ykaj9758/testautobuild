FROM centos:centos7
EXPOSE 9080
COPY  index.html /var/run/web/index.html
CMD cd /var/run/web && python -m SimpleHTTPServer 9080
