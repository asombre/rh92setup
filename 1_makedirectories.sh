#!/bin/bash

du -h | grep rhel

echo "creating new directories..."
mkdir /home/student/vmm_iso
mkdir /home/student/vmm_storage
mkdir /repo
echo "done"

echo "changing ownership..."
chown student:student /home/student/vmm_iso
chown student:student /home/student/vmm_storage
echo "done"

echo "checking sha256"
cd /root/rhel92downloads/
sha256sum -c redhatlinux.sha256
