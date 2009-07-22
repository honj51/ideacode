using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.Diagnostics;
using System.Net;

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
            setTalkTreeView.Nodes.Add("默认分类");
        }
        //删除分类
        private void delNodeToolStripButton_Click(object sender, EventArgs e)
        {
            if (this.setTalkTreeView.SelectedNode != null &&this.setTalkTreeView.SelectedNode.Level==0)
            {
                this.setTalkTreeView.Nodes.Remove(this.setTalkTreeView.SelectedNode);
            }
            if (this.setTalkTreeView.Nodes.Count == 0)
            {
                this.tsbAddMessage.Enabled = false;
                this.tsbDeleteMessage.Enabled = false;
                this.tsbDeleteType.Enabled = false;
                this.tsbEdit.Enabled = false;
            }

        }
        //编辑
        private void amendNodeToolStripButton_Click(object sender, EventArgs e)
        {

            if (setTalkTreeView.SelectedNode != null)
            {
                setTalkTreeView.LabelEdit = true;
                setTalkTreeView.SelectedNode.BeginEdit();
            }

        }
        //保存
        private void OkToolStripButton_Click(object sender, EventArgs e)
        {
            Program.OperaterServiceAgent.QuickResponseCategory.Clear();
            foreach (TreeNode Node in setTalkTreeView.Nodes)
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
              
                Program.OperaterServiceAgent.QuickResponseCategory.Add(qrc);
            }
            if(Program.OperaterServiceAgent.QuickResponseCategory!=null)
            {
                try
                {
                    Program.OperaterServiceAgent.SaveQuickResponse(Program.OperaterServiceAgent.QuickResponseCategory);
                }
                catch (WebException)
                {
                    this.Text = "网络中断!请稍候再试!";
                }
               
            }
        }
        //初始化
        private void QickResponseEidtor_Load(object sender, EventArgs e)
        {
            setTalkTreeView.Nodes.Clear();

            List<QuickResponseCategory> qcs = Program.OperaterServiceAgent.QuickResponseCategory;
            if (qcs != null)
            {
                for (int i = 0; i < qcs.Count; i++)
                {
                    setTalkTreeView.Nodes.Add(qcs[i].Name);
                    if (qcs[i].Responses.Length == 0) continue;
                    foreach (var item in qcs[i].Responses)
                    {
                        if (item.ToString() == "") continue;
                        setTalkTreeView.Nodes[i].Nodes.Add(item.ToString());
                    }
                }
                setTalkTreeView.ExpandAll();
            }
            Program.OperaterServiceAgent.QuickResponseCategory.Clear();
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
            Program.OperaterServiceAgent.QuickResponseCategory = null;
            setTalkTreeView.Nodes.Clear();
        }

        //添加消息
        private void tsbAddMessage_Click(object sender, EventArgs e)
        {
            if (this.setTalkTreeView.SelectedNode != null)
            {
                if (setTalkTreeView.SelectedNode.Level < 1)
                {
                    this.setTalkTreeView.Nodes[this.setTalkTreeView.SelectedNode.Index].Nodes.Add("默认消息");
                }
                else
                {
                    this.setTalkTreeView.Nodes[this.setTalkTreeView.SelectedNode.Parent.Index].Nodes.Add("默认消息");
                    
                }
                setTalkTreeView.ExpandAll();
            }
        }
        //删除消息
        private void tsbDeleteMessage_Click(object sender, EventArgs e)
        {
            if (this.setTalkTreeView.SelectedNode != null && this.setTalkTreeView.SelectedNode.Level != 0)
            {
                this.setTalkTreeView.Nodes.Remove(this.setTalkTreeView.SelectedNode);
            }
        }

        private void setTalkTreeView_AfterSelect(object sender, TreeViewEventArgs e)
        {
            if (this.setTalkTreeView.SelectedNode != null)
            {
                this.tsbEdit.Enabled = true;
                if (this.setTalkTreeView.SelectedNode.Level == 0)
                {
                    this.tsbAddMessage.Enabled = true;
                    this.tsbDeleteType.Enabled = true;
                    this.tsbDeleteMessage.Enabled = false;
                }
                else
                {
                    this.tsbAddMessage.Enabled = true;
                    this.tsbDeleteMessage.Enabled = true;
                    this.tsbDeleteType.Enabled = false;
                }
            }
            else
            {
                this.tsbAddMessage.Enabled = false;
                this.tsbDeleteMessage.Enabled = false;
                this.tsbDeleteType.Enabled = false;
                this.tsbEdit.Enabled = false;
            }
        }
    }
}
