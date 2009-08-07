using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.Remoting;
using OperatorServiceInterface;
using LiveSupport.LiveSupportModel;
using LiveSupport.BLL;
using LiveSupport.OperatorConsole;
using LiveSupport.LiveSupportDAL;
using System.Runtime.Remoting.Messaging;
using System.Configuration;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Threading;

namespace OperatorRemotingClient
{
    public partial class ClientForm : Form
    {
        IOperatorServer obj2;
        System.Windows.Forms.Timer timer = new System.Windows.Forms.Timer();
        List<IOperatorServiceAgent> iOp = new List<IOperatorServiceAgent>();
        List<LiveSupport.OperatorConsole.LiveChatWS.Operator> list = new List<LiveSupport.OperatorConsole.LiveChatWS.Operator>();
        public ClientForm()
        {
            InitializeComponent();
            DBHelper.ConnectionString = "Server=RD01;Database=LiveSupport;User ID=sa;Password=;Trusted_Connection=False";
             
            RemotingConfiguration.Configure(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile, false);
            obj2= (IOperatorServer)Activator.GetObject(typeof(IOperatorServer), "http://localhost:3355/livechat/OperatorServer.rem");
            timer.Tick += new EventHandler(timer_Tick);
            timer.Interval = 1000000;
        }

        void timer_Tick(object sender, EventArgs e)
        {
            
            //for (int i = 0; i < 100; i++)
            //{
            //   operatorServiceAgent = OperatorServiceAgent.Default;
            //    operatorServiceAgent.Logout();
            //}
            timer.Stop();
        }
        //登录 
        private void button1_Click(object sender, EventArgs e)
        {
            Operator op = obj2.Login(textBox1.Text,textBox2.Text, textBox3.Text);
            AuthenticateData ad = new AuthenticateData();
            ad.OperatorId = op.OperatorId;
            ad.OperatorSession = op.OperatorSession;
            CallContext.SetData("AuthenticateData", ad);
            OperatorServerEventSink sink = new OperatorServerEventSink();
            sink.Tag = ad;
            obj2.OperatorStatusChanged += new EventHandler<OperatorServiceInterface.OperatorStatusChangeEventArgs>(sink.OnOperatorStatusChange);
            sink.OperatorStatusChanged += new EventHandler<OperatorServiceInterface.OperatorStatusChangeEventArgs>(sink_OperatorStatusChanged);
        }

        void sink_OperatorStatusChanged(object sender, OperatorServiceInterface.OperatorStatusChangeEventArgs e)
        {
            this.txtMessages.Text +="Operator:" + e.OperatorId + " status change to " + e.Status;
        }
        //退出
        private void button2_Click(object sender, EventArgs e)
        {
            obj2.Logout();
        }

        private void btnAddoperator_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < 500; i++)
            {
                //Random ran = new Random();
                //int num = ran.Next(100000, 999999);
                //添加
                Account at = new Account();
                at.AccountId = Guid.NewGuid().ToString();
                at.AccountNumber = i.ToString();
                at.CompanyName = i + "公司";
                at.Url ="http://www.www"+i+".com";
                at.Phone = i.ToString(); ;
                at.ContactName = i+"";
                at.Email = i.ToString()+ "@sina.com";
                at.Province = "江西省";
                at.City = "南昌市";
                at.Industry = "计算机";
                at.OperatorCount = 1;
                at.RegisterDate = DateTime.Now;
                bool b = AccountsManager.AddAccount(at, "admin客服", "admin" , "admin");

                //Account at = AccountsManager.GetAccountByAccountId(at.AccountId);
                Operator op = new Operator();
                op.Account = at;
                op.LoginName = "admin" + i;
                op.Password = "admin" + i;
                op.NickName = "admin1号客服";
                op.IsAdmin = false;
                op.Department = DepartmentManager.GetDepartmentByAccountId(at.AccountId)[0];
                op.Status = (OperatorStatus)Enum.Parse((typeof(OperatorStatus)), OperatorStatus.Offline.ToString());
                op.AVChatStatus = OperatorStatus.Offline.ToString();
                op.Email = "admin" + i + "@sina.com";
                bool a = OperatorsManager.NewOperator(op);
            
            
            }
      
        }

        private void button9_Click(object sender, EventArgs e)
        {
            list.Clear();
            string String = "";
            //for (int i = 0; i < 150; i++)
            //{
            //    IOperatorServiceAgent operatorServiceAgent = new OperatorServiceAgent();
            //    LiveSupport.OperatorConsole.LiveChatWS.Operator op = operatorServiceAgent.Login(i.ToString(), "admin", "admin");
            //    String += "\r\n" + op.NickName + op.Status;
            //    list.Add(op);
            //    iOp.Add(operatorServiceAgent);
            //}
            for (int i = 500, j = 0;i <620; i++)
            {

                IOperatorServiceAgent operatorServiceAgent = new OperatorServiceAgent();
                LiveSupport.OperatorConsole.LiveChatWS.Operator op2 = operatorServiceAgent.Login(j.ToString(), "admin" + i, "admin" + i);
                String += "\r\n" + op2.NickName + op2.Status;
                list.Add(op2);
                iOp.Add(operatorServiceAgent);

                j++;
                if (j == 500)
                {
                    j = 0;
                }

            }
          txtMessages.Text=String;
        }

        private void button10_Click(object sender, EventArgs e)
        {
            txtMessages.Text = "";
            string String = "";
            //foreach (LiveSupport.OperatorConsole.LiveChatWS.Operator item in list)
            //{
            //    operatorServiceAgent = OperatorServiceAgent.Default;
            //    operatorServiceAgent.CurrentOperator = item;
            //    operatorServiceAgent.Logout();
            //    String += "\r\n" + operatorServiceAgent.CurrentOperator.NickName + operatorServiceAgent.CurrentOperator.Status;
            //}
            for (int i = 0; i < 100; i++)
            {
                iOp[i].CurrentOperator = list[i];
                iOp[i].Logout();
                String += "\r\n" + OperatorService.GetOperatorById(list[i].OperatorId).NickName + "\t" + OperatorService.GetOperatorById(list[i].OperatorId).Status;
            }
            txtMessages.Text = String;
        }

        private void button11_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < 500; i++)
            {
                Account at = AccountService.FindAccountByAccountNumber(i.ToString());
                Operator op = new Operator();
                op.Account = at;
                op.LoginName = "admin"+(i+1000);
                op.Password = "admin" + (i + 1000);
                op.NickName = "admin" + (i + 1000) + "客服";
                op.IsAdmin = false;
                op.Department = DepartmentManager.GetDepartmentByAccountId(at.AccountId)[0];
                op.Status = (OperatorStatus)Enum.Parse((typeof(OperatorStatus)), OperatorStatus.Offline.ToString());
                op.AVChatStatus = OperatorStatus.Offline.ToString();
                op.Email = "admin3@sina.com";
                bool b = OperatorsManager.NewOperator(op);
            }
        }


    }
}
