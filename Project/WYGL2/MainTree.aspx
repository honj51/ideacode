
<% 
string admin_id = (string)Session["admin_id"];
string sql = string.Format("select admin_name from sq8szxlx.admin_admin where admin_id='{0}'",admin_id);
string role_name = DBHelper.GetRow(sql)["admin_name"].ToString();
string sql_2 = string.Format("select * from sq8szxlx.role_lb where role_name='{0}'", role_name);
 
    
%>

[
{
    text: '收费管理', 
    cls: 'folder',
    children:[
        {text: '数据录入',leaf: true},
        {text: '缴费管理',leaf: true}
    ]
},
{
    text: '资源管理', 
    cls: 'folder',
    children:[
        {text: '工业园管理',leaf: true},
        {text: '房产管理',leaf: true},
        {text: '公司列表',leaf: true},
        {text: '自然人列表',leaf: true}
    ]
},
{
    text: '租赁管理', 
    cls: 'folder',
    children:[
        {text: '预定管理',leaf: true},
        {text: '租赁合同管理',leaf: true},
        {text: '合同到期提示',leaf: true},
        {text: '收款分类统计',leaf: true},
        {text: '收款详细统计',leaf: true},
        {text: '临时开票',leaf: true}
    ]
},
{
    text: '系统管理', 
    cls: 'folder',
    children:[
        {text: '角色管理',leaf: true},
        {text: '管理员管理',leaf: true},
        {text: '修改密码',leaf: true}
    ]
}
]