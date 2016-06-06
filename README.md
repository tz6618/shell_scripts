# shell_scripts
日常运维脚本

1. OpenLDAP_Backup.sh 用于全量备份OpenLDAP数据，恢复步骤如下:
    
    #第一步清空ldap数据库

    ldapdelete -x -D "cn=Manager,dc=example,dc=cn" -w password -r "dc=xdja,dc=cn"

    #第二步检查是否完全清空

    ldapsearch -x -LLL | wc -l

    #第三步从备份文件中恢复条目

    ldapadd -x -D "cn=Manager,dc=example,dc=cn" -w password -f openldap_backup.ldif

    #第四步检查恢复是否完整

    ldapsearch -x -LLL | wc -l

2.format_disk_for_hdfs.sh 批量初始化用于Hadoop服务器磁盘的脚本，场景说明：
    
    1.系统安装完毕后服务器尚有10块盘未格式化和挂载
    
    2.要求将这10块盘挂载到/home/hadoop/下的是个独立的目录上
    
    3.挂载完毕后，要求写入/etc/fstab中

