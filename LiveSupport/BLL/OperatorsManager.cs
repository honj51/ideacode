using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Collections.Generic;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;

namespace LiveSupport.BLL
{
    /// <summary>
    ///OperatorsManager 的摘要说明
    /// </summary>
    public class OperatorsManager
    {
        public static int DeleteOperatorByid(string operatorId)
        {
            return  SqlOperatorProvider.DeleteOperatorByid(operatorId);
        }
        /// <summary>
        /// 增加Operator
        /// </summary>
        /// <param name="op"></param>
        public static void NewOperator(Operator op)
        {
            SqlOperatorProvider.NewOperator(op);
        }
        /// <summary>
        /// 根据公司ID查询所以该公司的客服人员
        /// </summary>
        /// <param name="accountId"></param>
        /// <returns></returns>
        public static List<Operator> GetOperatorByAccountId(string accountId)
        {
          return  SqlOperatorProvider.GetOperatorByAccountId(accountId);
        }
        /// <summary>
        /// 通过OperatorId获得Operator
        /// </summary>
        /// <param name="operatorId"></param>
        /// <returns></returns>
        public static Operator GetOperatorByOperatorId(string operatorId)
        {
          return  SqlOperatorProvider.GetOperatorByOperatorId(operatorId);
        }
    }
}