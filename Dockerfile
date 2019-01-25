FROM centos:centos7
RUN yum -y update & yum -y install python-pip
RUN pip install awscli & pip install boto3
EXPOSE 9080
COPY  index.html /var/run/web/index.html
CMD cd /var/run/web && python -m SimpleHTTPServer 9080
