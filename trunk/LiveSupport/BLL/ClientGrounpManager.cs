using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using LiveSupport.SqlProviders;

namespace LiveSupport.BLL
{
    public class ClientGrounpManager
    {
        #region 添加客服分组
        public static  bool AddClientGrounp(ClientGrounp cg)
        {
            int i = 0;
            i=new SqlClientGrounpProvider().AddClientGrounp(cg);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion

        #region 验证公司是否存在此客服分组
        public static ClientGrounp CheckClientGrounpByAccountIdAndGrountpName(string accountId, string GrountpName)
        {
            return new SqlClientGrounpProvider().CheckClientGrounpByAccountIdAndGrountpName(accountId, GrountpName);
        }
        #endregion

        #region 通过分组编号获得分组
        public static ClientGrounp GetClientGrounpById(string grounpId)
        {
            return new SqlClientGrounpProvider().GetClientGrounpById(grounpId);
        }
        #endregion

        #region 通过公司编号获得分组
        public static List<ClientGrounp> GetClientGrounpByAccountId(string accountId)
        {
            return new SqlClientGrounpProvider().GetClientGrounpByAccountId(accountId);
        }
        #endregion



        #region 修改客服分组
        public bool UpdateClientGrounp(ClientGrounp cg)
        {
            int i = 0;
            i = new SqlClientGrounpProvider().UpdateClientGrounp(cg);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion
    }
}
