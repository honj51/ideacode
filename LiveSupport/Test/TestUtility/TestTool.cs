using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace TestUtility
{
    public class TestTool
    {
        static Random r = new Random();

        public static Account CreateNewAccount()
        {
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
            return at;
        }

        public static Visitor CreateNewVisitor(string accountId)
        {
            Visitor v = new Visitor();
            VisitSession s = new VisitSession();
            s.Location = "不知道";
            s.VisitingTime = DateTime.Now;
            
            s.VisitorId = v.VisitorId;
            v.AccountId = accountId;
            v.CurrentSession = s;
            s.Status = VisitSessionStatus.Visiting; // 浏览
            v.Name = "访客" + r.Next(1000) ;
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
            op.NickName = "客服" + r.Next(1000);
            return op;
        }

        public static Chat CreateNewChat(Visitor v, Operator o)
        {
            Chat c = new Chat();
            c.AccountId = v.AccountId;
            c.OperatorId = o.OperatorId;
            c.VisitorId = v.VisitorId;
            return c;
        }
    }
}
