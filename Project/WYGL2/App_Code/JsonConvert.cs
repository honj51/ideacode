//using System.Collections.Generic;
//using System.Text;
//using System.Text.RegularExpressions;

/// <summary>
/// 类  名：JSONConvert
/// 描  述：JSON解析类
/// 编  写：dnawo
/// 站  点：http://www.mzwu.com/
/// 日  期：2010-01-06
/// 版  本：1.1.0
/// </summary>
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Text;
using System;
public static class JSONConvert
{
    #region 全局变量

    private static JSONObject _json = new JSONObject();//寄存器
    private static readonly string _SEMICOLON = "@semicolon";//分号转义符
    private static readonly string _COMMA = "@comma"; //逗号转义符

    #endregion

    #region 字符串转义
    /// <summary>
    /// 字符串转义,将双引号内的:和,分别转成_SEMICOLON和_COMMA
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    private static string StrEncode(string text)
    {
        MatchCollection matches = Regex.Matches(text, "\\\"[^\\\"]+\\\"");
        foreach (Match match in matches)
        {
            text = text.Replace(match.Value, match.Value.Replace(":", _SEMICOLON).Replace(",", _COMMA));
        }

        return text;
    }

    /// <summary>
    /// 字符串转义,将_SEMICOLON和_COMMA分别转成:和,
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    private static string StrDecode(string text)
    {
        return text.Replace(_SEMICOLON, ":").Replace(_COMMA, ",");
    }

    #endregion

    #region JSON最小单元解析

    /// <summary>
    /// 最小对象转为JSONObject
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    private static JSONObject DeserializeSingletonObject(string text)
    {
        JSONObject jsonObject = new JSONObject();

        MatchCollection matches = Regex.Matches(text, "(\\\"(?<key>[^\\\"]+)\\\":\\\"(?<value>[^,\\\"]+)\\\")|(\\\"(?<key>[^\\\"]+)\\\":(?<value>[^,\\\"\\}]+))");
        foreach (Match match in matches)
        {
            string value = match.Groups["value"].Value;
            jsonObject.Add(match.Groups["key"].Value, _json.ContainsKey(value) ? _json[value] : StrDecode(value));
        }

        return jsonObject;
    }

    /// <summary>
    /// 最小数组转为JSONArray
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    private static JSONArray DeserializeSingletonArray(string text)
    {
        JSONArray jsonArray = new JSONArray();

        MatchCollection matches = Regex.Matches(text, "(\\\"(?<value>[^,\\\"]+)\")|(?<value>[^,\\[\\]]+)");
        foreach (Match match in matches)
        {
            string value = match.Groups["value"].Value;
            jsonArray.Add(_json.ContainsKey(value) ? _json[value] : StrDecode(value));
        }

        return jsonArray;
    }

    /// <summary>
    /// 反序列化
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    private static string Deserialize(string text)
    {
        text = StrEncode(text);//转义;和,
        _json.Clear();
        int count = 0;
        string key = string.Empty;
        string pattern = "(\\{[^\\[\\]\\{\\}]+\\})|(\\[[^\\[\\]\\{\\}]+\\])";

        while (Regex.IsMatch(text, pattern))
        {
            MatchCollection matches = Regex.Matches(text, pattern);
            foreach (Match match in matches)
            {
                key = "___key" + count + "___";

                if (match.Value.Substring(0, 1) == "{")
                    _json.Add(key, DeserializeSingletonObject(match.Value));
                else
                    _json.Add(key, DeserializeSingletonArray(match.Value));

                text = text.Replace(match.Value, key);

                count++;
            }
        }
        return text;
    }

    #endregion

    #region 公共接口

    /// <summary>
    /// 序列化JSONObject对象
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    public static JSONObject DeserializeObject(string text)
    {
        return _json[Deserialize(text)] as JSONObject;
    }

    /// <summary>
    /// 序列化JSONArray对象
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    public static JSONArray DeserializeArray(string text)
    {
        return _json[Deserialize(text)] as JSONArray;
    }

