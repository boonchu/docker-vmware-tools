# http://partnerweb.vmware.com/GOSIG/CentOS_7.html#Tools
# Vmware KB: 1007873 https://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1007873
FROM centos:7

MAINTAINER Boonchu Ngampairoijpibul <bigchoo@gmail.com>

RUN yum install -y epel-release

ADD vmware-tools.repo /etc/yum.repos.d/
RUN yum install -y open-vm-tools-deploypkg

ADD scripts /etc/vmware-tools/scripts
RUN chmod -R +x /etc/vmware-tools/scripts/*

# turn on debug logging on/off from tools.conf
# ADD tools.conf /etc/vmware-tools/tools.conf

ADD sbin /usr/sbin

# no longer relevant to service start up from CentOS 7 guest
# ADD run-services.sh /
# RUN chmod +x /run-services.sh
# CMD /run-services.sh

CMD systemctl restart vmtoolsd
