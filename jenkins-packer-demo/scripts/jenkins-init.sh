#!/bin/bash

set -ex

# volume setup
vgchange -ay

DEVICE_FS=`blkid -o value -s TYPE ${DEVICE} || echo ""`
if [ "`echo -n $DEVICE_FS`" == "" ] ; then 
  # wait for the device to be attached
  DEVICENAME=`echo "${DEVICE}" | awk -F '/' '{print $3}'`
  DEVICEEXISTS=''
  while [[ -z $DEVICEEXISTS ]]; do
    echo "checking $DEVICENAME"
    DEVICEEXISTS=`lsblk |grep "$DEVICENAME" |wc -l`
    if [[ $DEVICEEXISTS != "1" ]]; then
      sleep 15
    fi
  done
  pvcreate ${DEVICE}
  vgcreate data ${DEVICE}
  lvcreate --name volume1 -l 100%FREE data
  mkfs.ext4 /dev/data/volume1
fi
mkdir -p /var/lib/jenkins
echo '/dev/data/volume1 /var/lib/jenkins ext4 defaults 0 0' >> /etc/fstab
mount /var/lib/jenkins

# update all pachages
sudo yum update -y
# install dependencies
sudo yum install java-1.8.0 -y
sudo yum remove java-1.7.0-openjdk -y
# jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo                      
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins-${JENKINS_VERSION} -y
sudo service jenkins start
sudo chkconfig --add jenkins


# install terraform
sudo wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
&& sudo unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip


# install packer
cd /usr/local/bin
sudo wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
sudo unzip -o packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin/
rm packer_${PACKER_VERSION}_linux_amd64.zip

# install git
sudo yum install git -y
