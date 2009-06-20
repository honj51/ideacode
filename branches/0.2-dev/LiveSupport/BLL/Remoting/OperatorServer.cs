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
            if (OperatorStatusChange != null)
            {
                OperatorStatusChange(new OperatorStatusChangeEventArg("111", OperatorStatus.Idle));
            }
        }

        public event OperatorStatusChangeEventHandler OperatorStatusChange;

        #endregion
    }
}
