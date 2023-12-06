#!/bin/bash

pkgs1="vim virt-manager httpd tmux gnome-tweaks guestfs-tools git"
pkgs2="tigervnc virt-install virt-viewer wireshark emacs"

for i in $pkgs1
    do
    echo
    echo -e "\033[32minstalling... $i\033[m"
    yum install $i -y
done

for i in $pkgs2
    do
    echo
    echo -e "\033[32minstalling... $i\033[m"
    yum install $i -y
done

echo "create http repo directory after httpd install"
mkdir /var/www/html/repo

echo "umounting local /repo"
umount /repo

## 192.168.122.1 unavailable until libvirtd started
ip -c a show virbr0
systemctl status libvirtd --no-pager
systemctl enable libvirtd --now
ip -c a show virb0

echo 
echo "enabled and started libvirt"
systemctl status libvirtd --no-pager

#curl http://localhost/repo/
echo "============================================"
#curl -s http://192.168.122.1/repo/ | awk '{ print $5 }' | grep href
echo "============================================"
echo
echo "set hostname"
hostnamectl set-hostname server-w-gui-1.example.com
timedatectl set-timezone America/Denver

echo "check hostname and date"
