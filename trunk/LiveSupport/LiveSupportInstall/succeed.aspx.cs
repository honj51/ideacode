using System;

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
               LiveSupport.BLL.Utils.IISManager.CreateIISDirectories("mywebsite/fdsafsa", "C:\\Inetpub\\AdminScripts");
                // vd.Path = @"C:\Inetpub\AdminScripts";
                //vd.Name = "mywebsite";
                //vd.Path = Server.Map("AppData/Images");
                // vd.Name = "mywebsite/Data";
            }
        }

        
      
    }
}
