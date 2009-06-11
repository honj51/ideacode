using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.Diagnostics;

namespace LiveSupport.OperatorConsole
{
    public partial class QickResponseEidtor : Form
    {
        public QickResponseEidtor()
        {
            InitializeComponent();
            toolStrip1.Visible = Result;
            
            if (toolStrip1.Visible==false)
            {
               setTalkTreeView.Dock= DockStyle.Fill;
             
            }
           
                if (OperatorServiceAgent.Default.WS.GetQuickResponse().Length > 0)
                {
                    for (int i = 0; i < OperatorServiceAgent.Default.WS.GetQuickResponse().Length; i++)
                    {
                        OperatorServiceAgent.Default.QuickResponseCategory.Add(OperatorServiceAgent.Default.WS.GetQuickResponse()[i]);
                    }
                }
          
           
           
            //if (OperatorWebServiceAgent.Default.QuickResponseCategory!=null)
            //{
            //for (int i = 0; i < OperatorWebServiceAgent.Default.QuickResponseCategory.Count; i++)
            //{
            //    setTalkTreeView.Nodes[0].Nodes.Add(OperatorWebServiceAgent.Default.QuickResponseCategory[i].Name);

            //    foreach (var item in OperatorWebServiceAgent.Default.QuickResponseCategory[i].Responses)
            //    {

            //        setTalkTreeView.Nodes[0].Nodes[i].Nodes.Add(item.ToString());
            //    }
            // }
            //}
            if(setTalkTreeView.Nodes[0].Nodes!=null)
            {
                setTalkTreeView.ExpandAll();
            }
         
            
        }

         /// <summary>
        /// 工具条是否显示
        /// </summary>
        private bool result=true;

        public bool Result
        {
            get { return result;}
            set { result = value;}
        }
        
       

        private void addNodeToolStripButton_Click(object sender, EventArgs e)
        {
            if (setTalkTreeView.SelectedNode != null && setTalkTreeView.SelectedNode.Level < 2)
            {


                if (setTalkTreeView.SelectedNode != null)
                {
                    setTalkTreeView.SelectedNode.Nodes.Add("新添加节点");
                    setTalkTreeView.SelectedNode.Expand();

                }

            }
            else 
            {
                MessageBox.Show("该节点无法添加");
            
            }
           
         

        }

        private void delNodeToolStripButton_Click(object sender, EventArgs e)
        {
            if (setTalkTreeView.SelectedNode != null)
            {
                if (setTalkTreeView.SelectedNode.Level > 0)
                {
                    setTalkTreeView.SelectedNode.Remove();
                }
                else 
                {
                    MessageBox.Show("该节点无法删除");
                }
            }

        }

        private void amendNodeToolStripButton_Click(object sender, EventArgs e)
        {   
            if(setTalkTreeView.SelectedNode.Level>0){
            if(setTalkTreeView.SelectedNode!=null)
            {
                setTalkTreeView.LabelEdit = true;
                setTalkTreeView.SelectedNode.BeginEdit();
               
             }
            }
        }

        private void OkToolStripButton_Click(object sender, EventArgs e)
        {
            
                OperatorServiceAgent.Default.QuickResponseCategory.Clear();
            foreach (TreeNode Node in setTalkTreeView.Nodes[0].Nodes)
            { 
                if(Node==null)continue;
                QuickResponseCategory qrc = new QuickResponseCategory();
                
                    qrc.Name = Node.Text;
                    if (Node.Nodes==null) continue;
                    string[] Contents = new string[Node.Nodes.Count];
                    for(int i=0; i<Node.Nodes.Count;i++)
                    {
                        if (Node.Nodes[i].Text == null) continue;
                        Contents[i]=Node.Nodes[i].Text;
                        
                    }
                qrc.Responses =Contents;
               
                OperatorServiceAgent.Default.QuickResponseCategory.Add(qrc);
               
            }
            if(OperatorServiceAgent.Default.QuickResponseCategory!=null)
            {
                OperatorServiceAgent.Default.WS.SaveQuickResponse(OperatorServiceAgent.Default.QuickResponseCategory.ToArray());
            }
           
            
        }

        private void QickResponseEidtor_Load(object sender, EventArgs e)
        {
            setTalkTreeView.Nodes[0].Nodes.Clear();
            if(OperatorServiceAgent.Default.QuickResponseCategory!=null)
            {
            for (int i = 0; i < OperatorServiceAgent.Default.QuickResponseCategory.Count; i++)
            {
                setTalkTreeView.Nodes[0].Nodes.Add(OperatorServiceAgent.Default.QuickResponseCategory[i].Name);
                if (OperatorServiceAgent.Default.QuickResponseCategory[i].Responses.Length == 0) continue;
                foreach (var item in OperatorServiceAgent.Default.QuickResponseCategory[i].Responses)
                {
                    if (item.ToString() =="") continue;
                    setTalkTreeView.Nodes[0].Nodes[i].Nodes.Add(item.ToString());
                }
            }
            setTalkTreeView.ExpandAll();
          }
            OperatorServiceAgent.Default.QuickResponseCategory.Clear();
           
            
        }
        private void setTalkTreeView_AfterLabelEdit(object sender, NodeLabelEditEventArgs e)
        {
            

            if (e.Label == ""||e.Label==null)
            {
                e.CancelEdit = true;
                MessageBox.Show("数据不能为空");
                
            }
            else
            {

                if (!e.Label.Contains("|"))
                {
                    setTalkTreeView.SelectedNode.EndEdit(false);
                    setTalkTreeView.LabelEdit = false;
                }
                else
                {
                    MessageBox.Show("数据中存在非法字符 ==>"+"'|'");
                    e.CancelEdit = true;
                    setTalkTreeView.SelectedNode.EndEdit(false);
                    setTalkTreeView.LabelEdit = false;
                    
                
                }
            }
        }

        private void QickResponseEidtor_FormClosing(object sender, FormClosingEventArgs e)
        {
            OperatorServiceAgent.Default.QuickResponseCategory.Clear();
            setTalkTreeView.Nodes[0].Nodes.Clear();
        }
    }
}
