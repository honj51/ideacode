# 导出客户数据 #
  1. 复制数据库
```
mysqldump hdagency -u root -ppassword --add-drop-table | mysql copy_hdagency -u root -ppassword
```
  1. 删除非本tid,城市数据
```
# 忽略表 
# advertisment chinesepy city exchangelog flowtype flowdef guide ,sparerequest survey surveyquestion target trent trentact
# trentcon trust trustact trustcon sysuser
delete from area where cityname<> '南昌';
delete from district where  cityname<> '南昌';


delete from blacklist where tid<>'xx';
delete from building  where tid<>'xx'; // TODO
delete from client where  tid<>'xx';
delete from comment where  tid<>'xx';
delete from complain where  tid<>'xx';
delete from contract where  tid<>'xx';
delete from contractact where  tid<>'xx';
delete from contractcomm where  tid<>'xx';
delete from contractcon where  tid<>'xx';
delete from contractfee where  tid<>'xx';
delete from contractfollow where  tid<>'xx';
delete from department where  tid<>'xx';
delete from developer where  tid<>'xx';
delete from empfollow where  tid<>'xx';
delete from estate where  tid<>'xx' and tid<>'00000000';
delete from estate_exclude where  tid<>'xx';
delete from faq where  tid<>'xx';
delete from fee where  tid<>'xx';
delete from find where  tid<>'xx';
delete from flow where  tid<>'xx';
delete from follow where  tid<>'xx';
delete from `group`  where  tid<>'xx';
delete from  group_bookmark where  tid<>'xx';
delete from group_inquiry where  tid<>'xx';
delete from group_property where  tid<>'xx';
delete from group_tenant  where  tid<>'xx';
delete from honest where  tid<>'xx';
delete from inquiry where  tid<>'xx';
delete from inquirybook where  tid<>'xx';
delete from inquiryfollow where  tid<>'xx';
delete from inquiryschedule where  tid<>'xx';
delete from intro where  tid<>'xx';
delete from livemessage where  tid<>'xx';
delete from `log` where  tid<>'xx';
delete from logclient  where  tid<>'xx';
delete from map where  tid<>'xx';
delete from message where  tid<>'xx';
delete from news where  tid<>'xx';
delete from note  where  tid<>'xx';
delete from photo where  tid<>'xx';
delete from phrase where  tid<>'xx';
delete from plan where  tid<>'xx';
delete from `position` where  tid<>'xx';
delete from prepare where  tid<>'xx';
delete from property where  tid<>'xx';
delete from propertybook where  tid<>'xx';
delete from propertyinquiry where  tid<>'xx';
delete from publish_account where  tid<>'xx';
delete from publish_config where  tid<>'xx';
delete from publish_paramname where  tid<>'xx';
delete from publish_paramvalue where  tid<>'xx';
delete from publish_website where  tid<>'xx';
delete from question where  tid<>'xx';
delete from reference where  tid<>'xx'  and tid<>'00000000';;
delete from rent where  tid<>'xx';
delete from report where  tid<>'xx';
delete from roll where  tid<>'xx';
delete from rule where  tid<>'xx';
delete from schedule where  tid<>'xx';
delete from sms where  tid<>'xx';
delete from spare where  tid<>'xx';
delete from sysset where  tid<>'xx';
delete from tenants where  tid<>'xx';
```


# 导出表数据 #
1. 把数据导出
2. 在Navicat中执行下面的sql
3. 使用导出向导导出

修改cityname的值，加入tid限制

## 导出 property表 中的数据 ##
```
select p.propertyno as 编号,p.trade as 交易,p.districtname as 城区,a.areaname as 片区,e.estatename as 楼盘,concat(countF,'房-',countT,'厅-',countW,'卫-',countY,'阳') as 房型,p.square as 面积,
concat(CAST(p.price AS CHAR),p.unitname) as 价格,concat(CAST(p.rentprice AS CHAR),p.rentunitname) as 租价,p.roomno as 房号,p.floor as 楼层,p.FloorAll as 总层,p.status as 状态, 
p.PropertyDirection as 朝向,p.PropertyUsage as 用途,p.PropertyType as 类型,p.OwnerName as 业主, p.OwnerMobile as 手机,p.OwnerTel as 电话,
p.TrustDate as 委托日,d.deptname as 部门,emp.empname as 员工
from property p 
left join estate e on  p.estateid=e.estateid
left join area a on  e.areaid=a.areaid
left join employee emp on  emp.empid=p.empid
left join department d on emp.deptid=d.deptid
where p.flagDeleted=0 and p.flagTrashed=0 and p.cityname='杭州'
order by p.trustdate desc
```

## 导出 inquiry表 中的数据 ##
```
select i.inquiryno as 编号,i.trade as 交易,i.districtName as 城区,a.areaname as 片区,concat(countF,'房-',countT,'厅-',countW,'卫-',countY,'阳') as 房型,concat(CAST(i.squaremin AS CHAR),'—',CAST(i.squaremax AS CHAR)) as 面积,
concat(CAST(i.pricemin AS CHAR),'—',CAST(i.pricemax AS CHAR),i.unitname) as 价格,i.floor as 楼层,i.status as 状态, 
i.PropertyDirection as 朝向,i.PropertyUsage as 用途,i.PropertyType as 类型,i.custName as 客户, i.custTel as 电话,
i.TrustDate as 委托日,d.deptname as 部门,emp.empname as 员工
from inquiry i 
left join area a on i.areaid=a.areaid
left join employee emp on  emp.empid=i.empid
left join department d on emp.deptid=d.deptid
where i.flagDeleted=0 and i.flagTrashed=0 and i.cityname='杭州'
order by i.trustdate desc
```