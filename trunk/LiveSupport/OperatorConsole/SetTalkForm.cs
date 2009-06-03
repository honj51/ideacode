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
    public partial class SetTalkForm : UserControl
    {
        /// <summary>
        /// 工具条是否显示
        /// </summary>
        private bool result=true;

        public bool Result
        {
            get { return result;}
            set { result = value;}
        }
        
        /// <summary>
        /// 是否双击节点
        /// </summary>
        private bool isCheck;

        public bool IsCheck
        {
            get { return isCheck; }
            set { isCheck = value; }
        }

        /// <summary>
        /// 选中节点文本
        /// </summary>
        private string checkString;

        public string CheckString
        {
            get { return checkString; }
            set { checkString = value; }
        }

        
        
        public SetTalkForm()
        {
            InitializeComponent();
            setTalkTreeView.ExpandAll();
            List<QuickResponseCategory> cats = new List<QuickResponseCategory>();
            toolStrip1.Visible = Result;
            if (toolStrip1.Visible==false)
            {
               setTalkTreeView.Dock= DockStyle.Fill;
              
            }
            for (int i = 0; i < 10; i++)
            {
                var v = new QuickResponseCategory();
                v.Name = "n" + i;
                
                v.Responses=new string[]{("m"+i)};
                cats.Add(v);

            }
            for(int i=0;i<cats.Count;i++)
            {
                 setTalkTreeView.Nodes[0].Nodes.Add(cats[i].Name);
           
                 foreach (var item in cats[i].Responses)
                {

                    setTalkTreeView.Nodes[0].Nodes[i].Nodes.Add(item.ToString());
                }
             }
         }

        
    
        private void addNodeToolStripButton_Click(object sender, EventArgs e)
        {
          //  MessageBox.Show(setTalkTreeView.SelectedNode.Level.ToString());

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
            MessageBox.Show(setTalkTreeView.SelectedNode.Level.ToString());
           
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
            if(setTalkTreeView.SelectedNode!=null)
            {
                setTalkTreeView.SelectedNode.BeginEdit();
              
            }
        }

        private void SetTalkForm_Load(object sender, EventArgs e)
        {


        }

        private void setTalkTreeView_DoubleClick(object sender, EventArgs e)
        {
            if (setTalkTreeView.SelectedNode.Nodes.Count == 0)
            {
                CheckString = setTalkTreeView.SelectedNode.Text.ToString();

            }
            else
            {
                setTalkTreeView.SelectedNode.ToolTipText = "该节点无法操作";
            
            }
      
            
          
        }

        private void setTalkTreeView_NodeMouseDoubleClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            if (setTalkTreeView.SelectedNode.Nodes.Count == 0)
            {
                CheckString = setTalkTreeView.SelectedNode.Text.ToString();

            }
            else
            {
                setTalkTreeView.SelectedNode.ToolTipText = "该节点无法操作";

            }
        }

      
    }
}
