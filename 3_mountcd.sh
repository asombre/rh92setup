#!/bin/bash

printf "=%.0s" {1..55}
echo
echo -e "\033[33;1;7m## mounting cd to repo...\033[m"
mount -o ro /root/rhel92downloads/rhel-9.2-x86_64-dvd.iso /repo
mount | grep repo
echo -e "\033[32m## mounted.\033[m"

echo -e "\033[33;1;7m## list /repo...\033[m"
ls -l /repo/
echo -e "\033[32m## done...\033[m"

echo -e "\033[33;1;7m## yum repolist...\033[m"
yum repolist all
echo -e "\033[32m## done.\033[m"

yum search vim
#if [[ $results == *"BaseOS"* ]]; then echo "good" ; else echo "BaseOS not found."; fi
