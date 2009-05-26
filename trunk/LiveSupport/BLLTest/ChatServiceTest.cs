using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LiveSupport.LiveSupportDAL.Providers;
using NUnit.Framework;
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


        [Test]
        public void AcceptOperatorInvitationTest()
        {
            //// 1. Operator邀请对话
            //ChatService.OperatorRequestChat("1111", "2222");

            //ChatService.AcceptOperatorInvitation("abc");
        }
    }

}
