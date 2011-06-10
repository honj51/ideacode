using System;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Collections.Specialized;
using System.Collections.Generic;

/// <summary>
///Common 的摘要说明
/// </summary>
public class Common
{
    public static string MakeMD5(string s)
    {
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] b = UTF8Encoding.Default.GetBytes(s);
        string result = BitConverter.ToString(md5.ComputeHash(b), 4, 8);
        result = result.Replace("-", string.Empty);
        result = result.ToLower();
        return result;
    }

    public static Dictionary<string, object> CopyFormToDict(NameValueCollection nv)
    {
        return CopyFormToDict(nv, null);
    }

    public static Dictionary<string, object> CopyFormToDict(NameValueCollection nv, string[] deleteItems)
    {
        Dictionary<string, object> dict = new Dictionary<string, object>();
        
        for (int i = 0; i < nv.Count; i++)
        {
            bool toDelete = false;
            if (deleteItems != null)
            {
                foreach (string item in deleteItems)
                {
                    if (item == nv.GetKey(i))
                    {
                        toDelete = true;
                        break;
                    }
                }
            }
            if (toDelete) continue;

            dict.Add(nv.GetKey(i), nv.Get(i));
        }
        return dict;
    }

    public static bool hasValue(string p)
    {
        if (string.IsNullOrEmpty(p) || p == "(全部)") return false;
        return true;
    }

    // 获取客户编号
    public static string getKhbh(string khmc)
    {
        string sql = string.Format("select 编码 from sq8szxlx.user_zrr where 名称='{0}'", khmc);
        return DBHelper.GetVar(sql).ToString();
    }

    // 更新房产状态
    public static void updateFCZT(string gyy, string fclx, string fh, string yezu, string zt)
    {
        string sql = string.Format("select id from sq8szxlx.gyy_fc_lb where 工业园名称='{0}' and 房产类型='{1}' and 房号='{2}'", gyy, fclx, fh);
        if (DBHelper.GetVar(sql) == null) return;
        string id = DBHelper.GetVar(sql).ToString();

        Dictionary<string, object> dict2 = new Dictionary<string, object>();
        dict2["id"] = id;
        dict2["状态"] = zt;
        dict2["业主"] = yezu;
        sql = SqlBuilder.NameValueToSql(dict2, "sq8szxlx.gyy_fc_lb", "id", false);
        DBHelper.ExecuteSql(sql);
    }
}
