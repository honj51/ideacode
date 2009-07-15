using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.Providers;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlContentProvider : IContent
    {
        #region IContent 成员

        public int Add(Content content)
        {
            string sql = string.Format("insert into LiveSupport_Content(UserName,UserEmail,UserQQ,UserUrl,UserIp,faceUrl,PicUrl,AddTime,Content,Reply,IsHid,IsReply)" +
            " values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}',{10},{11})",content.UserName,content.UserMail,content.UserQQ,content.UserUrl,content.UserIp,content.FaceUrl,content.PicUrl,content.AddTime,content.Contents,content.Reply,content.IsHid,content.IsReply);
            return DBHelper.ExecuteSql(sql);
        }

        public List<Content> GetList()
        {
            List<Content> list = new List<Content>();
            string sql = "Select * From LiveSupport_Content order by AddTime desc";
            using(SqlDataReader sdr=DBHelper.GetReader(sql))
            {
                while (sdr.Read())
                {
                    list.Add(new Content(sdr));
                }
                return list;
            }
            
        }

        public int UDel(int nId)
        {
            string sql = "delete from LiveSupport_Content Where Id=" + nId;
            return DBHelper.ExecuteSql(sql);
        }

        public int UAddRe(Content content)
        {
            string sql = string.Format("update LiveSupport_Content set Reply='{0}' where Id='{1}'", content.Reply, content.Id);
            return DBHelper.ExecuteSql(sql);
       }

        #endregion

    }
}
