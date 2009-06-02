using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LiveSupport.LiveSupportDAL.Providers;
using LiveSupport.LiveSupportModel;
using NUnit.Framework;

namespace BLLTest
{
    public class VisitSessionServiceTest
    {
        class MyVisitSessionServiceProvider : IVisitSessionProvider
        {
            public List<VisitSession> Sessions = new List<VisitSession>();
            #region IVisitSessionProvider 成员

            public LiveSupport.LiveSupportModel.VisitSession GetSessionById(string sessionId)
            {
                return Sessions.Find(s => s.SessionId == sessionId);
            }

            public List<LiveSupport.LiveSupportModel.VisitSession> GetVisitSessionByVisitor(string visitorId)
            {
                throw new NotImplementedException();
            }

            public void NewSession(LiveSupport.LiveSupportModel.VisitSession session)
            {
                Sessions.Add(session);
            }

            #endregion
        }
        class MyChatProvider : IChatProvider
        {

            #region IChatProvider 成员

            public void AddChat(Chat chatRequest)
            {
                throw new NotImplementedException();
            }

            public int CloseChat(Chat chat)
            {
                throw new NotImplementedException();
            }

            public int DeleteChatById(string chatId)
            {
                throw new NotImplementedException();
            }

            public List<Chat> GetChatByOperatorId(string operatorId, string beginDate, string endDate)
            {
                throw new NotImplementedException();
            }

            #endregion
        }
        
        [Test]
        public void TestNewSession()
        {   MyVisitSessionServiceProvider provider = new MyVisitSessionServiceProvider();
            VisitSession v = new VisitSession();
            VisitSessionService.Provider = provider;
            VisitSessionService.NewSession(v);
            Assert.AreEqual(1, provider.Sessions.Count);
            VisitSession vv = new VisitSession();
            vv.SessionId = v.SessionId;
            VisitSessionService.NewSession(vv);
            Assert.AreEqual(1, provider.Sessions.Count);            
        }

        [Test]
        public void TestNewSessionMaxNum()
        {
            MyVisitSessionServiceProvider provider = new MyVisitSessionServiceProvider();
            VisitSessionService.Provider = provider;
            for (int i = 0; i < 210; i++)
            {
                VisitSession s = new VisitSession();
                s.Status = VisitSessionStatus.Leave;
                VisitSessionService.NewSession(s);
            }

            Assert.AreEqual(200, VisitSessionService.Sessions.Count);
        }
        [Test]
        public void TestGetSessionById()
        {
            MyVisitSessionServiceProvider provider = new MyVisitSessionServiceProvider();
            VisitSessionService.Provider = provider;
            VisitSession v = new VisitSession();
            v.SessionId="aaaaa";               
            VisitSessionService.NewSession(v);
            Assert.AreEqual(v,VisitSessionService.GetSessionById(v.SessionId));
            Assert.AreEqual(1, VisitSessionService.Sessions.Count);
            for (int i = 0; i < 20; i++)
            {
               VisitSession vv = new VisitSession();
               vv.SessionId = "aaaaa";
               VisitSessionService.NewSession(vv);
            }

            Assert.AreEqual(1, VisitSessionService.Sessions.Count);
        }
        [Test]
        public void TestRequestChat()
        {
            MyVisitSessionServiceProvider provider = new MyVisitSessionServiceProvider();
            VisitSessionService.Provider = provider;
            MyChatProvider pp = new MyChatProvider();
            ChatService.Provider = pp;
            VisitSession v = new VisitSession();
            v.SessionId = "aaaaa";
            VisitSessionService.NewSession(v);
            Chat ch= new Chat();
            ch.AccountId = "2";
            ch.ChatId = "mfdsa";
            ch.CreateTime = DateTime.Now;
            ch.Status = LiveSupport.LiveSupportModel.ChatStatus.Requested;
            ch.VisitorId = "bbb";
          //  VisitSessionService.RequestChat(ch);
            Assert.AreEqual(0, ChatService.chats.Count);
            //Chat ch1 = new Chat();
            //ch.AccountId = "2";
            //ch1.ChatId = "aaaaa";
            //ch.VisitorId = "bbb";
            //VisitSessionService.RequestChat(ch1);
            //Assert.AreEqual(1, ChatService.chats.Count);
        }
    }
}
