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
        //btn��¼
        private void btnOK_Click(object sender, EventArgs e)
        {
            loginStatusChange(false,"���ڵ�¼...");
            this.Cursor = Cursors.WaitCursor;
            login();
            this.Cursor = Cursors.Default;

            saveConfiguration();//������Ϣ
                       
        }
        /// <summary>
        /// ��ʾ���ڵ�¼ʱ����ʾ����Ϣ
        /// </summary>
        /// <param name="state"></param>
        /// <param name="text"></param>
        private void loginStatusChange(bool state,string text) 
        {
            //���ı�����Ϊ������
            txtUserName.Enabled = state;
            txtOpName.Enabled = state;
            txtOpPassword.Enabled = state;
            btnOK.Enabled = state;
            
            lblMessage.Text = text;//��ʾ��Ϣ
            lblMessage.ForeColor = Color.Red;//������ɫ
            pictureBox1.Visible = !state;//��ʾת����ͼƬ
        }
        /// <summary>
        /// ��¼��������
        /// </summary>
        private void login()
        {   
            try
            {
                Trace.TraceInformation("Login called");
                operatorServiceAgent.EnablePooling = false;
                operatorServiceAgent.Login(txtUserName.Text.Trim(), txtOpName.Text.Trim(), txtOpPassword.Text);
                //operatorServiceAgent.Login("100000", "zxkefu", "zxkefu");
            }
            catch (WebException e)
            {
                Trace.WriteLine("Login�쳣: " + e.Message);
                loginStatusChange(true,"��������ʧ��");
                return;
            }
            catch (SoapException se)
            {
                Trace.WriteLine("Login�쳣: " + se.Message);
                loginStatusChange(true, "��������ά��,���Ժ�����");
                return;
            }

            
        }
        //btn�˳�
        private void btnCancel_Click(object sender, EventArgs e)
        {
			Application.Exit();
        }
        /// <summary>
        /// ��¼������ط���
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Login_Load(object sender, EventArgs e)
        {
            loadConfiguration();//���������ļ��еĵ�¼��Ϣ
            if (Properties.Settings.Default.AutoLogin)//�ж��Ƿ��Լ���¼
            {
                autoLoginTimer.Enabled = true;//���Զ���¼ʱ�䷽��
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
                    this.Visible = false;//���ر����壨��¼���壩
                    MainForm c = new MainForm(operatorServiceAgent, DateTime.Now);//ʵ��һ��������
                    Program.MainForm = c;//����ʵ�еĴ��帴��������
                    Program.MainForm.Show();//��ʾ�������
                    operatorServiceAgent.ConnectionStateChanged -= new EventHandler<ConnectionStateChangeEventArgs>(operatorServiceAgent_ConnectionStateChanged);
                }
                else
                {
                    //operator �ͷ�������ʱ���ã�
                    loginStatusChange(true, "��¼ʧ��!\r\n\r\n������д����...");//���õ�¼������ʾ��ϵͳ��Ϣ
                    lblMessage.SetBounds(260, 10, 25, 10);//������Ϣ��λ�úʹ�С
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
        /// �����¼��Ϣ
        /// </summary>
        private void saveConfiguration()
        {
            Properties.Settings.Default.WSUser = txtUserName.Text;
            Properties.Settings.Default.OperatorName = txtOpName.Text;
            Properties.Settings.Default.OperatorPassword=txtOpPassword.Text;
            Properties.Settings.Default.RememberPassword=cbxPassword.Checked;
            Properties.Settings.Default.AutoLogin=cbxAutoLogin.Checked;
            Properties.Settings.Default.Save(); 
        }
        /// <summary>
        /// ���ļ���ȡ���ϴε�¼��Ϣ
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
        /// �������볬����
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
        /// ���û�ע�ᳬ����
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
        //ʱ���¼�
        private void autoLoginTimer_Tick(object sender, EventArgs e)
        {
            login();//��¼����
            autoLoginTimer.Enabled = false;// ʱ��ͣ�� 
        }

        private void cbxPassword_CheckedChanged(object sender, EventArgs e)
        {
            cbxAutoLogin.Checked = false;
            cbxAutoLogin.Enabled = cbxPassword.Checked;
        }

    }
}