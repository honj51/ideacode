using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace OperatorServiceInterface
{
    public interface IOperatorServer : IOperatorServerEvents
    {  
        void Login(string accountName, string operatorName, string password);
        string Hello(string name);
    }

    
}
