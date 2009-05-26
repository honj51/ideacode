using System;
using LiveSupport.LiveSupportModel;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface IOperatorProvider
    {
        int DeleteOperatorByid(string operatorId);
        System.Collections.Generic.List<Operator> GetAllOperators();
        System.Collections.Generic.List<Operator> GetOperatorByAccountId(string accountId);
        Operator GetOperatorByLoginName(string loginName);
        Operator GetOperatorByOperatorId(string operatorId);
        void NewOperator(Operator op);
        int UpdateOperator(Operator op);
    }
}
