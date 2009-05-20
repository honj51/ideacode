using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using LiveSupport.OperatorConsole.LiveChatWS;

namespace LiveSupport.OperatorConsole
{
   
    public partial class OperatorPannel : UserControl
    {
        OperatorWS ws = new OperatorWS();
         public string chatId=null;
        public OperatorPannel()
        {
            InitializeComponent();
        }

        public void RecieveOperator(List<Operator> operators)
        {
            operatorsTreeView.Nodes[0].Nodes.Clear();
            operatorsTreeView.Nodes[1].Nodes.Clear();
            foreach (var item in operators)
            {
                if (item.Status != OperatorStatus.Idle)
                {
                    operatorsTreeView.Nodes[1].ImageIndex = 4;
                  
                    operatorsTreeView.Nodes[1].Nodes.Add(item.NickName + "(" + getOperatorsStatusText(item.Status) + ")").Tag = item;
                }
                else
                {
                    operatorsTreeView.Nodes[0].ImageIndex = 3;
                    for (int i = 0; i < operatorsTreeView.Nodes[0].Nodes.Count; i++)
                    {
                        operatorsTreeView.Nodes[0].Nodes[i].ImageIndex = 8;

                    }

                    operatorsTreeView.Nodes[0].Nodes.Add(item.NickName + "(" + getOperatorsStatusText(item.Status) + ")").Tag = item;
                }
                if (operatorsTreeView.Nodes[1].Nodes.Count > 0)
                {
                    for (int i = 0; i < operatorsTreeView.Nodes[1].Nodes.Count; i++)
                    {
                        operatorsTreeView.Nodes[1].Nodes[i].ImageIndex = 6;
                    }
                }
                if (operatorsTreeView.Nodes[0].Nodes.Count > 0)
                {
                    for (int i = 0; i < operatorsTreeView.Nodes[0].Nodes.Count; i++)
                    {
                        Operator op = operatorsTreeView.Nodes[0].Nodes[i].Tag as Operator;
                        if (op.Status == OperatorStatus.Chatting)
                        {
                            operatorsTreeView.Nodes[0].Nodes[i].ImageIndex = 8;
                        }
                        if (op.Status == OperatorStatus.BeRightBack)
                        {
                            operatorsTreeView.Nodes[0].Nodes[i].ImageIndex = 5;
                        }
                        if (op.Status == OperatorStatus.Away)
                        {
                            operatorsTreeView.Nodes[0].Nodes[i].ImageIndex = 5;
                        }
                        if (op.Status == OperatorStatus.Idle)
                        {
                            operatorsTreeView.Nodes[0].Nodes[i].ImageIndex = 7;
                        }
                    }
                }
            }
        
        }
        string getOperatorsStatusText(OperatorStatus os)
        {
            string status;
            switch (os)
            {
                case OperatorStatus.Idle:
                    status = "空闲";
                    break;
                case OperatorStatus.Away:
                    status = "离开";
                    break;
                case OperatorStatus.Chatting:
                    status = "对话中";
                    break;
                case OperatorStatus.BeRightBack:
                    status = "一会回来";
                    break;
                case OperatorStatus.Offline:
                    status = "离线";
                    break;
                default:
                    status = "离线";
                    break;

            }
            return status;

        }

        private void operatorsTreeView_DoubleClick(object sender, EventArgs e)
        {
            Operator op = operatorsTreeView.SelectedNode.Tag as Operator;

            if (chatId != null && op!=null)
            {
            
                  if (op.Status != OperatorStatus.Offline)
                  {
                      MessageBox.Show(op.OperatorId);
                      MessageBox.Show(chatId);
                  }
                  else 
                  {
                      MessageBox.Show("该客服无法回应你的请求");
                  
                  }
              

             
            }
         
        }

        
    }
}
