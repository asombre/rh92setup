#!/bin/bash

firewall-cmd --list-all 
firewall-cmd --list-all --zone=libvirt
firewall-cmd --add-service http --permanent
firewall-cmd --add-service http --permanent --zone=libvirt
firewall-cmd --reload

firewall-cmd --list-all
firewall-cmd --list-all --zone=libvirt
