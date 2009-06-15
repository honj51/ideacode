using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using LiveSupport.LiveSupportModel;
using Rhino.Mocks;
using LiveSupport.LiveSupportDAL.Providers;

namespace BLLTest
{
    class MyVisitorProvider : IVisitorProvider
    {
        List<Visitor> visitors = new List<Visitor>();
        #region IVisitorProvider 成员

        public Visitor GetVisitorById(string visitorId)
        {
            return visitors.Find(v => v.VisitorId == visitorId);
        }

        public void NewVisitor(Visitor visitor)
        {
            visitors.Add(visitor);
        }

        #endregion
    }
    [TestFixture]
    public class VisitorServiceTest
    {
        private string accountIdA = "XXXXXXXXXXXXXX";
        private string accountIdB = "DDDDDDDDDDDDDD";
        [Test]
        public void TestNewVisitor()
        {
            VisitorService.Provider = new MyVisitorProvider();

            Assert.AreEqual(0, VisitorService.GetAllOnlineVisitors(accountIdA).Count);
            Assert.AreEqual(0, VisitorService.GetAllOnlineVisitors(accountIdB).Count);
            Visitor v = new Visitor();
            VisitSession s = new VisitSession();
            s.VisitorId = v.VisitorId;
            s.Status = VisitSessionStatus.Leave; // 离开
            v.AccountId = accountIdA;
            v.CurrentSession = s;
            VisitorService.NewVisitor(v);
            Assert.AreEqual(0, VisitorService.GetAllOnlineVisitors(accountIdA).Count);
            Assert.AreEqual(0, VisitorService.GetAllOnlineVisitors(accountIdB).Count);

            s.Status = VisitSessionStatus.Visiting; // 浏览
            Assert.AreEqual(1, VisitorService.GetAllOnlineVisitors(accountIdA).Count);
            Assert.AreEqual(0, VisitorService.GetAllOnlineVisitors(accountIdB).Count);
        }

        [Test]
        public void TestGetVisitorById()
        {
            VisitorService.Provider = new MyVisitorProvider();
            Visitor v = new Visitor();
            VisitSession s = new VisitSession();
            s.VisitorId = v.VisitorId;
            s.Status = VisitSessionStatus.Leave; // 离开
            v.AccountId = accountIdA;
            v.CurrentSession = s;
            VisitorService.NewVisitor(v);

            Assert.AreSame(v,VisitorService.GetVisitor(v.VisitorId));
            Assert.IsNull(VisitorService.GetVisitor("dddd"));
        }

        [Test]
        public void TestGetNewVisitor()
        {
            VisitorService.Provider = new MyVisitorProvider();
            Visitor v = new Visitor();
            VisitSession s = new VisitSession();
            s.VisitorId = v.VisitorId;
            s.Status = VisitSessionStatus.Leave; // 离开
            v.AccountId = accountIdA;
            v.CurrentSession = s;
            VisitorService.NewVisitor(v);
            DateTime time = DateTime.Now.AddDays(1);
            s.VisitingTime = time;
            VisitorService.NewVisitor(v);

            Assert.AreEqual(0, VisitorService.GetNewVisitors(accountIdA, time.Ticks).Count);
            Assert.AreEqual(1, VisitorService.GetNewVisitors(accountIdA, DateTime.Now.Ticks).Count);
            Assert.AreEqual(0, VisitorService.GetNewVisitors(accountIdA, DateTime.Now.AddDays(2).Ticks).Count);
        }
    }
}
