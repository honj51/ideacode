using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Tree : System.Web.UI.Page
{
    protected int sjlr=0;
    protected int jfgl = 0;
    protected int gyygl = 0;
    protected int fcgl = 0;
    protected int kugl = 0;
    protected int ydgl = 0;
    protected int zlht = 0;
    protected int htdqts = 0;
    protected int skfltj = 0;
    protected int skxxtj = 0;
    protected int jsqx = 0;
    protected int glygl = 0;
    protected int xgbsmm = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        string admin_id = (string)Session["admin_id"];
        string sql = string.Format("select admin_limit from sq8szxlx.admin_admin where admin_id='{0}'",admin_id);
        string role_name = DBHelper.GetRow(sql)["admin_limit"].ToString();

        if (role_name == "总管理员")
        {
            sjlr = 1;
            jfgl = gyygl = fcgl = kugl = ydgl = zlht = htdqts = skfltj = skxxtj = jsqx = glygl = xgbsmm = 1;
            return;
        }
        string sql_2 = string.Format("select * from sq8szxlx.role_lb where role_name='{0}'", role_name);
        RowObject role_s = DBHelper.GetRow(sql_2);

        sjlr = getFiledValue(role_s["数据录入"]);
        jfgl = getFiledValue(role_s["缴费管理"]);
        gyygl = getFiledValue(role_s["工业园管理"]);
        fcgl = getFiledValue(role_s["房产管理"]);
        kugl = getFiledValue(role_s["客户管理"]);
        ydgl = getFiledValue(role_s["预定管理"]);
        zlht = getFiledValue(role_s["租凭合同管理"]);
        htdqts = getFiledValue(role_s["合同到期提示"]);
        skfltj = getFiledValue(role_s["收款分类统计"]);
        skxxtj = getFiledValue(role_s["收款详细统计"]);
        jsqx = getFiledValue(role_s["角色权限"]);
        glygl = getFiledValue(role_s["管理员管理"]);
        xgbsmm = getFiledValue(role_s["修改本身密码"]); 
    }

    private int getFiledValue(object v) {
        
        if (v != null && !(v is DBNull))
        {
            return Convert.ToInt32(v);
        }
        return 0;
    }
}
