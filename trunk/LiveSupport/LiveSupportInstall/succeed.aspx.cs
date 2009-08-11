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
            }
        }

        
      
    }
}
