﻿using System;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

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
}
