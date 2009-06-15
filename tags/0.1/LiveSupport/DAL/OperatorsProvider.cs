using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Configuration.Provider;
using System.Collections.Generic;
using LiveSupport.DAL.Entity;

namespace LiveSupport.DAL
{
    /// <summary>
    ///OperatorsProvider 的摘要说明
    /// </summary>
    public abstract class OperatorsProvider : ProviderBase
    {
        public abstract List<Operator> GetAllOperators();
        public abstract List<Operator> FindOperatorsByAccountId(int accountId);
        public abstract Operator GetOperatorById(int operatorId);
        public abstract Operator CreateOperator(int accountId);
        public abstract void InsertOperator(Operator op);
        public abstract void UpdateOperator(Operator op);
        public abstract void DeleteOperator(int operatorId);

        #region service logic
        public abstract Operator LoginOperator(string name, string password, int accountId);
        public abstract void UpdateStatus(int operatorId, bool isOnline);
        public abstract bool GetOperatorStatus(int accountId);
        public abstract List<ChatRequestInfo> GetChatRequest(int operatorId);
        public abstract List<Operator> GetOnlineOperator();
        #endregion
    }
}