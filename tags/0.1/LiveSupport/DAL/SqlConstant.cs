using System;
using System.Data;
using System.Configuration;
using System.Web;

namespace LiveSupport.DAL
{
    /// <summary>
    ///SqlConstant 的摘要说明
    /// </summary>
    public class SqlDataAccessConstant
    {
        // store procedure
        public const string SP_LiveSupport_Accounts_CreateAccount = "LiveSupport_Accounts_CreateAccount";
        public const string SP_LiveSupport_Accounts_FindAccountByAdminUserId = "LiveSupport_Accounts_FindAccountByAdminUserId";
        public const string SP_LiveSupport_Operators_CreateOperator = "LiveSupport_Operators_CreateOperator";
        public const string SP_LiveSupport_Operators_FindOperatorsByAccountId = "LiveSupport_Operators_FindOperatorsByAccountId";
        public const string SP_LiveSupport_Operators_GetOperatorById = "LiveSupport_Operators_GetOperatorById";
        public const string SP_LiveSupport_LiveSupport_Operators_LoginOperator = "LiveSupport_Operators_LoginOperator";
    }
}