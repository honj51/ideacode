using System;
using System.Collections.Generic;
using System.Text;

namespace LiveSupport.LiveSupportModel
{
    [Serializable]
    public class QuickResponseCategory
    {
        public int QuickId;
        public string Name;
        public string AccountId;
        public List<string> Responses;
    }
   
}
