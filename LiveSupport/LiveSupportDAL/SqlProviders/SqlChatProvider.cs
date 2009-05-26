using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;
namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlChatProvider : IChatProvider
    {

        public void AddChat(Chat chatRequest)
        {
            string sql = string.Format("INSERT INTO LiveChat_Chat "+
                "(ChatId,CreateBy,CreateTime,AccountId,VisitorId,Status) " 
            +"VALUES('{0}','{1}','{2}','{3}','{4}','{5}')" ,
                chatRequest.ChatId, chatRequest.CreateBy, chatRequest.CreateTime,chatRequest.AccountId, chatRequest.VisitorId, chatRequest.Status);
            DBHelper.ExecuteCommand(sql);
        }
        /// <summary>
        /// 关闭对话
        /// </summary>
        /// <param name="chat">Chat</param>
        /// <returns></returns>
        public int CloseChat(Chat chat)
        {
            string sql = string.Format("update dbo.LiveChat_Chat set CloseBy='{0}', CloseTime='{1}' where ChatId='{2}'",chat.CloseBy,chat.CloseTime,chat.ChatId);
            return DBHelper.ExecuteCommand(sql);
        }

        #region 通过客服编号获得所有对象
        public List<Chat> GetChatByOperatorId(string operatorId,string beginDate, string endDate)
        {
            //string sql = "select * from LiveChat_Chat where OperatorId='"+operatorId+"'";
            string sql = string.Format("select * from LiveChat_Chat where OperatorId='{0}' and CreateTime>='{1}' and CloseTime<='{2}'", operatorId, beginDate, endDate);
            SqlDataReader sdr=DBHelper.GetReader(sql);
            List<Chat> list = new List<Chat>();
            while (sdr.Read())
            {
                Chat chat = new Chat(sdr);
                SqlVisitSessionProvider vs = new SqlVisitSessionProvider();
                chat.Vs = vs.GetSessionById(chat.ChatId);
                //chat.ChatId = sdr["ChatId"].ToString();
                //chat.CreateBy = sdr["CreateBy"].ToString();
                //chat.CreateBy = sdr["CloseBy"].ToString();
                //chat.CreateTime = Convert.ToDateTime(sdr["CreateTime"].ToString());
                //chat.AcceptTime = Convert.ToDateTime(sdr["AcceptTime"].ToString());
                //chat.CloseTime = Convert.ToDateTime(sdr["CloseTime"].ToString());
                //chat.AccountId = sdr["AccountId"].ToString();
                //chat.VisitorId = sdr["VisitorId"].ToString();
                //chat.OperatorId = sdr["OperatorId"].ToString();
                //chat.Status = (ChatStatus)Enum.Parse(typeof(ChatStatus), sdr["Status"].ToString());
                list.Add(chat);
            }
            sdr.Close();
            return list;
        }
        #endregion

        #region 通过ChatId删除Chat
        public int DeleteChatById(string chatId)
        {
            try
            {
                SqlMessageProvider mp = new SqlMessageProvider();
                mp.DeleteChatMessageByChatId(chatId);//删除聊天记录
                string sql = "delete from LiveChat_Chat where ChatId='" + chatId + "'";
                return DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        #endregion
    }
}
