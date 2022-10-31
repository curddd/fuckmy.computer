#!/bin/sh
systemctl disable firewalld
systemctl stop firewalld
cp nsaconfig /etc/selinux/config
