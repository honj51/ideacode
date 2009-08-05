using System;
using System.Collections.Generic;
using System.Text;

namespace OperatorServiceInterface
{
    [Serializable]
    public class DataPacket
    {
        public PacketCode PacketCode;
        public DateTime SentTime;
        public byte[] Data;
    }

    public enum PacketCode
    {
        Action, Event
    }
}
