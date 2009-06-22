using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.Remoting.Messaging;

namespace OperatorServiceInterface
{
    [Serializable]
    public class AuthenticateData : ILogicalThreadAffinative
    {
        public string OperatorId;
        public string OperatorSession;
    }
}
