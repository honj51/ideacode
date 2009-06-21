using System;
using System.Collections.Generic;
using System.Text;

namespace OperatorServiceInterface
{
    public class OperatorServerEventSink : MarshalByRefObject, IOperatorServerEvents
    {
        public void OnOperatorStatusChange(object sender, OperatorStatusChangeEventArgs e)
        {   
            if (OperatorStatusChange != null)
            {
                OperatorStatusChange(sender, e);
            }
        }

        private object tag;
        public object Tag
        {
            get { return tag; }
            set { tag = value; }
        }

        #region IOperatorServerEvents 成员

        public event OperatorStatusChangeEventHandler OperatorStatusChange;

        #endregion
    }
}
