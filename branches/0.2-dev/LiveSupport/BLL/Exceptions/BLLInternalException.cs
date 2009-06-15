using System;
using System.Collections.Generic;
using System.Text;

namespace LiveSupport.BLL.Exceptions
{
    [global::System.Serializable]
    public class BLLInternalException : Exception
    {
        //
        // For guidelines regarding the creation of new exception types, see
        //    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/cpconerrorraisinghandlingguidelines.asp
        // and
        //    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dncscol/html/csharp07192001.asp
        //

        public BLLInternalException() { }
        public BLLInternalException(string message) : base(message) { }
        public BLLInternalException(string message, Exception inner) : base(message, inner) { }
        protected BLLInternalException(
          System.Runtime.Serialization.SerializationInfo info,
          System.Runtime.Serialization.StreamingContext context)
            : base(info, context) { }
    }
}
