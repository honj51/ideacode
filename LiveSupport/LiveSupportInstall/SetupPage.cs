using System;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Collections;
using LiveSupport.BLL;
using System.DirectoryServices;
using LiveSupport.BLL.Utils;

namespace LiveSupportInstall
{
    /// <summary>
    /// SetupPage 的摘要说明。
    /// </summary>
    public class SetupPage : System.Web.UI.Page
    {
        public static readonly string producename = "LiveSupport 2.0 (.NET Framework 2.0/3.x) ";  //当前产品版本名称

        public static readonly string footer = "";

        public static readonly string logo = "<img src=\"images/logo.jpg\" width=\"180\" height=\"300\">"; //安装的LOGO

        public static readonly string header = ""; //html页的的<head>属性


        static SetupPage()
        {

            header = "<HEAD><title>安装 " + producename + "</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n";
            header += "<LINK rev=\"stylesheet\" media=\"all\" href=\"css/styles.css\" type=\"text/css\" rel=\"stylesheet\"></HEAD>\r\n";
            header += "<script language=\"javascript\" src=\"js/setup.js\"></script>\r\n";

            footer = "\r\n<br />\r\n<br /><table width=\"700\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" ID=\"Table1\">";
            footer += "<tr><td align=\"center\"><div align=\"center\" style=\"position:relative ; padding-top:60px;font-size:14px; font-family: Arial\">";
            footer += "<hr style=\"height:1; width:600; height:1; color:#CCCCCC\" />Powered by <a style=\"COLOR: #000000\" href=\"http://www.zxkefu.cn\" target=\"_blank\">" + producename + "</a>";
            footer += " &nbsp;<br />&copy; 2001-" + producename + " <a style=\"COLOR: #000000;font-weight:bold\" href=\"http://www.zxkefu.cn\" target=\"_blank\">Comsenz Inc.</a></div></td></tr></table>";
        }
        public static string InitialSystemValidCheck(ref bool error)
        {
            error = false;
            StringBuilder sb = new StringBuilder();
            sb.Append("<table cellSpacing='0' cellPadding='0' width='90%' align='center' border='0' bgcolor='#666666' style='font-size:12px'>");

            HttpContext context = HttpContext.Current;

            string filename = null;
            if (context != null)
                filename = context.Server.MapPath("Web.config");
            else
                filename = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Web.config");//创建配置文件

            //系统BIN目录检查
            sb.Append(IISSystemBINCheck(ref error));

            //检查Dnt.config文件的有效性
            if (!GetRootDntconfigPath())
            {
                sb.Append("<tr style=\"height:15px\"><td bgcolor='#ffffff' width='5%'><img src='images/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'> Web.config 不可写或没有放置正确, 相关问题详见安装文档!</td></tr>");
                error = true;
            }
            else
            {
                sb.Append("<tr style=\"height:15px\"><td bgcolor='#ffffff' width='5%'><img src='images/ok.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>对 Web.config 验证通过!</td></tr>");
            }
            //检查系统目录的有效性
            string folderstr = "AccountAdmin,js,Install,App_Data,App_Themes,App_Code";//文件夹名
            foreach (string foldler in folderstr.Split(','))
            {
                if (!SystemFolderCheck(foldler))
                {
                    sb.Append("<tr><td bgcolor='#ffffff' width='5%'><img src='images/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>对 " + foldler + " 目录没有写入和删除权限!</td></tr>");
                    error = true;
                }
                else
                {
                    sb.Append("<tr><td bgcolor='#ffffff' width='5%'><img src='images/ok.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>对 " + foldler + " 目录权限验证通过!</td></tr>");
                }
            }
            string[] directory = { "\\Images", "D:\\web\\data"};
            foreach (var item in directory)
            {
                Directory.CreateDirectory(item);
                string[] items = item.Split('\\');
                if (!SystemDirectoryCheck(item.ToString()))
                {
                    sb.Append("<tr><td bgcolor='#ffffff' width='5%'><img src='images/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>对 IIS 中 " + items[items.Length - 1] + " 虚拟目录物理路径不存在</td></tr>");
                    error = true;
                }
                else
                {
                    sb.Append("<tr><td bgcolor='#ffffff' width='5%'><img src='images/ok.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>对 IIS 中 " + items[items.Length - 1] + " 虚拟目录物理路径验证通过!</td></tr>");
                }
            }
            Directory.CreateDirectory("C:\\Program Files\\Microsoft SQL Server\\MSSQL.2\\MSSQL\\Data");
            sb.Append("</table>");

            return sb.ToString();
        }
        #region 检查配置文件文件的有效性
        public static bool GetRootDntconfigPath()
        {
            try
            {

                HttpContext context = HttpContext.Current;
                string webconfigfile = "";
                if (!Util.FileExists(webconfigfile = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Web.config")))
                {
                    return false;
                }
                else
                {
                    StreamReader sr = new StreamReader(webconfigfile);
                    string content = sr.ReadToEnd();
                    sr.Close();
                    content += " ";
                    StreamWriter sw = new StreamWriter(webconfigfile, false);
                    sw.Write(content);
                    sw.Close();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
        #endregion


        #region     检查BIN文件中的DLL是否存在
        public static string IISSystemBINCheck(ref bool error)
        {
            string binfolderpath = HttpRuntime.BinDirectory;//取BIN文件路径

            string result = "";
            try
            {
                string[] assemblylist = new string[] { "AjaxControlToolkit.dll", "FredCK.FCKeditorV2.dll", "LiveSupport.BLL.dll", 
                    "LiveSupportDAL.dll", "LiveSupportInstall.dll", "Model.dll","OperatorServiceInterface.dll" };//存在的文件

                bool isAssemblyInexistence = false;
                ArrayList inexistenceAssemblyList = new ArrayList();//不存在列表
                foreach (string assembly in assemblylist)
                {
                    if (!File.Exists(binfolderpath + assembly))//判断文件是否存在 不存在为true 
                    {
                        isAssemblyInexistence = true;
                        error = true;
                        inexistenceAssemblyList.Add(assembly);//添加不存在的文件名
                    }
                }
                if (isAssemblyInexistence)
                {
                    foreach (string assembly in inexistenceAssemblyList)//打印不存在的文件名
                    {
                        result += "<tr><td bgcolor='#ffffff' width='5%'><img src='images/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>" + assembly + " 文件放置不正确<br/>请将所有的dll文件复制到目录 " + binfolderpath + " 中.</td></tr>";
                    }
                }
            }
            catch
            {  //
                result += "<tr><td bgcolor='#ffffff' width='5%'><img src='images/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>请将所有的dll文件复制到目录 " + binfolderpath + " 中.</td></tr>";
                error = true;
            }

            return result;
        }
        #endregion

        #region 检查文件夹是否存在
        public static bool SystemFolderCheck(string foldername)
        {
            string physicsPath = Util.GetMapPath(@"..\" + foldername);
            try
            {
                using (FileStream fs = new FileStream(physicsPath + "\\a.txt", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite))
                {
                    fs.Close();
                }
                if (File.Exists(physicsPath + "\\a.txt"))
                {
                    System.IO.File.Delete(physicsPath + "\\a.txt");
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }
        public static bool SystemDirectoryCheck(string directoryPath)
        {
            try
            {
                using (FileStream fs = new FileStream(directoryPath + "\\a.txt", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite))
                {
                    fs.Close();
                }
                if (File.Exists(directoryPath + "\\a.txt"))
                {
                    System.IO.File.Delete(directoryPath + "\\a.txt");
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }
        #endregion
        /// <summary>
        /// 系统文件检查 -权限
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        public static bool SystemFileCheck(string filename)
        {
            filename = Util.GetMapPath(@"..\" + filename);
            try
            {
                if (filename.IndexOf("systemfile.aspx") == -1 && !File.Exists(filename))
                    return false;
                if (filename.IndexOf("systemfile.aspx") != -1)  //做删除测试
                {
                    File.Delete(filename);
                    return true;
                }

                StreamReader sr = new StreamReader(filename);
                string content = sr.ReadToEnd();
                sr.Close();
                content += " ";
                StreamWriter sw = new StreamWriter(filename, false);
                sw.Write(content);
                sw.Close();
                return true;
            }
            catch
            {
                return false;
            }
        }
        //   <summary>   
        //   创建虚拟目录   
        //   </summary>   
        //   <param   name="iisVir"></param>   
        //   <param   name="deleteIfExist"></param>   
        //public static void CreateIISWebVirtualDir(IISWebVirtualDir iisVir, bool deleteIfExist)
        //{
        //    if (iisVir.Parent == null)
        //        throw (new Exception("IISWebVirtualDir没有所属的IISWebServer!"));

        //    DirectoryEntry Service = new DirectoryEntry("IIS://" + IISManagement.Machinename + "/W3SVC");
        //    DirectoryEntry Server = returnIISWebserver(iisVir.Parent.index);

        //    if (Server == null)
        //    {
        //        throw (new Exception("找不到给定的站点!"));
        //    }

        //    IEnumerator ie = Server.Children.GetEnumerator();
        //    ie.MoveNext();

        //    Server = (DirectoryEntry)ie.Current;
        //    if (deleteIfExist)
        //    {
        //        DirectoryEntry VirDir;
        //        ie = Server.Children.GetEnumerator();
        //        while (ie.MoveNext())
        //        {
        //            VirDir = (DirectoryEntry)ie.Current;
        //            if (VirDir.Name.ToLower().Trim() == iisVir.Name.ToLower())
        //            {
        //                Server.Children.Remove(VirDir);
        //                Server.CommitChanges();
        //                break;
        //            }
        //        }
        //    }

        //    try
        //    {
        //        DirectoryEntry vir;
        //        vir = Server.Children.Add(iisVir.Name, "IIsWebVirtualDir");
        //        vir.Properties["Path"][0] = iisVir.Path;
        //        vir.Properties["DefaultDoc"][0] = iisVir.DefaultDoc;
        //        vir.Properties["EnableDefaultDoc"][0] = iisVir.EnableDefaultDoc;
        //        vir.Properties["AccessScript"][0] = iisVir.AccessScript;
        //        vir.Properties["AccessRead"][0] = iisVir.AccessRead;
        //        vir.Invoke("AppCreate", true);

        //        Server.CommitChanges();
        //        vir.CommitChanges();

        //    }
        //    catch (Exception es)
        //    {
        //        throw (es);
        //    }

        //}
    }
}