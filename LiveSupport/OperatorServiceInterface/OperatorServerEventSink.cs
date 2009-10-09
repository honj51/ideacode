using System;
using System.Collections.Generic;
using System.Text;

namespace OperatorServiceInterface
{
    public class OperatorServerEventSink : MarshalByRefObject, IOperatorServerEvents
    {
        public void OnOperatorStatusChange(object sender, OperatorStatusChangeEventArgs e)
        {   
            if (OperatorStatusChanged != null)
            {
                OperatorStatusChanged(sender, e);
            }
        }

        private object tag;
        public object Tag
        {
            get { return tag; }
            set { tag = value; }
        }

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

        #region IOperatorServerEvents 成员


        public event EventHandler<OperatorForceLogoffEventArgs> OperatorForceLogoff;

        #endregion
    }
}