    /// <summary>
    /// 反序列化JSONObject对象
    /// </summary>
    /// <param name="jsonObject"></param>
    /// <returns></returns>
    public static string SerializeObject(JSONObject jsonObject)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("{");
        foreach (KeyValuePair<string, object> kvp in jsonObject)
        {
            if (kvp.Value is JSONObject)
            {
                sb.Append(string.Format("\"{0}\":{1},", kvp.Key, SerializeObject((JSONObject)kvp.Value)));
            }
            else if (kvp.Value is JSONArray)
            {
                sb.Append(string.Format("\"{0}\":{1},", kvp.Key, SerializeArray((JSONArray)kvp.Value)));
            }
            else if (kvp.Value is String)
            {
                sb.Append(string.Format("\"{0}\":\"{1}\",", kvp.Key, kvp.Value));
            }
            else
            {
                sb.Append(string.Format("\"{0}\":{1},", kvp.Key, kvp.Value));
            }
        }
        if (sb.Length > 1)
            sb.Remove(sb.Length - 1, 1);
        sb.Append("}");
        return sb.ToString();
    }

    /// <summary>
    /// 反序列化JSONArray对象
    /// </summary>
    /// <param name="jsonArray"></param>
    /// <returns></returns>
    public static string SerializeArray(JSONArray jsonArray)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("[");
        for (int i = 0; i < jsonArray.Count; i++)
        {
            if (jsonArray[i] is JSONObject)
            {
                sb.Append(string.Format("{0},", SerializeObject((JSONObject)jsonArray[i])));
            }
            else if (jsonArray[i] is JSONArray)
            {
                sb.Append(string.Format("{0},", SerializeArray((JSONArray)jsonArray[i])));
            }
            else if (jsonArray[i] is String)
            {
                sb.Append(string.Format("\"{0}\",", jsonArray[i]));
            }
            else
            {
                sb.Append(string.Format("\"{0}\",", ""));
            }

        }
        if (sb.Length > 1)
            sb.Remove(sb.Length - 1, 1);
        sb.Append("]");
        return sb.ToString();
    }
    #endregion
}

/// <summary>
/// 类  名：JSONObject
/// 描  述：JSON对象类
/// 编  写：dnawo
/// 站  点：http://www.mzwu.com/
/// 日  期：2010-01-06
/// 版  本：1.1.0
/// 更新历史：
///     2010-01-06  继承Dictionary<TKey, TValue>代替this[]
/// </summary>
public class JSONObject : Dictionary<string, object>
{ }

/// <summary>
/// 类  名：JSONArray
/// 描  述：JSON数组类
/// 编  写：dnawo
/// 站  点：http://www.mzwu.com/
/// 日  期：2010-01-06
/// 版  本：1.1.0
/// 更新历史：
///     2010-01-06  继承List<T>代替this[]
/// </summary>
public class JSONArray : List<object>
{ }

public static class Test{
    public static void MyTest() {
        JSONArray _array = new JSONArray();
        _array.Add("1");
        _array.Add("2");
        _array.Add("3");
        _array.Add("4");
        JSONObject _object = new JSONObject();//新建json对象作为内嵌
        _object.Add("oneKey", "one");
        _object.Add("twoArray", _array);
        JSONArray jsonArray = new JSONArray();
        jsonArray.Add("2006");
        jsonArray.Add("2007");
        jsonArray.Add("2008");
        jsonArray.Add("2009");
        jsonArray.Add("2010");
        JSONObject jsonObject = new JSONObject();
        jsonObject.Add("domain", "mzwu.com");
        jsonObject.Add("two", _object);//添加json对象
        jsonObject.Add("years", jsonArray);
        Console.WriteLine("json序列化为字符串");
        Console.WriteLine(JSONConvert.SerializeObject(jsonObject));//执行序列化
        //反序列化
        JSONObject json = JSONConvert.DeserializeObject("{\"domain\":\"mzwu.com\",\"two\":{\"oneKey\":\"one\",\"twoArray\":[1,2,3,4]},\"years\":[2006,2007,2008,2009,2010]}");//执行反序列化
        if (json != null)
        {
            Console.WriteLine("将json结构的字符串反序列化为json对象并调用");
            Console.WriteLine(json["domain"]);
            Console.WriteLine(((JSONObject)json["two"])["oneKey"]);
            Console.WriteLine(((JSONArray)((JSONObject)json["two"])["twoArray"])[0]);
            Console.WriteLine(((JSONArray)json["years"])[3]);
        }
        Console.ReadLine();
    }
}
//序列化
