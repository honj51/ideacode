using System;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Collections.Specialized;

/// <summary>
///Common 的摘要说明
/// </summary>
public class Common
{
    public static string makeMD5(string s)
    {
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] b = UTF8Encoding.Default.GetBytes(s);
        string result = BitConverter.ToString(md5.ComputeHash(b), 4, 8);
        result = result.Replace("-", string.Empty);
        result = result.ToLower();
        return result;
    }

    public static NameValueCollection copyForm(NameValueCollection nv, string[] deleteItems)
    {
        NameValueCollection nvc = new NameValueCollection();
        for (int i = 0; i < nv.Count; i++)
        {
            bool toDelete = false;
            foreach (string item in deleteItems)
            {
                if (item == nv.GetKey(i))
                {
                    toDelete = true;
                    break;
                }
            }
            if (toDelete) continue;
            
            nvc.Add(nv.GetKey(i), nv.Get(i));
        }
        return nvc;
    }
}
