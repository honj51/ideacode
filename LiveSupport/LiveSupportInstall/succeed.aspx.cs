using System;
using LiveSupport.BLL.Utils;

namespace LiveSupportInstall
{
    public class succeed : SetupPage
    {
        /// <summary>
        /// 是否显示插件安装链接
        /// </summary>
        public bool showInstallPluginLink = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //LiveSupport.BLL.Utils.IISManager.CreateIISDirectories("LiveChatServer/images", "C:\\date");
                //LiveSupport.BLL.Utils.IISManager.CreateIISDirectories("LiveChatServer/Update", "C:\\update");
                Util.SetappSettings("ftpServerName","true","update"); 
            }
        }     
    }
}
