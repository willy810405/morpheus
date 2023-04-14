#!/bin/bash

# create local ISO repo 
#mkdir -p  /mnt/disc
#mount -o loop rhel-server-7.9-x86_64-dvd.iso /mnt/disc
#cp /mnt/disc/media.repo /etc/yum.repos.d/rhel7dvd.repo
#chmod 644 /etc/yum.repos.d/rhel7dvd.repo
#sed -i 's/gpgcheck=0/gpgcheck=1/g' /etc/yum.repos.d/rhel7dvd.repo
#echo "enabled=1
#baseurl=file:///mnt/disc/
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release" >> /etc/yum.repos.d/rhel7dvd.repo

# Create local repo from tar file
mkdir -p /var/www/html
tar -C /var/www/html -xvf repofile.tar
echo "[rhel-7-server-optional-rpms]
name=RHEL 7 Server Optional RPMs
baseurl=file:///var/www/html/rhel-7-server-optional-rpms
gpgcheck=0
enabled=1

[rhel-7-server-rpms]
name=RHEL 7 Server RPMs
baseurl=file:///var/www/html/rhel-7-server-rpms
gpgcheck=0
enabled=1" >> /etc/yum.repos.d/internal-repos.repo

yum clean all
yum repolist enabled

# Install Morpheus Applicane
rpm -i morpheus-appliance-6.0.2-1.el7.x86_64.rpm
rpm -i morpheus-appliance-supplemental-6.0.2-1.noarch.rpm