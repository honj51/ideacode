using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IContent
    {
        int Add(Content content);
        List<Content> GetList();
        int UDel(int nId);
        int UAddRe(Content content);
    }
}
