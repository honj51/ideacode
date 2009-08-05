<%@ Application Language="C#" %>

<script runat="server">
    int i = 0;
    void Application_Start(object sender, EventArgs e) 
    {
        LiveSupport.BLL.Util.sysInfo.StartApplicationDate = DateTime.Now;
        LiveSupport.LiveSupportDAL.SqlProviders.DBHelper.ConnectionString = ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();
        OperatorService.Init();
        AccountService.Init();
        //在应用程序启动时运行的代码
        System.Timers.Timer myTimer = new System.Timers.Timer(5000);
        myTimer.Elapsed += new System.Timers.ElapsedEventHandler(myTimer_Elapsed);
        myTimer.Enabled = true;
        ChatService.ChatTempDataDir = Server.MapPath("~/UploadFile/");
        LiveSupport.BLL.Remoting.TcpServerTest.Main(); 
    }

    void myTimer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
    {
        i++;
        VisitSessionService.MaintanStatus();
        OperatorService.MaintanStatus();
        if (i >= 12) // 一分钟后调用  ChatService.MaintanStatus(); ｜｜   OperatorService.MaintanStatus();
        {
            i = 0;
            ChatService.MaintanStatus();
        }
        
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //在应用程序关闭时运行的代码
        LiveSupport.BLL.Util.sysInfo.EndApplicationDate = DateTime.Now;
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        //在出现未处理的错误时运行的代码
        LiveSupport.BLL.Util.sysInfo.ErrorDatre = DateTime.Now;
        
    }

    void Session_Start(object sender, EventArgs e) 
    {
        //在新会话启动时运行的代码
        LiveSupport.BLL.Util.sysInfo.StartSessionDate = DateTime.Now;
    }

    void Session_End(object sender, EventArgs e) 
    {
        //在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式 
        //设置为 StateServer 或 SQLServer，则不会引发该事件。
        LiveSupport.BLL.Util.sysInfo.EndSessionDate = DateTime.Now;

    }
       
</script>
