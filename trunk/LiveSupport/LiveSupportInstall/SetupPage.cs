using System;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Collections;
using LiveSupport.BLL;
using System.DirectoryServices;
namespace LiveSupportInstall
{
    /// <summary>
    /// SetupPage ��ժҪ˵����
    /// </summary>
    public class SetupPage : System.Web.UI.Page
    {
        public static readonly string producename = "LiveSupport 2.0 (.NET Framework 2.0/3.x) ";  //��ǰ��Ʒ�汾����

        public static readonly string footer = "";

        public static readonly string logo = "<img src=\"images/logo.jpg\" width=\"180\" height=\"300\">"; //��װ��LOGO

        public static readonly string header = ""; //htmlҳ�ĵ�<head>����


        static SetupPage()
        {

            header = "<HEAD><title>��װ " + producename + "</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n";
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
                filename = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Web.config");//���������ļ�

            //ϵͳBINĿ¼���
            sb.Append(IISSystemBINCheck(ref error));

            //���Dnt.config�ļ�����Ч��
            if (!GetRootDntconfigPath())
            {
                sb.Append("<tr style=\"height:15px\"><td bgcolor='#ffffff' width='5%'><img src='images/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'> Web.config ����д��û�з�����ȷ, ������������װ�ĵ�!</td></tr>");
                error = true;
            }
            else
            {
                sb.Append("<tr style=\"height:15px\"><td bgcolor='#ffffff' width='5%'><img src='images/ok.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>�� Web.config ��֤ͨ��!</td></tr>");
            }
            //���ϵͳĿ¼����Ч��
            string folderstr = "AccountAdmin,js,Install";//�ļ�����
            foreach (string foldler in folderstr.Split(','))
            {
                if (!SystemFolderCheck(foldler))
                {
                    sb.Append("<tr><td bgcolor='#ffffff' width='5%'><img src='images/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>�� " + foldler + " Ŀ¼û��д���ɾ��Ȩ��!</td></tr>");
                    error = true;
                }
                else
                {
                    sb.Append("<tr><td bgcolor='#ffffff' width='5%'><img src='images/ok.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>�� " + foldler + " Ŀ¼Ȩ����֤ͨ��!</td></tr>");
                }
            }
            //����ļ���Ȩ��
            //string filestr = "admin\\xml\\navmenu.config,javascript\\common.js,install\\systemfile.aspx,upgrade\\systemfile.aspx";
            //foreach (string file in filestr.Split(','))
            //{
            //    if (!SystemFileCheck(file))
            //    {
            //        sb.Append("<tr><td bgcolor='#ffffff' width='5%'><img src='images/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>�� " + file.Substring(0, file.LastIndexOf('\\')) + " Ŀ¼û��д���ɾ��Ȩ��!</td></tr>");
            //        error = true;
            //    }
            //    else
            //    {
            //        sb.Append("<tr><td bgcolor='#ffffff' width='5%'><img src='images/ok.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>�� " + file.Substring(0, file.LastIndexOf('\\')) + " Ŀ¼Ȩ����֤ͨ��!</td></tr>");
            //    }
            //}
            sb.Append("</table>");

            return sb.ToString();
        }
        #region ��������ļ��ļ�����Ч��
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


        #region     ���BIN�ļ��е�DLL�Ƿ����
        public static string IISSystemBINCheck(ref bool error)
        {
            string binfolderpath = HttpRuntime.BinDirectory;//ȡBIN�ļ�·��

            string result = "";
            try
            {
                string[] assemblylist = new string[] { "AjaxControlToolkit.dll", "FredCK.FCKeditorV2.dll", "LiveSupport.BLL.dll", 
                    "LiveSupportDAL.dll", "LiveSupportInstall.dll", "Model.dll","OperatorServiceInterface.dll" };//���ڵ��ļ�

                bool isAssemblyInexistence = false;
                ArrayList inexistenceAssemblyList = new ArrayList();//�������б�
                foreach (string assembly in assemblylist)
                {
                    if (!File.Exists(binfolderpath + assembly))//�ж��ļ��Ƿ���� ������Ϊtrue 
                    {
                        isAssemblyInexistence = true;
                        error = true;
                        inexistenceAssemblyList.Add(assembly);//���Ӳ����ڵ��ļ���
                    }
                }
                if (isAssemblyInexistence)
                {
                    foreach (string assembly in inexistenceAssemblyList)//��ӡ�����ڵ��ļ���
                    {
                        result += "<tr><td bgcolor='#ffffff' width='5%'><img src='images/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>" + assembly + " �ļ����ò���ȷ<br/>�뽫���е�dll�ļ����Ƶ�Ŀ¼ " + binfolderpath + " ��.</td></tr>";
                    }
                }
            }
            catch
            {  //
                result += "<tr><td bgcolor='#ffffff' width='5%'><img src='images/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>�뽫���е�dll�ļ����Ƶ�Ŀ¼ " + binfolderpath + " ��.</td></tr>";
                error = true;
            }

            return result;
        }
        #endregion

        #region ����ļ����Ƿ����
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
        #endregion
        /// <summary>
        /// ϵͳ�ļ���� -Ȩ��
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
                if (filename.IndexOf("systemfile.aspx") != -1)  //��ɾ������
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
        ///   <summary>   
        ///   ��������Ŀ¼   
        ///   </summary>   
        ///   <param   name="iisVir"></param>   
        ///   <param   name="deleteIfExist"></param>   
        public static void CreateIISWebVirtualDir(IISWebVirtualDir iisVir, bool deleteIfExist)
        {
            if (iisVir.Parent == null)
                throw (new Exception("IISWebVirtualDirû��������IISWebServer!"));

            DirectoryEntry Service = new DirectoryEntry("IIS://" + IISManagement.Machinename + "/W3SVC");
            DirectoryEntry Server = returnIISWebserver(iisVir.Parent.index);

            if (Server == null)
            {
                throw (new Exception("�Ҳ���������վ��!"));
            }

            IEnumerator ie = Server.Children.GetEnumerator();
            ie.MoveNext();

            Server = (DirectoryEntry)ie.Current;
            if (deleteIfExist)
            {
                DirectoryEntry VirDir;
                ie = Server.Children.GetEnumerator();
                while (ie.MoveNext())
                {
                    VirDir = (DirectoryEntry)ie.Current;
                    if (VirDir.Name.ToLower().Trim() == iisVir.Name.ToLower())
                    {
                        Server.Children.Remove(VirDir);
                        Server.CommitChanges();
                        break;
                    }
                }
            }

            try
            {
                DirectoryEntry vir;
                vir = Server.Children.Add(iisVir.Name, "IIsWebVirtualDir");
                vir.Properties["Path"][0] = iisVir.Path;
                vir.Properties["DefaultDoc"][0] = iisVir.DefaultDoc;
                vir.Properties["EnableDefaultDoc"][0] = iisVir.EnableDefaultDoc;
                vir.Properties["AccessScript"][0] = iisVir.AccessScript;
                vir.Properties["AccessRead"][0] = iisVir.AccessRead;
                vir.Invoke("AppCreate", true);

                Server.CommitChanges();
                vir.CommitChanges();

            }
            catch (Exception es)
            {
                throw (es);
            }

        }
    }
}