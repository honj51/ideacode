# 数据自动备份 #

## 具体步骤 ##
  * 先新建一个备份文件夹
  * 建个脚本代码
```
filename=`date +%Y%m%d`
/usr/local/mysql/bin/mysqldump --opt hdagency -uroot -pHudongsoft12# | 

gzip >$filename.gz
```