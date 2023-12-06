#!/bin/bash

#yum clean all

echo -e "\033[33;1;7m### mounting /var/www/html...\033[m"

mount -o ro /root/rhel92downloads/rhel-9.2-x86_64-dvd.iso /var/www/html/repo
mount | grep www
echo -e "\033[32m## mounted.\033[m"
systemctl status httpd --no-pager
echo
echo -e "\033[33;1;7m## starting httpd...\033[m"
systemctl start httpd
echo -e "\033[33;1;7m## checking httpd status...\033[m"
systemctl status httpd --no-pager
echo -e "\033[32m## httpd started.\033[m"
echo
echo "curl localhost/repo/"

#yum makecache
echo -e "\033[33;1;7m## starting repolist...\033[m"
#yum repolist all

#yum search vim
echo -e "\033[32m## done.\033[m"
#if [[ $results == *"BaseOS"* ]]; then echo "good" ; else echo "BaseOS not found."; fi

