using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface ISqlDepartmentProvider
    {
        int AddDepartment(LiveSupport.LiveSupportModel.Department department);
        bool CheckAccountByDepartment(string accountId, string departmentName);
        int DeleteDepartmentById(string departmentId);
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Department> GetDepartmentByAccountId(string AccountId);
        LiveSupport.LiveSupportModel.Department GetDepartmentById(string departmentId);
        int UpdateDepartmentById(string departmentId, string DepartmentName);
    }
}
