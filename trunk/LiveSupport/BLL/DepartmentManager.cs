using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.Providers;
using LiveSupport.LiveSupportDAL.SqlProviders;

namespace LiveSupport.BLL
{
    /// <summary>
    /// 部门业务管理类
    /// </summary>
    public class DepartmentManager
    {
        private static IDepartmentProvider Provider = new SqlDepartmentProvider();
        #region 添加部门
        public static bool AddDepartment(Department department)
        {
            int i = 0;
            i = Provider.AddDepartment(department);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion

        #region 通过公司编号获得所有部门
        public static List<Department> GetDepartmentByAccountId(string AccountId)
        {
            return Provider.GetDepartmentByAccountId(AccountId);
        }
        #endregion

        #region 修改部门信息
        public static bool UpdateDepartmentById(string accountId,string departmentId, string DepartmentName)
        {
            if(DepartmentName==null){
                return false;
            }
            int i = 0;
            i = Provider.UpdateDepartmentById(accountId,departmentId, DepartmentName);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion

        #region  删除部门
        public static bool DeleteDepartmentById(string departmentId)
        {
            int i = 0;
            i = Provider.DeleteDepartmentById(departmentId);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion
        
        #region 通过部门编号获得部门
        public static Department GetDepartmentById(string departmentId)
        {
            return Provider.GetDepartmentById(departmentId);
        }
        #endregion
    }
}
