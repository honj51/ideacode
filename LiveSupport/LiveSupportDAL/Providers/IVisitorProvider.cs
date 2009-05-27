using System;
using LiveSupport.LiveSupportModel;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IVisitorProvider
    {
        Visitor GetVisitorById(string visitorId);
        void NewVisitor(Visitor visitor);
    }
}
