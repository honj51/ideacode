using System;
using System.Collections.Generic;
using System.Text;
using OperatorServiceInterface;

namespace LiveSupport.BLL.Remoting
{
    public class OperatorServer : MarshalByRefObject, IOperatorServer
    {
        public OperatorServer()
        {
            Console.WriteLine("HelloServer activated");
        }
        #region IOperatorServer 成员

        public string Hello()
        {
            Console.WriteLine(
               "Server Hello.HelloMethod");
            return "Hello";
        }

        #endregion
    }
}
