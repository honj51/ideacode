using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.OperatorConsole.LiveChatWS;

namespace LiveSupport.OperatorConsole
{
    class Common
    {
        public static string GetOperatorsStatusText(OperatorStatus os)
        {
            string status;
            switch (os)
            {
                case OperatorStatus.Idle:
                    status = "空闲";
                    break;
                case OperatorStatus.Away:
                    status = "离开";
                    break;
                case OperatorStatus.Chatting:
                    status = "对话中";
                    break;
                case OperatorStatus.BeRightBack:
                    status = "一会回来";
                    break;
                case OperatorStatus.Offline:
                    status = "离线";
                    break;
                default:
                    status = "离线";
                    break;

            }
            return status;

        }

        public static string GetVisitSessionStatusText(VisitSessionStatus s)
        {
            string status;
            switch (s)
            {
                case VisitSessionStatus.Visiting:
                    status = "浏览中";
                    break;
                case VisitSessionStatus.ChatRequesting:
                    status = "请求对话中";
                    break;
                case VisitSessionStatus.Chatting:
                    status = "对话中";
                    break;
                case VisitSessionStatus.Leave:
                    status = "离开";
                    break;
                default:
                    status = "离开";
                    break;
            }
            return status;
        }

        public static string GetBrowserShortName(string browser)
        {
            string shortName = string.Empty;
            if (browser.Contains("MSIE"))
            {
                shortName = "IE";
            }
            else if (browser.Contains("Firefox"))
            {
                shortName = "FF";
            }
            else
            {
                shortName = "其他";
            }
            return shortName;
        }
    }
}
