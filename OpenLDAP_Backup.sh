#!/bin/bash
#Time  :2016-06-06 by Bruce
#E-mail :tz6618@163.com
#software Version:openldap-servers 2.4.39-6
#OS : CentOS7
#Script Version : V0.1

cat >./openldap_backup.synax <<EOF
/^creatorsName: /d
/^modifiersName: /d
/^modifyTimestamp: /d
/^structuralObjectClass: /d
/^createTimestamp: /d
/^entryUUID: /d
/^contextCSN: /d
/^entryCSN: /d
EOF

##full backup
slapcat -v -l ./openldap_backup.ldif
##filter no-used items before Use ldapadd to discovery
cat ./openldap_backup.ldif | sed -f ./openldap_backup.synax > ./openldap_backup_`date +%Y-%m-%d-%H-%M-%S`.ldif
##remove temporary files
rm -rf ./openldap_backup.ldif ./openldap_backup.synax
