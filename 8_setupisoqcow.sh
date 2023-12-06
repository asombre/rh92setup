#!/bin/bash

echo "copying iso files..."
cp -av rhel92downloads/*.iso /home/student/vmm_iso/
cp -av rhel92downloads/rhel-9.2-x86_64-kvm.qcow2 /home/student/vmm_storage/server-1.qcow2
cp -av rhel92downloads/rhel-9.2-x86_64-kvm.qcow2 /home/student/vmm_storage/server-2.qcow2
sleep 1s

echo "listing..."
ls -l /home/student/vmm_iso/
ls -l /home/student/vmm_storage/
sleep 1s

echo "chown..."
chown student:student /home/student/vmm_iso/rhel-9.2-x86_64-boot.iso
chown student:student /home/student/vmm_iso/rhel-9.2-x86_64-dvd.iso
chown student:student /home/student/vmm_storage/server-1.qcow2
chown student:student /home/student/vmm_storage/server-2.qcow2
sleep 1s

ls -ld /home/student/vmm_iso
ls -l  /home/student/vmm_iso
ls -ld /home/student/vmm_storage
ls -l /home/student/vmm_storage
sleep 1s

cd /home/student/vmm_storage
pwd
ls -l
export LIBGUESTFS_BACKEND=direct
virt-customize -a server-1.qcow2 --root-password password:redhat --uninstall cloud-init
virt-customize -a server-2.qcow2 --root-password password:redhat --uninstall cloud-init

usermod -G libvirt student

getfacl /home/student
setfacl -m user:qemu:x /home/student/
getfacl /home/student
echo "done"
