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
           
                if (Program.WS.GetQuickResponse().Length > 0)
                {
                    for (int i = 0; i < Program.WS.GetQuickResponse().Length; i++)
                    {
                        Program.quickResponseCategory.Add(Program.WS.GetQuickResponse()[i]);
                    }
                }
          
           
           
            //if (Program.quickResponseCategory!=null)
            //{
            //for (int i = 0; i < Program.quickResponseCategory.Count; i++)
            //{
            //    setTalkTreeView.Nodes[0].Nodes.Add(Program.quickResponseCategory[i].Name);

            //    foreach (var item in Program.quickResponseCategory[i].Responses)
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
            
                Program.quickResponseCategory.Clear();
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
               
                Program.quickResponseCategory.Add(qrc);
               
            }
            if(Program.quickResponseCategory!=null)
            {
                Program.WS.SaveQuickResponse(Program.quickResponseCategory.ToArray());
            }
           
            
        }

        private void QickResponseEidtor_Load(object sender, EventArgs e)
        {
            setTalkTreeView.Nodes[0].Nodes.Clear();
            if(Program.quickResponseCategory!=null)
            {
            for (int i = 0; i < Program.quickResponseCategory.Count; i++)
            {
                setTalkTreeView.Nodes[0].Nodes.Add(Program.quickResponseCategory[i].Name);
                if (Program.quickResponseCategory[i].Responses.Length == 0) continue;
                foreach (var item in Program.quickResponseCategory[i].Responses)
                {
                    if (item.ToString() =="") continue;
                    setTalkTreeView.Nodes[0].Nodes[i].Nodes.Add(item.ToString());
                }
            }
            setTalkTreeView.ExpandAll();
          }
            Program.quickResponseCategory.Clear();
           
            
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
            Program.quickResponseCategory.Clear();
            setTalkTreeView.Nodes[0].Nodes.Clear();
        }

       
      
       

      
    }
}
