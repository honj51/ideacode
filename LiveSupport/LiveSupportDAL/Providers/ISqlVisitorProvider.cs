using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface ISqlVisitorProvider
    {
        LiveSupport.LiveSupportModel.Visitor GetVisitorById(string visitorId);
        void NewVisitor(LiveSupport.LiveSupportModel.Visitor visitor);
    }
}
