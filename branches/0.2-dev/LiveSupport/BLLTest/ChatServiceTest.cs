using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LiveSupport.LiveSupportDAL.Providers;
using NUnit.Framework;
using LiveSupport.LiveSupportModel;
namespace BLLTest
{
    [TestFixture]
    public class ChatServiceTest
    {
        class myChatService : IChatProvider
        {

            #region IChatProvider 成员

            public void AddChat(LiveSupport.LiveSupportModel.Chat chatRequest)
            {
                throw new NotImplementedException();
            }

            public int CloseChat(LiveSupport.LiveSupportModel.Chat chat)
            {
                throw new NotImplementedException();
            }

            public int DeleteChatById(string chatId)
            {
                throw new NotImplementedException();
            }

            public List<LiveSupport.LiveSupportModel.Chat> GetChatByOperatorId(string operatorId, string beginDate, string endDate)
            {
                throw new NotImplementedException();
            }

            #endregion
        }
        class MyOperatorService : IOperatorProvider
        {
            #region IOperatorProvider 成员

            public int DeleteOperatorByid(string operatorId)
            {
                throw new NotImplementedException();
            }

            public List<LiveSupport.LiveSupportModel.Operator> GetAllOperators()
            {
                throw new NotImplementedException();
            }

            public List<LiveSupport.LiveSupportModel.Operator> GetOperatorByAccountId(string accountId)
            {
                throw new NotImplementedException();
            }

            public LiveSupport.LiveSupportModel.Operator GetOperatorByLoginName(string loginName)
            {
                throw new NotImplementedException();
            }

            public LiveSupport.LiveSupportModel.Operator GetOperatorByOperatorId(string operatorId)
            {
                throw new NotImplementedException();
            }

            public int NewOperator(LiveSupport.LiveSupportModel.Operator op)
            {
                throw new NotImplementedException();
            }

            public int UpdateOperator(LiveSupport.LiveSupportModel.Operator op)
            {
                throw new NotImplementedException();
            }

            #endregion
        }


        [Test]
        public void AcceptOperatorInvitationTest()
        {
            //// 1. Operator邀请对话
            //ChatService.OperatorRequestChat("1111", "2222");

            //ChatService.AcceptOperatorInvitation("abc");
        }
        [Test]
        public void ChatPageRequestChat()
        {
            LiveSupport.LiveSupportModel.Chat chatRequest = new LiveSupport.LiveSupportModel.Chat();
            chatRequest.AccountId = "aid";
            chatRequest.ChatId =Guid.NewGuid().ToString();
            chatRequest.CreateTime = DateTime.Now;
            chatRequest.Status = LiveSupport.LiveSupportModel.ChatStatus.Requested;
            chatRequest.OperatorId="aa";
        //    ChatService.ChatPageRequestChat(chatRequest);
            LiveSupport.LiveSupportModel.Operator op=null;
            foreach (var item in OperatorService.GetAllOperators())
	        {
        		 if(chatRequest.OperatorId==item.OperatorId)
                 {
                     op=item;
                 }
	        }
            Assert.AreEqual(op.Status, OperatorStatus.InviteChat);
        }
    }

}
