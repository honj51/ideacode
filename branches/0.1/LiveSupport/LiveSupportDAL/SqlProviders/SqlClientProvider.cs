using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.Providers;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;

namespace LiveSupport.SqlProviders
{
    public class SqlClientProvider : IClientProvider
    {

        #region 添加客户
        public int AddClient(Client client)
        {
            try
            {
                string sql = string.Format("insert into LiveSupport_Client([Id],[Name],Job,Unit,[Phone],[Email],GrounpId,Address,Age,Sex,QQ,Remark) "
                + "values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}',{8},{9},'{10}','{11}')", client.Id, client.Name, client.Job, client.Unit, client.Phone, client.Email, client.ClientGrounp.Id, client.Address, client.Age, client.Sex, client.Qq, client.Remark);
                return DBHelper.ExecuteSql(sql);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        #endregion

        #region 修改客户
        public int UpdateClient(Client client)
        {
            try
            {
                string sql = string.Format("update LiveSupport_Client set [Name]='{0}',Job='{1}',Unit='{2}',[Phone]='{3}',[Email]='{4}',GrounpId='{5}',Address='{6}',Age={7},Sex={8},QQ='{9}',Remark='{10}' where [Id]='{11}'", client.Name, client.Job, client.Unit, client.Phone, client.Email, client.ClientGrounp.Id, client.Address, client.Age, client.Sex, client.Qq, client.Remark, client.Id);
                return DBHelper.ExecuteSql(sql);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        #endregion

        #region 通过客户编号获得客户信息
        public Client GetClientById(string id)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region 通过分组编号获得客户
        public List<Client> GetClientByGrounpId(string grounpId)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region 删除客户
        public int DeleteClientById(string id)
        {
            throw new NotImplementedException();
        }
        #endregion

    }
}
