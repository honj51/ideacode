using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportDAL.Providers;

namespace LiveSupport.BLL
{
    /// <summary>
    ///OperatorsManager 的摘要说明
    /// </summary>
    public class OperatorsManager
    {
        private static IOperatorProvider Provider = new SqlOperatorProvider();

        #region 删除客服(string operatorId,string accountLoginName)
        public static int  DeleteOperatorByid(string operatorId,string accountLoginName)
        {
            Operator oper=Provider.GetOperatorByOperatorId(operatorId);
            if (oper.LoginName != accountLoginName)
            {
                int i = 0;
                i = Provider.DeleteOperatorByid(operatorId);
                if (i != 0)
                    return 1;
                else
                    return 0;
            }
            else
            {
                return 2;
            }
        }
        #endregion

        #region 增加Operator
        public static bool NewOperator(Operator op)
        {
            int i = 0;
            i=Provider.NewOperator(op);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion

        #region 根据公司ID查询所以该公司的客服人员
        public static List<Operator> GetOperatorByAccountId(string accountId)
        {
            return Provider.GetOperatorByAccountId(accountId);
        }
        #endregion

        #region 通过OperatorId获得Operator
        public static Operator GetOperatorByOperatorId(string operatorId)
        {
            return Provider.GetOperatorByOperatorId(operatorId);
        }
        #endregion

        #region 修改Operator
        public static bool UpdateOperator(Operator op)
        {
            int i = 0;
            i = Provider.UpdateOperator(op);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion

        #region 通过Email找回密码
        public static Operator GetPasswordByAccountNameLoginNameAndEmail(string accountLoginName, string loginName, string eamil)
        {
            return Provider.GetPasswordByAccountNameLoginNameAndEmail(accountLoginName, loginName, eamil);
        }
        #endregion
    }
}