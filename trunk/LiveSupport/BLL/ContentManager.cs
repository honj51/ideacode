using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportDAL.Providers;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.BLL
{
    public class ContentManager
    {
        IContent icontent = new SqlContentProvider();

        #region IContent 成员

        public bool Add(Content content)
        {
            int i = 0;
            i = icontent.Add(content);
            if (i != 0)
                return true;
            else
                return false;
        }

        public List<Content> GetList()
        {
            return icontent.GetList();
        }

        public bool UDel(int nId)
        {
            int i = 0;
            i = icontent.UDel(nId);
            if (i != 0)
                return true;
            else
                return false;
        }

        public bool UAddRe(Content content)
        {
            int i = 0;
            i=icontent.UAddRe(content);
            if (i != 0)
                return true;
            else
                return false;
        }

        #endregion

    }
}
