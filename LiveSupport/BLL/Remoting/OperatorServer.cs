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

        private void fireOperatorStatusChange()
        {
            if (OperatorStatusChange != null)
            {
                OperatorStatusChangeEventHandler eh = null;
                int index = 1;
                foreach (Delegate del in OperatorStatusChange.GetInvocationList())
                {
                    try
                    {
                        eh = (OperatorStatusChangeEventHandler)del;
                        eh(this, new OperatorStatusChangeEventArgs("111", OperatorStatus.Idle));
                    }
                    catch
                    {
                        OperatorStatusChange -= eh;
                    }
                    index++;
                }
            }
        }

        public event OperatorStatusChangeEventHandler OperatorStatusChange;

        #endregion
    }
}
