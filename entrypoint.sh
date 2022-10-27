#!/bin/bash
echo 'start' >> /tmp/log.txt
mkdir /drivers 2>&1 |tee -a /tmp/log.txt
cd /drivers
curl -k -O https://dl.dell.com/FOLDER07777516M/1/UNIFIED_DRVR_DMJJ6_RHEL8.4_37.00.02.00_A00.tar.gz|tee -a /tmp/log.txt
tar -zxvf UNIFIED_DRVR_DMJJ6_RHEL8.4_37.00.02.00_A00.tar.gz 2>&1 |tee -a /tmp/log.txt
rpm -ivh /drivers/UNIFIED_DRVR_DMJJ6_RHEL8.4_37.00.02.00_A00/RHEL8.4/rpms-3/kmod-mpt3sas-37.00.02.00_el8.4-3.x86_64.rpm 2>&1 |tee -a /tmp/log.txt
modprobe -v mpt3sas 2>&1 |tee -a /tmp/log.txt
echo 'end' >> /tmp/log.txt
#while true; do sleep 30; done;
/sbin/init
