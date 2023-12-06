#!/bin/bash

## osinfo-query os name="Red Hat Enterprise Linux 9.2"

servername=server-1

virt-install \
--name $servername \
--memory 2048 \
--vcpus 2 \
--disk /home/student/vmm_storage/$servername.qcow2 \
--import \
--os-variant rhel9.2
