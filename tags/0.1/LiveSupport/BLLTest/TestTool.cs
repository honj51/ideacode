using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace BLLTest
{
    class TestTool
    {
        public static Account CreateNewAccount()
        {
            Random r = new Random();
            Account at = new Account();
            at.CompanyName = "Company" + r.Next();
            at.Url = "http://test/";
            at.Phone = "1111111";
            at.ContactName = "aaa";
            at.Email = "dd";
            at.Province = "dd";
            at.City = "ee";
            at.Industry = "ee";
            at.OperatorCount = 1;
            at.RegisterDate = DateTime.Now;
            at.LoginName = Guid.NewGuid().ToString();
            at.Password = "eee";
            at.NickName = "eeeee";
            return at;
        }

        public static Visitor CreateNewVisitor(string accountId)
        {
            Visitor v = new Visitor();
            VisitSession s = new VisitSession();
            s.VisitingTime = DateTime.Now;
            
            s.VisitorId = v.VisitorId;
            v.AccountId = accountId;
            v.CurrentSession = s;
            s.Status = VisitSessionStatus.Visiting; // 浏览
            return v;
        }

        public static Operator CreateNewOperator(string accountId)
        {
            Operator op = new Operator();
            op.AccountId = accountId;
            op.LoginName = Guid.NewGuid().ToString();
            op.Password = Guid.NewGuid().ToString();
            op.AVChatStatus = "aa";
            
            op.Email = "dd";
            op.NickName = "bb";
            return op;
        }
    }
}
