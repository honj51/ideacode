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
    public partial class UserControlMessage : UserControl
    {
        string message = "";
        public UserControlMessage()
        {
            InitializeComponent();
            
        }
        public UserControlMessage(string aa)
        {
            message=aa;
            InitializeComponent();
        }
        public void GetMessage(string message,string type)
        {
            wb.Height = 278;
            wb.Width = 420;
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
        public UserControlMessage(List<LiveSupport.OperatorConsole.LiveChatWS.Message> msg)
        {
            InitializeComponent();
            DataBindMessage(msg);
        }

        private void wb_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
        {

        }

        private void wb_DocumentCompleted_1(object sender, WebBrowserDocumentCompletedEventArgs e)
        {

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
    }
}
