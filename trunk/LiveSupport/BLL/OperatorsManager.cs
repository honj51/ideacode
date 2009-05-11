using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Collections.Generic;
using LiveSupport.SqlProviders;
using LiveSupport.SqlProviders.Entity;

namespace LiveSupport.BLL
{
    /// <summary>
    ///OperatorsManager 的摘要说明
    /// </summary>
    public class OperatorsManager
    {
        private static bool _isInitialized = false;
        private static OperatorProvider _provider;

        ///<summary>
        /// returns the current accounts data provider
        ///</summary>    
        public static OperatorProvider Provider
        {
            get
            {
                Initialize();
                return _provider;
            }
        }

        /// <summary>
        /// Initilizes a concrete data provider based on setting in web.config
        /// InvalidOperationException may be thrown if an actual provider cannot be instantiated
        /// </summary>
        private static void Initialize()
        {
            if (!_isInitialized)
            {
                _provider = new SqlOperatorProvider();
                _isInitialized = true;
            }
        }

        public static List<Operator> FindOperatorsByAccountId(int accountId)
        {
            return Provider.FindOperatorsByAccountId(accountId);
        }

        public static Operator GetOperatorById(string operatorId)
        {
            return Provider.GetOperatorById(operatorId);
        }

        public static Operator CreateOperator(int accountId)
        {
            //return Provider.CreateAccount(adminUserName);
            //return new Operator(0, accountId);
            return null;
        }

        public static void InsertOperator(Operator op)
        {
            op.AccountId = AccountsManager.GetAccount().AccountId;
            Provider.InsertOperator(op);
        }

        public static void UpdateOperator(Operator op)
        {
            Provider.UpdateOperator(op);
        }

        public static void DeleteOperator(int operatorId)
        {
            Provider.DeleteOperator(operatorId);
        }

        public static Operator LoginOperator(string name, string password, string accountName)
        {
            try
            {
                Account account = AccountsManager.FindAccountByAdminUserName(accountName);
                if (account == null)
                {
                    return null;
                }
                return null;
                //return Provider.LoginOperator(name, password, account.AccountId);
            }
            catch (Exception)
            {
                throw;
            }
        }

        #region 
        public static void UpdateStatus(int operatorId, bool isOnline)
        {
            Provider.UpdateStatus(operatorId, isOnline);
        }
        public static bool GetOperatorStatus(int accountId)
        {
            return Provider.GetOperatorStatus(accountId);
        }
        public static List<ChatRequestInfo> GetChatRequest(int operatorId)
        {
            return Provider.GetChatRequest(operatorId);
        }
        public static List<Operator> GetOnlineOperator()
        {
            return Provider.GetOnlineOperator();
        }
        #endregion
    }
}