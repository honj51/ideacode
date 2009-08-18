if exists (select * from sysdatabases where name='LiveSupport')
    drop database LiveSupport
create database LiveSupport
on
(
  name='LiveSupport_data',
  filename='C:\LiveSupport_data.mdf',
  size=10mb,
  filegrowth=20%
)
log on
(
  name='bbsDB_log',
  filename='C:\LiveSupport_log.ldf',
  size=1mb,
  maxsize=20mb,
  filegrowth=10%
)