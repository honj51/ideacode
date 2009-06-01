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
        public static int DeleteOperatorByid(string operatorId)
        {
            return Provider.DeleteOperatorByid(operatorId);
        }

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
        /// <summary>
        /// 根据公司ID查询所以该公司的客服人员
        /// </summary>
        /// <param name="accountId"></param>
        /// <returns></returns>
        public static List<Operator> GetOperatorByAccountId(string accountId)
        {
            return Provider.GetOperatorByAccountId(accountId);
        }
        /// <summary>
        /// 通过OperatorId获得Operator
        /// </summary>
        /// <param name="operatorId"></param>
        /// <returns></returns>
        public static Operator GetOperatorByOperatorId(string operatorId)
        {
            return Provider.GetOperatorByOperatorId(operatorId);
        }
        //修改Operator
        public static bool UpdateOperator(Operator op)
        {
            int i = 0;
            i = Provider.UpdateOperator(op);
            if (i != 0)
                return true;
            else
                return false;
        }

         #region 通过Email找回密码
        public static Operator GetPasswordByAccountNameLoginNameAndEmail(string accountLoginName, string loginName, string eamil)
        {
            return Provider.GetPasswordByAccountNameLoginNameAndEmail(accountLoginName, loginName, eamil);
        }
        #endregion
    }
}