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

}
