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
    public partial class ChatMessageViewerControl : UserControl
    {   
        public ChatMessageViewerControl()
        {
            InitializeComponent();
            wb.Navigate("about:");

        }

        
        public void ResetContext(string message)
        {
            wb.Navigate("about:" + message);
        }

        public void AddFloatInformation(string info)
        {
            this.label1.Text = info;
            this.label1.Visible = true;
            timer1.Enabled = true;
        }
        
        public void AddInformation(string info)
        {
            string msg = "<img  src''/><span style='color: #FF9933; FONT-SIZE: 15px'>" + info + "</span><br />";
            AddText(msg);
        }

        public void AddText(string text)
        {
            wb.Document.Write(text);
        }

        public void AddMessage(LiveSupport.OperatorConsole.LiveChatWS.Message message)
        {
            string msg = string.Empty;
            if (API.FromSystem(message))
            {
                msg = string.Format("<span style='color: #FF9933; FONT-SIZE: 13px'>{0}</span><br />", message.Text);
                //ucm.GetMessage(msg, " ");
            }
            if (message.Type == MessageType.ChatMessage_VistorToOperator)
            {
                msg = string.Format("<span style='font-family: Arial;color:#008040;font-weight: bold;font-size: 12px;'>{0} </span><br/><span style='font-family: Arial;font-size: 12px;'>{1}</span><br />", message.Source + "&nbsp;&nbsp;&nbsp;" + message.SentDate.ToString("hh:mm:ss"), message.Text);
                //ucm.GetMessage(msg, " ");
            }
            if (message.Type == MessageType.ChatMessage_OperatorToVisitor)
            {
                msg = string.Format("<span style='font-family: Arial;color:blue;font-weight: bold;font-size: 12px;'>{0} </span><br/><span style='font-family: Arial;font-size: 12px;'>{1}</span><br />", message.Source + "&nbsp;&nbsp;&nbsp;" + message.SentDate.ToString("hh:mm:ss"), message.Text);
                //ucm.GetMessage(msg, " ");
            }
            AddText(msg);
            wb.Document.Window.ScrollTo(wb.Document.Body.ScrollRectangle.Left, wb.Document.Body.ScrollRectangle.Height);

        }

        public void GetMessage(string message,string type)
        {
            if (type == "Navigate")
            {
                wb.Navigate(message);
            }
            else 
            {
                wb.Document.Write(message);
                wb.Document.Window.ScrollTo(wb.Document.Body.ScrollRectangle.Left, wb.Document.Body.ScrollRectangle.Height); 
            }
           

        }
        //接受记录List
        public ChatMessageViewerControl(List<LiveSupport.OperatorConsole.LiveChatWS.Message> msg)
        {
            InitializeComponent();
            DataBindMessage(msg);
        }


        #region 绑定聊天记录
        public void DataBindMessage(List<LiveSupport.OperatorConsole.LiveChatWS.Message> msg)
        {
            wb.Navigate("");
            string message = "";
            if (msg.Count > 0)
            {
                string chatId = "";
                foreach (LiveSupport.OperatorConsole.LiveChatWS.Message item in msg)
                {
                    if (item == null) continue;

                    if (chatId != item.ChatId)
                    {
                        message += "--------------------------------<font style='font-size:14px; color:red;'>" + item.SentDate + "</font>------------------------------------<br>";
                    }
                    chatId = item.ChatId;
                    message += "<font style='font-size:13px; color:red;'>" + item.SentDate.ToString() + "</font>  <font style='font-size:13px; color:blue;'>" + item.Source + "</font>  <b style='font-size:12px;'>对</b> <font style='font-size:13px; color:blue;'>" + item.Destination + "</font>  <b style='font-size:12px;'>说:</b> " + "<font style='font-size:13px; '>" + item.Text + "</font> <br>";
                }
            }
            else
            {
                message += "<font style='font-size:14px; color:red;'>对不起,暂无数据...</font>";
            }
            wb.Document.Write(message);
        }
        #endregion

        private void UserControlMessage_Load(object sender, EventArgs e)
        {
          
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            label1.Visible = false;
            timer1.Enabled = false;
        }
    }
}
