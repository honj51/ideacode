# 查看租户使用度 #

```
select t.tid,t.city,t.name,t.version,count(l.tid)
from tenants t left join `log` l on t.tid=l.tid
group by t.city,t.name
order by count(l.tid) desc
```