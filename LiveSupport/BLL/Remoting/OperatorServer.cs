using System;
using System.Collections.Generic;
using System.Text;
using OperatorServiceInterface;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.BLL.Remoting
{
    public class OperatorServer : MarshalByRefObject, IOperatorServer
    {
        public OperatorServer()
        {
            Console.WriteLine("HelloServer activated");
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
            safeFireEvent(OperatorStatusChange, e);
        }
        #region IOperatorServer 成员

        public string Hello(string name)
        {
            Console.WriteLine(
               "Server Hello.HelloMethod");
            return "Hello "+name;
        }

        public void Login(string accountName, string operatorName, string password)
        {
            safeFireEvent(OperatorStatusChange, new OperatorStatusChangeEventArgs("111", OperatorStatus.Idle));
        }

        private void safeFireEvent(Delegate del, EventArgs args)
        {
            if (del != null)
            {
                Delegate d = null;
                foreach (Delegate item in del.GetInvocationList())
                {
                    try
                    {
                        d = item;
                        d.DynamicInvoke(new object[] { this,args });
                    }
                    catch
                    {
                        Delegate.Remove(del, d);
                        // TODO: 客服端回调失败，其他处理
                    }
                }
            }
        }

        //private void fireOperatorStatusChange()
        //{
        //    if (OperatorStatusChange != null)
        //    {
        //        OperatorStatusChangeEventHandler eh = null;
        //        int index = 1;
        //        foreach (Delegate del in OperatorStatusChange.GetInvocationList())
        //        {
        //            try
        //            {
        //                eh = (OperatorStatusChangeEventHandler)del;
        //                eh(this, new OperatorStatusChangeEventArgs("111", OperatorStatus.Idle));
        //            }
        //            catch
        //            {
        //                OperatorStatusChange -= eh;
        //            }
        //            index++;
        //        }
        //    }
        //}

        //public event OperatorStatusChangeEventHandler OperatorStatusChange;

        #endregion

        #region IOperatorServerEvents 成员

        public event EventHandler<OperatorStatusChangeEventArgs> OperatorStatusChange;

        #endregion

        #region IOperatorServerEvents 成员

        public event EventHandler<OperatorStatusChangeEventArgs> OperatorStatusChanged;

        public event EventHandler<VisitorChatRequestEventArgs> VisitorChatRequest;

        public event EventHandler<OperatorChatRequestEventArgs> OperatorChatRequest;

        public event EventHandler<VisitorChatRequestAcceptedEventArgs> VisitorChatRequestAccepted;

        public event EventHandler<OperatorChatRequestAcceptedEventArgs> OperatorChatRequestAccepted;

        public event EventHandler<OperatorChatRequestDeclinedEventArgs> OperatorChatRequestDeclined;

        public event EventHandler<NewChatEventArgs> NewChat;

        public event EventHandler<ChatStatusChangedEventArgs> ChatStatusChanged;

        public event EventHandler<OperatorChatJoinInviteEventArgs> ChatJoinInvite;

        public event EventHandler<OperatorChatJoinInviteAcceptedEventArgs> ChatJoinInviteAccepted;

        public event EventHandler<OperatorChatJoinInviteDeclinedEventArgs> ChatJoinInviteDeclined;

        public event EventHandler<ChatMessageEventArgs> NewMessage;

        public event EventHandler<NewVisitingEventArgs> NewVisiting;

        public event EventHandler<VisitorLeaveEventArgs> VisitorLeave;

        #endregion
    }
}
