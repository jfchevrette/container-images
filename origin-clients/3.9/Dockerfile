FROM registry.centos.org/centos/centos:7

RUN yum -y update && \
    yum -y install centos-release-openshift-origin && \
    yum -y install origin-clients && \
    yum -y clean all && \
    rm -rf /var/cache/yum

RUN groupadd -g 1000 -r user && useradd -u 1000 -r -m -g user user

USER user

VOLUME ["/home/user/.kube"]

ENTRYPOINT ["/usr/bin/oc"]
CMD ["help"]
