using System;
using System.Collections.Generic;
using System.Text;
using Rhino.Mocks;
using System.Diagnostics;
using BLLTest;
using LiveSupport.LiveSupportModel;
using System.Threading;

namespace LiveChatTest
{
    class Program
    {
        static void Main(string[] args)
        {
            Trace.WriteLine("Main Start");

            int i = 0;
            while (true)
            {
                Trace.WriteLine(i);
                Thread.Sleep(1000);
                i++;
            }
            //Account a = TestTool.CreateNewAccount();
            //AccountService.AddAccount(a);
            //AccountServiceTest t = new AccountServiceTest();
            //t.TestAddAccount();
            //t.testGetAccountById();
            Trace.WriteLine("Main End");
        }
    }
}
