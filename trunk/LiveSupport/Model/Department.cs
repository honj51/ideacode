using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.LiveSupportModel
{
    /// <summary>
    /// 公司部门实体类
    /// </summary>
    public class Department
    {
        private string departmentId;

        public string DepartmentId
        {
            get { return departmentId; }
            set { departmentId = value; }
        }

        private string departmentName;

        public string DepartmentName
        {
            get { return departmentName; }
            set { departmentName = value; }
        }

        private Account account;

        public Account Account
        {
            get { return account; }
            set { account = value; }
        }
    }
}
