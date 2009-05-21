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
        public SetTalkForm()
        {
            InitializeComponent();
            setTalkTreeView.ExpandAll();
            List<QuickResponseCategory> cats = new List<QuickResponseCategory>();
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
            if (setTalkTreeView.SelectedNode != null)
            {
                if (setTalkTreeView.SelectedNode.Nodes.Count == 0)
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
    }
}
