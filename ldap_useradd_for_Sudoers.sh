#!/bin/bash
#Time  :2016-06-12 by Bruce
#E-mail :tz6618@163.com
#software Version:openldap-servers 2.4.39-6
#OS : CentOS7
#Script Version : V0.1
###########################################################
# jumpserver中添加账户以后，仅是普通用户，不具有sudo权限  *
# 由于权限系统使用了自定义的schema，所以需要将用户加入到  *
# ou=Sudoers里面，才会具有sudo权限。 本脚本即实现自功能。 *
###########################################################
echo "dn: cn=$1,ou=Sudoers,dc=example,dc=cn
cn: $1
objectclass: top
objectclass: sudoRole
sudocommand: ALL
sudohost: ALL
sudooption: !authenticate
sudorunasuser: ALL
sudouser: $1">ldap_user.ldif
ldapadd -x -D "cn=Manager,dc=example,dc=cn" -h ldap-m.idc.example.cn -w tianzheng -f ./ldap_user.ldif
