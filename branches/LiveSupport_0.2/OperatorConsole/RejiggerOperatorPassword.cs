using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using LiveSupport.OperatorConsole.LiveChatWS;

namespace LiveSupport.OperatorConsole
{
    public partial class RejiggerOperatorPassword : Form
    {
        OperatorWS ws = new OperatorWS();
        public RejiggerOperatorPassword()
        {
            InitializeComponent();

            lblName.Visible = Program.CurrentOperator.IsAdmin;
            txtName.Visible = Program.CurrentOperator.IsAdmin;
            lblPassword.Visible = !Program.CurrentOperator.IsAdmin;
            txtPassword.Visible = !Program.CurrentOperator.IsAdmin;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            RejiggerPassword();
            
        }

       


        private void RejiggerPassword() 
        {
            if ( (this.txtPassword.Visible ?this.txtPassword.Text :this.txtName.Text)   == "" || this.txtNewPassword.Text == "" || this.txtNewPassword2.Text == "")
            {

                MessageBox.Show("数据不能为空!\r\n\r\n 注意填写");

            }
            else
            {
                if (this.txtNewPassword.Text == this.txtNewPassword2.Text)
                {
                    if (Program.CurrentOperator.IsAdmin)
                     {    
                        if(!txtName.Text.Equals(Program.CurrentOperator.Name))
                        {
                        //  ws.ChangePassword(txtName.Text, txtNewPassword.Text);
                        MessageBox.Show("更改成功!!\r\n\r\n 新密码为" + this.txtNewPassword.Text);
                        this.Close();
                         
                        }
                         else
                        { 
                         MessageBox.Show("更改管理员密码请到\r\n\r\n www.LiveSupport.com");
                    
                        }
                    }
                    else
                    {
                        //  ws.ChangePassword(Program.CurrentOperator.Name,this.txtPassword.Text, txtNewPassword.Text);

                        MessageBox.Show("更改成功!!\r\n\r\n 新密码为" + this.txtNewPassword.Text);
                        this.Close();
                    }
                 }
                else{
                    MessageBox.Show("新密码和确认新密码不一致!");
                }
            }
        
        }

       
    }
}
