#!/bin/bash

## osinfo-query os name="Red Hat Enterprise Linux 9.2"
#vmname=rhel94-$(date +%s)
#punum=4
#emnum=4096
#imgpath=/var/lib/libvirt/images
#isopath=$imgpath/rhel-9.4-x86_64-dvd.iso
#diskpath=$imgpath/$vmname.qcow2,size=60
#ksfile=textstd.ks
#kspath=/home/$USER/Documents/kickstarts/$ksfile

#sudo virt-install \
#--name $vmname \
#--vcpus $cpunum \
#--memory $memnum \
#--location $isopath \
#--disk $diskpath \
#--initrd-inject $kspath \
#--extra-args inst.ks="file:/$ksfile console=tty0 console=ttyS0,115200" \
#--osinfo rhel9.4 \
#--nographics

servername=server-1

virt-install \
--name $servername \
--memory 2048 \
--vcpus 2 \
--disk /home/student/vmm_storage/$servername.qcow2 \
--import \
--os-variant rhel9.2
