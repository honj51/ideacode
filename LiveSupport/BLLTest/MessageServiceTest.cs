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
    class MyMessageProvider : IMessageProvider
    {
        #region IMessageProvider 成员

        public void AddMessage(Message msg)
        {
            throw new NotImplementedException();
        }

        public int DeleteChatMessageByChatId(string chatId)
        {
            throw new NotImplementedException();
        }

        public List<Message> GetChatMessageByChatId(string chatId)
        {
            throw new NotImplementedException();
        }

        public List<Message> GetHistoryChatMessage(string sessionId, DateTime begin, DateTime end)
        {
            throw new NotImplementedException();
        }

        public List<Message> GetMessages(string SessionId, DateTime lastCheck)
        {
            throw new NotImplementedException();
        }

        #endregion
    }

    [TestFixture]
    public class MessageServiceTest
    {
        private List<Message> createMessages()
        {
            List<Message> messages = new List<Message>();
            for (int i = 0; i < 10; i++)
            {
                Message m = new Message();
                m.ChatId = "aaa";
                m.Source = "wo";
                m.Destination = "ni";
                m.SentDate = DateTime.Now;
                m.Text = "mmmmm" + i;
                m.Type = MessageType.ChatMessage_OperatorToVisitor;
                messages.Add(m);
            }
            return messages;
        }

        [Test]
        public void TestAddMessage()
        {
            MessageService.Provider = MockRepository.GenerateMock<
            DateTime time = DateTime.Now;
            List<Message> messages = createMessages();
            foreach (var item in messages)
            {
                MessageService.AddMessage(item);
            }

            Assert.AreSame(MessageService.GetMessages("aaa", time),messages);
        }

        [Test]
        public void TestGetMessage()
        {

        }
    }
}
