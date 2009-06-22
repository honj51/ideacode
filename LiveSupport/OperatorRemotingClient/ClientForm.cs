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
using System.Runtime.Remoting.Messaging;

namespace OperatorRemotingClient
{
    public partial class ClientForm : Form
    {
        IOperatorServer obj2;
        public ClientForm()
        {
            InitializeComponent();
            RemotingConfiguration.Configure(AppDomain.CurrentDomain.SetupInformation.ConfigurationFile, false);
            obj2= (IOperatorServer)Activator.GetObject(typeof(IOperatorServer), "http://localhost:3355/livechat/OperatorServer.rem");
            
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
            obj2.OperatorStatusChanged += new EventHandler<OperatorStatusChangeEventArgs>(sink.OnOperatorStatusChange);
            sink.OperatorStatusChanged += new EventHandler<OperatorStatusChangeEventArgs>(sink_OperatorStatusChanged);
        }

        void sink_OperatorStatusChanged(object sender, OperatorStatusChangeEventArgs e)
        {
            this.txtMessages.Text +="Operator:" + e.OperatorId + " status change to " + e.Status;
        }
        //退出
        private void button2_Click(object sender, EventArgs e)
        {
            obj2.Logout();
        }


    }
}
