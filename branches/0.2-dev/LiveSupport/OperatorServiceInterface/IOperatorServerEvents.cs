using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace OperatorServiceInterface
{
    public delegate void OperatorStatusChangeEventHandler(object sender, OperatorStatusChangeEventArgs e);

    public interface IOperatorServerEvents
    {
        event OperatorStatusChangeEventHandler OperatorStatusChange;
    }
     
    [Serializable]
    public class OperatorStatusChangeEventArgs : EventArgs
    {
        public string OperatorId;
        public OperatorStatus Status;
        public OperatorStatusChangeEventArgs(string operatorId, OperatorStatus status)
        {
            this.OperatorId = operatorId;
            this.Status = status;
        }
    }
}
