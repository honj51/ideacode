using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.OperatorConsole
{
   
    public partial class OperatorPannel : UserControl
    {
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
               
                if (item.Status != OperatorStatus.Offline)
                {
                    operatorsTreeView.Nodes[0].ImageIndex = 3;
                    operatorsTreeView.Nodes[0].SelectedImageIndex = 3;
                    for (int i = 0; i < operatorsTreeView.Nodes[0].Nodes.Count; i++)
                    {
                        operatorsTreeView.Nodes[0].Nodes[i].ImageIndex = 8;
                        operatorsTreeView.Nodes[0].Nodes[i].SelectedImageIndex = 8;
                    }

                    operatorsTreeView.Nodes[0].Nodes.Add(item.NickName + "(" + Common.GetOperatorsStatusText(item.Status) + ")").Tag = item;
                }
                else
                {
                    operatorsTreeView.Nodes[1].ImageIndex = 4;
                    operatorsTreeView.Nodes[1].SelectedImageIndex = 4;

                    operatorsTreeView.Nodes[1].Nodes.Add(item.NickName + "(" + Common.GetOperatorsStatusText(item.Status) + ")").Tag = item;
                  

                    
                }
                if (operatorsTreeView.Nodes[1].Nodes.Count > 0)
                {
                    for (int i = 0; i < operatorsTreeView.Nodes[1].Nodes.Count; i++)
                    {
                        operatorsTreeView.Nodes[1].Nodes[i].ImageIndex = 6;
                        operatorsTreeView.Nodes[1].Nodes[i].SelectedImageIndex = 6;
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
                            operatorsTreeView.Nodes[0].Nodes[i].SelectedImageIndex = 8;
                        }
                        if (op.Status == OperatorStatus.BeRightBack)
                        {
                            operatorsTreeView.Nodes[0].Nodes[i].ImageIndex = 5;
                            operatorsTreeView.Nodes[0].Nodes[i].SelectedImageIndex = 5;
                        }
                        if (op.Status == OperatorStatus.Away)
                        {
                            operatorsTreeView.Nodes[0].Nodes[i].ImageIndex = 5;
                            operatorsTreeView.Nodes[0].Nodes[i].SelectedImageIndex = 5;
                        }
                        if (op.Status == OperatorStatus.Idle)
                        {
                            operatorsTreeView.Nodes[0].Nodes[i].ImageIndex = 7;
                            operatorsTreeView.Nodes[0].Nodes[i].SelectedImageIndex = 7;
                        }
                        if (op.Status== OperatorStatus.InviteChat)
                        {
                            operatorsTreeView.Nodes[0].Nodes[i].ImageIndex = 9;
                            operatorsTreeView.Nodes[0].Nodes[i].SelectedImageIndex = 9;
                        }
                    }
                }
            }
            if (operatorsTreeView.Nodes.Count > 0)
            {
                operatorsTreeView.ExpandAll();

            }
        
        }

        private void operatorsTreeView_DoubleClick(object sender, EventArgs e)
        {
            Operator op = operatorsTreeView.SelectedNode.Tag as Operator;

            if (chatId != null && op!=null)
            {
            
                  if (op.Status != OperatorStatus.Offline)
                  {
                      
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
