# lighttpd-centos7
FROM openshift/base-centos7

# TODO: Put the maintainer name in the image metadata
LABEL maintainer="ykaj9758@gmail.com"

# TODO: Rename the builder environment variable to inform users about application you provide them
ENV BUILDER_VERSION 1.0

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Platform for building light http " \
      io.k8s.display-name="building light htt" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,html,lighttpd"

# TODO: Install required packages here:
RUN yum -y install epel-release && yum install -y lighttpd && yum clean all -y

LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
# sets io.openshift.s2i.scripts-url label that way, or update that label
COPY s2i/bin/ /usr/local/s2i 

# Copy the lighttpd configuration file
#The destination in the above command (./) is using working directory set in the openshift/base-centos7 image
#which is set to be /opt/app-root/src.
COPY ./etc/ /opt/app-root/etc


# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chown -R 1001:1001 /opt/app-root && && chmod 755 -R /usr/local/s2i

# This default user is created in the openshift/base-centos7 image
USER 1001

# TODO: Set the default port for applications built using this image
EXPOSE 8080

# TODO: Set the default CMD for the image
CMD ["usage"]
