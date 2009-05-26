using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface ISqlOperatorProvider
    {
        int DeleteOperatorByid(string operatorId);
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Operator> GetAllOperators();
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Operator> GetOperatorByAccountId(string accountId);
        LiveSupport.LiveSupportModel.Operator GetOperatorByLoginName(string loginName);
        LiveSupport.LiveSupportModel.Operator GetOperatorByOperatorId(string operatorId);
        void NewOperator(LiveSupport.LiveSupportModel.Operator op);
        int UpdateOperator(LiveSupport.LiveSupportModel.Operator op);
    }
}
