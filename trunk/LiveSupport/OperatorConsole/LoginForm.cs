#region Header Comment
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/24
 * Comment		: Login form for the operators
 * 
 * History:
 * 
 */
#endregion
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;
using System.Net;
using System.Threading;
using System.Web.Services.Protocols;

namespace LiveSupport.OperatorConsole
{
    public partial class LoginForm : Form
    {
        private IOperatorServiceAgent operatorServiceAgent;

        public IOperatorServiceAgent OperatorServiceAgent
        {
            get { return operatorServiceAgent; }
            set { operatorServiceAgent = value; }
        }

        public LoginForm()
        {
            InitializeComponent();
            cbxAutoLogin.Enabled = false;
        }
        //btn登录
        private void btnOK_Click(object sender, EventArgs e)
        {
            loginStatusChange(false,"正在登录...");
            this.Cursor = Cursors.WaitCursor;
            login();
            this.Cursor = Cursors.Default;

            saveConfiguration();//保存信息
                       
        }
        /// <summary>
        /// 显示下在登录时的提示的信息
        /// </summary>
        /// <param name="state"></param>
        /// <param name="text"></param>
        private void loginStatusChange(bool state,string text) 
        {
            //将文本框设为不可用
            txtUserName.Enabled = state;
            txtOpName.Enabled = state;
            txtOpPassword.Enabled = state;
            btnOK.Enabled = state;
            
            lblMessage.Text = text;//显示消息
            lblMessage.ForeColor = Color.Red;//设置颜色
            pictureBox1.Visible = !state;//显示转动的图片
        }
        /// <summary>
        /// 登录服务器！
        /// </summary>
        private void login()
        {   
            try
            {
                Trace.TraceInformation("Login called");
                operatorServiceAgent.Login(txtUserName.Text.Trim(), txtOpName.Text.Trim(), txtOpPassword.Text);
            }
            catch (WebException e)
            {
                Trace.WriteLine("Login异常: " + e.Message);
                loginStatusChange(true,"连接网络失败");
                return;
            }
            catch (SoapException se)
            {
                Trace.WriteLine("Login异常: " + se.Message);
                loginStatusChange(true, "服务正在维护,请稍候再试");
                return;
            }

            
        }
        //btn退出
        private void btnCancel_Click(object sender, EventArgs e)
        {
			Application.Exit();
        }
        /// <summary>
        /// 登录窗体加载方法
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Login_Load(object sender, EventArgs e)
        {
            loadConfiguration();//加载配置文件有的登录信息
            if (Properties.Settings.Default.AutoLogin)//判断是否自己登录
            {
                autoLoginTimer.Enabled = true;//起动自动登录时间方法
            }
            operatorServiceAgent.ConnectionStateChanged += new EventHandler<ConnectionStateChangeEventArgs>(operatorServiceAgent_ConnectionStateChanged);
        }

        void operatorServiceAgent_ConnectionStateChanged(object sender, ConnectionStateChangeEventArgs e)
        {
            if (e.State == ConnectionState.Connected)
            {
                if (operatorServiceAgent.CurrentOperator != null)
                {
                    Trace.WriteLine("Login:OperatorId= " + operatorServiceAgent.CurrentOperator.OperatorId + "----" + DateTime.Now);
                    this.Visible = false;//隐藏本窗体（登录窗体）
                    MainForm c = new MainForm(operatorServiceAgent, DateTime.Now);//实例一个主窗体
                    Program.MainForm = c;//将这实列的窗体复给本程序
                    Program.MainForm.Show();//显示这个窗体
                    operatorServiceAgent.ConnectionStateChanged -= new EventHandler<ConnectionStateChangeEventArgs>(operatorServiceAgent_ConnectionStateChanged);
                }
                else
                {
                    //operator 客服不存在时调用！
                    loginStatusChange(true, "登录失败!\r\n\r\n数据填写有误...");//设置登录窗体显示的系统信息
                    lblMessage.SetBounds(260, 10, 25, 10);//设置消息的位置和大小
                }
            }
            else if (e.State == ConnectionState.Connecting)
            {
                loginStatusChange(false, e.Message);
            }
            else
            {
                loginStatusChange(true, e.Message);
            }
        }
        /// <summary>
        /// 保存登录信息
        /// </summary>
        private void saveConfiguration()
        {
            if (cbxPassword.Checked)
            {
                Properties.Settings.Default.WSUser = txtUserName.Text;
                Properties.Settings.Default.OperatorName = txtOpName.Text;
                Properties.Settings.Default.OperatorPassword = txtOpPassword.Text; 
            }
            Properties.Settings.Default.RememberPassword=cbxPassword.Checked;
            Properties.Settings.Default.AutoLogin=cbxAutoLogin.Checked;
            Properties.Settings.Default.Save(); 
        }
        /// <summary>
        /// 从文件中取出上次登录信息
        /// </summary>
        private void loadConfiguration()
        {
            txtUserName.Text = Properties.Settings.Default.WSUser;
            txtOpName.Text = Properties.Settings.Default.OperatorName;
            txtOpPassword.Text = Properties.Settings.Default.OperatorPassword;
            cbxPassword.Checked = Properties.Settings.Default.RememberPassword;
            cbxAutoLogin.Checked = Properties.Settings.Default.AutoLogin;
        }
        /// <summary>
        /// 忘记密码超链接
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void linkLabelPassword_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try
            {
                linkLabelPassword.LinkVisited = true;
                System.Diagnostics.Process.Start(Properties.Settings.Default.SearchPasswordURL);
            }
            catch (Exception ex)
            {
            }
        }
        /// <summary>
        /// 新用户注册超连接
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void linkLabelRegister_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try
            {
                linkLabelRegister.LinkVisited = true;
                System.Diagnostics.Process.Start(Properties.Settings.Default.RegisterURL);
            }
            catch (Exception ex)
            {
            }
        }
        //时间事件
        private void autoLoginTimer_Tick(object sender, EventArgs e)
        {
            login();//登录方法
            autoLoginTimer.Enabled = false;// 时间停用 
        }

        private void cbxPassword_CheckedChanged(object sender, EventArgs e)
        {
            cbxAutoLogin.Checked = false;
            cbxAutoLogin.Enabled = cbxPassword.Checked;
        }

    }
}