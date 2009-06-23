using System;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IOperatorProvider
    {
        int DeleteOperatorByid(string operatorId);
        List<Operator> GetAllOperators();
        List<Operator> GetOperatorByAccountId(string accountId);
        Operator GetOperatorByLoginName(string loginName);
        Operator GetOperatorByOperatorId(string operatorId);
        int NewOperator(Operator op);
        int UpdateOperator(Operator op);
        Operator GetOperatorPassword(string accountNumber, string loginName, string eamil);
        Operator Login(string accountId, string loginName,string loginPwd);
        List<Operator> GetOperatorByAccountNumber(string accountNumber);
        List<Operator> GetAllOperatorsByStatus(string Status);
    }
}
