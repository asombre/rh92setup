#!/bin/bash

echo "list and delete default repo..."
ls -l /etc/yum.repos.d/
rm -f /etc/yum.repos.d/*

echo "copying file..."
cp configdir/rhelfile.repo /etc/yum.repos.d/

echo "listing repos directory..."
ls -l /etc/yum.repos.d/

echo "done"
