using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace OperatorServiceInterface
{
    public delegate void OperatorStatusChangeEventHandler(OperatorStatusChangeEventArg arg);

    public interface IOperatorServer
    {
        event OperatorStatusChangeEventHandler OperatorStatusChange;
        void Login(string accountName, string operatorName, string password);
        string Hello(string name);
    }

    [Serializable]
    public class OperatorStatusChangeEventArg : EventArgs
    {
        public string OperatorId;
        public OperatorStatus Status;
        public OperatorStatusChangeEventArg(string operatorId, OperatorStatus status)
        {
            this.OperatorId = operatorId;
            this.Status = status;
        }
    }
}
