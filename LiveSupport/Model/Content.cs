using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.Model
{
    public class Content
    {
        public Content() { }

        #region Model

        private int _Id;
        private string _userName;
        private string _userUrl;
        private string _userMail;
        private string _userQQ;
        private string _userIp;
        private string _faceUrl;
        private string _picUrl;
        private DateTime _addTime;
        private string _content;
        private string _reply;
        private int _isHid;
        private int _isreply;

        #endregion

        /// <summary>
        /// 
        /// </summary>
        public int Id
        {
            set { _Id = value; }
            get { return _Id; }
        }
        public string UserName
        {
            set { _userName = value; }
            get { return _userName; }
        }
        public string UserMail
        {
            set { _userMail = value; }
            get { return _userMail; }
        }
        public string UserUrl
        {
            set { _userUrl = value; }
            get { return _userUrl; }
        }
        public string UserIp
        {
            set { _userIp = value; }
            get { return _userIp; }
        }
        public string FaceUrl
        {
            set { _faceUrl = value; }
            get { return _faceUrl; }
        }
        public string PicUrl
        {
            set { _picUrl = value; }
            get { return _picUrl; }
        }
        public string UserQQ
        {
            set { _userQQ = value; }
            get { return _userQQ; }
        }
        public DateTime AddTime
        {
            set { _addTime = value; }
            get { return _addTime; }
        }
        public string Contents
        {
            set { _content = value; }
            get { return _content; }
        }
        public string Reply
        {
            set { _reply = value; }
            get { return _reply; }
        }
        public int IsHid
        {
            set { _isHid = value; }
            get { return _isHid; }
        }
        public int IsReply
        {
            set { _isreply = value; }
            get { return _isreply; }
        }

        public Content(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["Id"])) _Id = (int)data["Id"];
            if (!Convert.IsDBNull(data["UserName"])) _userName = (string)data["UserName"];
            if (!Convert.IsDBNull(data["UserUrl"])) _userUrl = (string)data["UserUrl"];
            if (!Convert.IsDBNull(data["UserEmail"])) _userMail = (string)data["UserEmail"];
            if (!Convert.IsDBNull(data["UserQQ"])) _userQQ = (string)data["UserQQ"];
            if (!Convert.IsDBNull(data["UserIp"])) _userIp = (string)data["UserIp"];
            if (!Convert.IsDBNull(data["FaceUrl"])) _faceUrl = (string)data["FaceUrl"];
            if (!Convert.IsDBNull(data["PicUrl"])) _picUrl = (string)data["PicUrl"];
            if (!Convert.IsDBNull(data["AddTime"])) _addTime = (DateTime)data["AddTime"];
            if (!Convert.IsDBNull(data["Content"])) _content = (string)data["Content"];
            if (!Convert.IsDBNull(data["Reply"])) _reply = (string)data["Reply"];
            if (!Convert.IsDBNull(data["IsHid"])) _isHid = (int)data["IsHid"];
            if (!Convert.IsDBNull(data["Isreply"])) _isreply = (int)data["Isreply"];
        }
    }
}
