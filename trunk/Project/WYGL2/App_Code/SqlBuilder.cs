using System;
using System.Data;
using System.Configuration;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

/// <summary>
///SqlBuilder 的摘要说明
/// </summary>
public class SqlBuilder
{
    public static string NameValueToSql(Dictionary<string,object> dict, string table, string primary, bool insert)
    {
        NameValueCollection nvc = new NameValueCollection();
        foreach (KeyValuePair<string,object> item in dict)
        {
            nvc.Add(item.Key, item.Value.ToString());
        }
        return NameValueToSql(nvc, table, primary, insert);
    }

    // 根据form提交的数据生成对应的sql语句
    public static string NameValueToSql(NameValueCollection nvc, string table, string primary, bool insert)
    {
        string shortTableName = table;
        if (table.IndexOf('.') > -1)
        {
            shortTableName = table.Substring(table.IndexOf('.')+1);
        }
        Dictionary<string, string> columns = GetAllTableColumns(shortTableName);

        if (insert)
        {
            StringBuilder names = new StringBuilder();
            StringBuilder values = new StringBuilder();

            foreach (String name in nvc.AllKeys)
            {
                string value = nvc.Get(name);
                if (!columns.ContainsKey(name)) continue;
                bool quote = true;
                // TODO: SQL 关键字处理
                if (name == primary)
                {
                    continue;
                }
                else if (value == "null" || columns[name] == "56" || columns[name] == "60") // 数字
                {
                    quote = false;
                }
                names.AppendFormat("{0},", name);
                if (quote)
                {
                    values.AppendFormat("'{0}',", value);
                }
                else
                {
                    values.AppendFormat("{0},", value);
                }                
            }
            names.Remove(names.Length - 1, 1);
            values.Remove(values.Length - 1, 1);

            return string.Format("insert into {0} ({1}) values ({2})", table, names.ToString(), values.ToString());
        }
        else
        {
            StringBuilder sb = new StringBuilder();

            foreach (String s in nvc.AllKeys)
            {
                if (!columns.ContainsKey(s)) continue;
                // TODO: SQL 关键字处理
                if (s == primary)
                {
                    if (insert)
                    {
                        sb.AppendFormat("{0}={1},", s, nvc.Get(s));
                        // TODO: 自增？
                    }
                }
                else if (columns[s] == "56" || columns[s] == "60") // 数字,money
                {
                    sb.AppendFormat("{0}={1},", s, nvc.Get(s));
                }
                else
                {
                    sb.AppendFormat("{0}='{1}',", s, nvc.Get(s));
                }
            }
            sb.Remove(sb.Length - 1, 1);
            
            return string.Format("update {0} set {1} where {2}='{3}'", table, sb.ToString(), primary, nvc.Get(primary));
        }       
    }

    // 根据提交的json字符串生成对应sql语句
    //public static string JsonToSql(string json, string table, string primary, bool insert)
    //{
    //    JavaScriptSerializer s = new JavaScriptSerializer();
    //    NameValueCollection og = (NameValueCollection)s.DeserializeObject(json);
    //    return NameValueToSql(og, table, primary, insert);
    //}

    public static Dictionary<string, string> GetAllTableColumns(string table)
    {

        Dictionary<string, string> result = new Dictionary<string, string>();
        string sql = string.Format("select name,xtype from syscolumns where id=(select max(id) from sysobjects where xtype='u' and name='{0}')", table);

        ResultObject ro = DBHelper.GetResult(sql);
        foreach (RowObject row in ro)
        {
            string name = row["name"].ToString();
            string xtype = row["xtype"].ToString(); 
            result.Add(name, xtype);
        }
        return result;
    }

}
