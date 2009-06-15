using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;
namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    /// <summary>
    /// 公司部门
    /// </summary>
    public class SqlDepartmentProvider : IDepartmentProvider
    {

        private SqlAccountProvider accountProvider = new SqlAccountProvider();

        #region 添加部门
        public int AddDepartment(Department department)
        {
            try
            {
                bool b=CheckAccountByDepartment(department.Account.AccountId, department.DepartmentName);
                if (b)
                {
                    int isDefault = 0;
                    if (department.IsDefault == false)
                        isDefault = 0;
                    else
                        isDefault = 1;
                    string sql = string.Format("insert into LiveSupport_Department(DepartmentId,DepartmentName,AccountId,IsDefault,AddDate) values('{0}','{1}','{2}','{3}','{4}')", department.DepartmentId, department.DepartmentName, department.Account.AccountId, isDefault, department.AddDate);
                    return DBHelper.ExecuteCommand(sql);
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                System.Console.Write(ex.ToString());
                return 0; 
            }
        }
        #endregion

        #region 验证公司是否存在部门
        public bool CheckAccountByDepartment(string accountId, string departmentName)
        {
            string sql = string .Format("select * from LiveSupport_Department where AccountId='{0}' and DepartmentName='{1}'",accountId,departmentName);
            SqlDataReader sdr = DBHelper.GetReader(sql);
            if (sdr.Read())
                return false;
            else
                return true;
        }

        #endregion

        #region 通过公司编号获得所有部门
        public List<Department> GetDepartmentByAccountId(string AccountId)
        {
            List<Department> list = new List<Department>();
            string sql = "select * from LiveSupport_Department where AccountId='" + AccountId + "' order by AddDate";
            SqlDataReader sdr=DBHelper.GetReader(sql);
            while (sdr.Read())
            {
                Department department = new Department();
                department.DepartmentId = sdr["DepartmentId"].ToString();
                department.DepartmentName = sdr["DepartmentName"].ToString();
                department.IsDefault = Convert.ToBoolean(sdr["IsDefault"]);
                string aid = sdr["AccountId"].ToString();
                department.Account = accountProvider.GetAccountByAccountId(aid);
                list.Add(department);
            }
            sdr.Close();
            return list;
        }
        #endregion

        #region 修改部门信息
        public int UpdateDepartmentById(string accountId,string departmentId, string DepartmentName)
        {
            try
            {
                if (CheckAccountByDepartment(accountId, DepartmentName))
                {
                    string sql = string.Format("update LiveSupport_Department set DepartmentName='{0}' where DepartmentId='{1}'", DepartmentName, departmentId);
                    return DBHelper.ExecuteCommand(sql);
                }
                else {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                System.Console.Write(ex.ToString());
                return 0;
            }
        }
        #endregion

        #region  删除部门
        public int DeleteDepartmentById(string departmentId)
        {
            try
            {
                string sql = string.Format("delete from LiveSupport_Department where DepartmentId='{0}'", departmentId);
                return DBHelper.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                System.Console.Write(ex.ToString());
                return 0;
            }
        }
        #endregion

        #region 通过部门编号获得部门
        public Department GetDepartmentById(string departmentId)
        {
            string sql = "select * from LiveSupport_Department where DepartmentId='" + departmentId + "'";
            SqlDataReader sdr = DBHelper.GetReader(sql);
            if (sdr.Read())
            {
                Department department = new Department();
                department.DepartmentId = sdr["DepartmentId"].ToString();
                department.DepartmentName = sdr["DepartmentName"].ToString();
                department.IsDefault =Convert.ToBoolean(sdr["IsDefault"]);
                string aid = sdr["AccountId"].ToString();
                department.Account = accountProvider.GetAccountByAccountId(aid);
                sdr.Close();
                return department;
            }
            else
            {
                sdr.Close();
                return null;
            }
        }
        #endregion
    }
}
