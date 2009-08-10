using System;
using System.Collections.Generic;
using System.Text;

namespace OperatorServiceInterface
{
    public interface IOperatorServerActions
    {
    }

    [Serializable]
    public class LoginAction
    {
        public string OperatorId;
        public LoginAction(string operatorId)
        {
            OperatorId = operatorId;
        }
    }

    [Serializable]
    public class LogoutAction
    {
        public string OperatorId;
    }

    [Serializable]
    public class HeartBeatAction
    {
        public string OperatorId;
        public HeartBeatAction(string operatorId)
        {
            OperatorId = operatorId;
        }
    }
}
