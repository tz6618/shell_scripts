#!/bin/bash
#Time  :2016-06-06 by Bruce
#E-mail :tz6618@163.com
#software Version:openldap-servers 2.4.39-6
#OS : CentOS7
#Script Version : V0.1
systemctl stop slapd
rm -rf /etc/openldap/slapd.d
mkdir /etc/openldap/slapd.d
slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d/
chown -R ldap.ldap /etc/openldap/slapd.d
systemctl start slapd
