using System;
using System.Collections.Generic;
using System.Text;
using OperatorServiceInterface;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.BLL.Remoting
{
    class EventDispatcher
    {
        public EventDispatcher()
        {
            OperatorService.OperatorStatusChange += new EventHandler<OperatorStatusChangeEventArgs>(OperatorService_OperatorStatusChange);
            ChatService.NewChat += new EventHandler<NewChatEventArgs>(ChatService_NewChat);
            ChatService.NewMessage += new EventHandler<ChatMessageEventArgs>(ChatService_NewMessage);
            ChatService.OperatorChatRequest += new EventHandler<OperatorChatRequestEventArgs>(ChatService_OperatorChatRequest);
            ChatService.OperatorChatRequestAccepted += new EventHandler<OperatorChatRequestAcceptedEventArgs>(ChatService_OperatorChatRequestAccepted);
            ChatService.OperatorChatRequestDeclined += new EventHandler<OperatorChatRequestDeclinedEventArgs>(ChatService_OperatorChatRequestDeclined);
            ChatService.ChatStatusChanged += new EventHandler<ChatStatusChangedEventArgs>(ChatService_ChatStatusChanged);
            ChatService.VisitorChatRequest += new EventHandler<VisitorChatRequestEventArgs>(ChatService_VisitorChatRequest);
            ChatService.VisitorChatRequestAccepted += new EventHandler<VisitorChatRequestAcceptedEventArgs>(ChatService_VisitorChatRequestAccepted);
        }

        #region 事件处理
        void ChatService_VisitorChatRequestAccepted(object sender, VisitorChatRequestAcceptedEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_VisitorChatRequest(object sender, VisitorChatRequestEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_ChatStatusChanged(object sender, ChatStatusChangedEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_OperatorChatRequestDeclined(object sender, OperatorChatRequestDeclinedEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_OperatorChatRequestAccepted(object sender, OperatorChatRequestAcceptedEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_OperatorChatRequest(object sender, OperatorChatRequestEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_NewMessage(object sender, ChatMessageEventArgs e)
        {
            throw new NotImplementedException();
        }

        void ChatService_NewChat(object sender, NewChatEventArgs e)
        {
            throw new NotImplementedException();
        }

        void OperatorService_OperatorStatusChange(object sender, OperatorStatusChangeEventArgs e)
        {
            //safeFireEvent(OperatorStatusChange, e);
        }
        #endregion 

    }
}
