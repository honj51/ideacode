﻿using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.OperatorConsole
{
    
    class TestFixture
    {
        private int count = 0;
        private const string AccountId = "100";
        private List<Operator> operators = new List<Operator>();
        private List<Visitor> visitors = new List<Visitor>();
        private const int operatorsCount = 10;
        private const int visitorsCount = 1;

        public TestFixture()
        {
            // 1. creat 10 operator
            for (int i = 0; i < operatorsCount; i++)
            {
                Operator o = new Operator();
                o.NickName = i.ToString() + "号客服";
                o.OperatorId = i.ToString();
                o.AccountId = AccountId;
                o.Status = i % 2 == 0? OperatorStatus.Idle:OperatorStatus.Offline;
                operators.Add(o);
            }

            for (int i = 0; i < visitorsCount; i++)
            {
                visitors.Add(NewVisitor(i));
            }
        }

        //public NewChangesCheckResult NewResult()
        //{
        //    NewChangesCheckResult result = new NewChangesCheckResult();
            
        //    //result.Messages = new Message[] { NewMessage(),NewMessage() };
        //    //result.NewVisitors = new Visitor[] { GetNewVisitor() };
        //    //result.Operators = GetAllOperators();
        //    //result.VisitSessionChange = new VisitSession[] { GetVisitSessionChanges() };

        //    count++;
        //    return result;
        //}

        private VisitSession GetVisitSessionChanges()
        {
            if (count % 10 == 0)
            {
                Random r = new Random();
                int index = r.Next(0, visitors.Count - 1);
                Visitor v = visitors[index];
                v.CurrentSession.Status = getNextVisitSessionStatus(v.CurrentSession.Status);
                return v.CurrentSession;
            }
            else
                return null;
        }

        private VisitSessionStatus getNextVisitSessionStatus(VisitSessionStatus visitSessionStatus)
        {
            switch (visitSessionStatus)
            {
                case VisitSessionStatus.Visiting:
                    return VisitSessionStatus.ChatRequesting;
                case VisitSessionStatus.ChatRequesting:
                    return VisitSessionStatus.Chatting;
                case VisitSessionStatus.Chatting:
                    return VisitSessionStatus.Leave;
                case VisitSessionStatus.Leave:
                    return VisitSessionStatus.Visiting;

                default:
                    return VisitSessionStatus.Visiting;
            }
        }

        private Visitor GetNewVisitor()
        {
            if (count < visitors.Count)
            {
                // return all 
                return visitors[count];
            }
            else if (count % 50 == 0)
            {
                return NewVisitor(visitors.Count);
            }
            else
                return null;
        }

        
        private Operator[] GetAllOperators()
        {
            if (count > 20)
            {
                foreach (var item in operators)
                {
                    item.Status = nextOperatorStatus(item.Status);
                }
            }
            return operators.ToArray();
        }

        private OperatorStatus nextOperatorStatus(OperatorStatus operatorStatus)
        {
            switch (operatorStatus)
            {
                case OperatorStatus.Idle:
                    return OperatorStatus.Chatting;
                case OperatorStatus.Chatting:
                    return OperatorStatus.BeRightBack;
                case OperatorStatus.BeRightBack:
                    return OperatorStatus.Away;
                case OperatorStatus.Away:
                    return OperatorStatus.Offline;
                case OperatorStatus.Offline:
                    return OperatorStatus.Idle;
                default:
                    return OperatorStatus.Offline;
            }
        }

        private Visitor NewVisitor(int index)
        {
            Visitor v = new Visitor();
            v.CurrentSession = new VisitSession();
            v.CurrentSession.PageRequestCount++;
            v.AccountId = AccountId;
            v.Name = "访客" + index;
            v.VisitCount = 100 - index;
            v.VisitorId = Guid.NewGuid().ToString();
            v.CurrentSession.IP = "192.168.1." + index;
            v.CurrentSession.DomainRequested = "sina.com.cn";
            v.CurrentSession.Browser = index % 2 == 0 ? "IE" : "FireFox";
            v.CurrentSession.Status = VisitSessionStatus.Visiting;
            v.CurrentSession.SessionId = Guid.NewGuid().ToString();
            return v;
        }

        private Message NewMessage()
        {
            Random r = new Random();
            int index = r.Next(0, visitors.Count - 1);
            
            Message m = new Message();
            m.Type = MessageType.ChatMessage_VistorToOperator;
            m.ChatId = visitors[index].CurrentSession.SessionId;
            m.Source = "访客" + index;
            m.SentDate = DateTime.Now;
            m.Text = Guid.NewGuid().ToString();
            return m;
        }
    }
}
 