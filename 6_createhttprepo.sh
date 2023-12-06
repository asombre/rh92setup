#!/bin/bash

rm /etc/yum.repos.d/*.repo
cp configdir/rhel.repo /etc/yum.repos.d/

yum clean all
yum makecache

yum repolist

curl http://192.168.122.1/repo/
