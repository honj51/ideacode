﻿using System;
using LiveSupport.LiveSupportModel;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IDepartmentProvider
    {
        int AddDepartment(Department department);
        bool CheckAccountByDepartment(string accountId, string departmentName);
        int DeleteDepartmentById(string departmentId);
        System.Collections.Generic.List<Department> GetDepartmentByAccountId(string AccountId);
        Department GetDepartmentById(string departmentId);
        int UpdateDepartmentById(string accountId, string departmentId, string DepartmentName);
    }
}
