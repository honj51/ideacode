using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    /// <summary>
    /// 浏览者留言实体类
    /// </summary>
    public class LeaveWord
    {
        private string id; //留言编号

        public string Id
        {
            get { return id; }
            set { id = value; }
        }
        private string callerName;//访问者名称

        public string CallerName
        {
            get { return callerName; }
            set { callerName = value; }
        }
        private string email;//电子邮件

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string phone;//电话

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private string subject;//主题

        public string Subject
        {
            get { return subject; }
            set { subject = value; }
        }
        private string content;//内容

        public string Content
        {
            get { return content; }
            set { content = value; }
        }
        private string ip;//ip地址

        public string Ip
        {
            get { return ip; }
            set { ip = value; }
        }
        private string callerDate;//留言时间

        public string CallerDate
        {
            get { return callerDate; }
            set { callerDate = value; }
        }

        private string senddate;//回复时间

        public string Senddate
        {
            get { return senddate; }
            set { senddate = value; }
        }

        private string operatorName;//回复者

        public string OperatorName
        {
            get { return operatorName; }
            set { operatorName = value; }
        }

        private string isSend;      //是否回复

        public string IsSend
        {
            get { return isSend; }
            set { isSend = value; }
        }

        private Account account;    //公司对象

        public Account Account
        {
            get { return account; }
            set { account = value; }
        }

        public LeaveWord(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["id"])) id = (string)data["id"];
            if (!Convert.IsDBNull(data["callerName"])) callerName = (string)data["callerName"];
            if (!Convert.IsDBNull(data["email"])) email = (string)data["email"];
            if (!Convert.IsDBNull(data["phone"])) phone = (string)data["phone"];
            if (!Convert.IsDBNull(data["subject"])) subject = (string)data["subject"];
            if (!Convert.IsDBNull(data["content"])) content = (string)data["content"];
            if (!Convert.IsDBNull(data["ip"])) ip = (string)data["ip"];
            if (!Convert.IsDBNull(data["callerDate"])) callerDate =Convert.ToDateTime(data["callerDate"]).ToString();
            if (!Convert.IsDBNull(data["senddate"]))
            {
                senddate = Convert.ToDateTime(data["senddate"]).ToString();
                isSend = "已回复";
            }
            else
            {
                isSend = "未回复";
            }
            if (!Convert.IsDBNull(data["operatorName"])) operatorName = (string)data["operatorName"];

        }

    }
}
