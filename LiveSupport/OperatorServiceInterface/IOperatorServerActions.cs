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
    }

    [Serializable]
    public class LogoutAction
    {
        public string OperatorId;
    }
}
