using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;
using System.Drawing;
using System.IO;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.OperatorConsole
{
    public delegate void UpdateUIDelegate(object obj);

    class Common
    {
        [StructLayout(LayoutKind.Sequential)]
        public struct SHFILEINFO
        {
            public IntPtr hIcon;
            public IntPtr iIcon;
            public uint dwAttributes;
            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 260)]
            public string szDisplayName;
            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 80)]
            public string szTypeName;
        }
        /// <summary>
        /// 返回系统设置的图标
        /// </summary>
        /// <param name="pszPath">文件路径 如果为""  返回文件夹的</param>
        /// <param name="dwFileAttributes">0</param>
        /// <param name="psfi">结构体</param>
        /// <param name="cbSizeFileInfo">结构体大小</param>
        /// <param name="uFlags">枚举类型</param>
        /// <returns>-1失败</returns>
        [DllImport("shell32.dll")]
        public static extern IntPtr SHGetFileInfo(string pszPath, uint dwFileAttributes, ref   SHFILEINFO psfi, uint cbSizeFileInfo, uint uFlags);
        public enum SHGFI
        {
            SHGFI_ICON = 0x100,
            SHGFI_LARGEICON = 0x0,
            SHGFI_USEFILEATTRIBUTES = 0x10
        }
        /// <summary>
        /// 获取文件图标 zgke@sina.com qq:116149
        /// </summary>
        /// <param name="p_Path">文件全路径</param>
        /// <returns>图标</returns>
        public static Icon GetFileIcon(string p_Path)
        {
            SHFILEINFO _SHFILEINFO = new SHFILEINFO();
            IntPtr _IconIntPtr = SHGetFileInfo(p_Path, 0, ref _SHFILEINFO, (uint)Marshal.SizeOf(_SHFILEINFO), (uint)(SHGFI.SHGFI_ICON | SHGFI.SHGFI_LARGEICON | SHGFI.SHGFI_USEFILEATTRIBUTES));
            if (_IconIntPtr.Equals(IntPtr.Zero)) return null;
            Icon _Icon = System.Drawing.Icon.FromHandle(_SHFILEINFO.hIcon);
            return _Icon;
        }
        /// <summary>
        /// 获取文件夹图标  zgke@sina.com qq:116149
        /// </summary>
        /// <returns>图标</returns>
        public static Icon GetDirectoryIcon()
        {
            SHFILEINFO _SHFILEINFO = new SHFILEINFO();
            IntPtr _IconIntPtr = SHGetFileInfo(@"", 0, ref _SHFILEINFO, (uint)Marshal.SizeOf(_SHFILEINFO), (uint)(SHGFI.SHGFI_ICON | SHGFI.SHGFI_LARGEICON));
            if (_IconIntPtr.Equals(IntPtr.Zero)) return null;
            Icon _Icon = System.Drawing.Icon.FromHandle(_SHFILEINFO.hIcon);
            return _Icon;
        }
        /// <summary>
        /// 判断客服状态
        /// </summary>
        /// <param name="os"></param>
        /// <returns></returns>
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
                case OperatorStatus.InviteChat:
                    status = "对话邀请中";
                    break;
                default:
                    status = "离线";
                    break;

            }
            return status;

        }
        /// <summary>
        /// 判断浏览状态
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
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
        /// <summary>
        /// 判断浏览器类型
        /// </summary>
        /// <param name="browser"></param>
        /// <returns></returns>
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
        /// <summary>
        /// 记算在线时间
        /// </summary>
        /// <param name="DateTime1">加载时间</param>
        /// <param name="DateTime2">当前时间</param>
        /// <returns>在线时间</returns>
        public static string dateDiff(DateTime DateTime1, DateTime DateTime2)
        {
            string dateDiff = null;

            TimeSpan ts1 = new TimeSpan(DateTime1.Ticks);
            TimeSpan ts2 = new TimeSpan(DateTime2.Ticks);
            TimeSpan ts = ts1.Subtract(ts2).Duration();
            dateDiff = ts.Days.ToString() + "天"
                + ts.Hours.ToString() + "小时"
                + ts.Minutes.ToString() + "分钟"
                + ts.Seconds.ToString() + "秒";

            return dateDiff;
        }


        public static string GetSearchEngineName(string url)
        {
            
            if (string.IsNullOrEmpty(url))
            {
                return "访客输入网址";
            }
            if (url.Contains("google"))
            {
                return "谷歌";
            }
            else if (url.Contains("baidu"))
            {
                return "百度";
            }
            else if (url.Contains("sogou"))
            {
                return "搜狗";
            }
            else if (url.Contains("soso"))
            {
                return "腾讯搜搜";
            }
            else if (url.Contains("bing"))
            {
                return "微软Bing";
            }
            else if (url.Contains("yahoo"))
            {
                return "雅虎";
            }
            else if (url.Contains("sina"))
            {
                return "新浪";
            }
            else if (url.Contains("sohu"))
            {
                return "搜狐";
            }
            else if (url.Contains("163"))
            {
                return "网易";
            }
            else
            {
                return "来自"+url;
            }
        }

        public static object Convert(object obj)
        {
            if (obj is LiveSupport.OperatorConsole.LiveChatWS.Visitor)
            {
                LiveSupport.OperatorConsole.LiveChatWS.Visitor v1 = obj as LiveSupport.OperatorConsole.LiveChatWS.Visitor;

                LiveSupportModel.Visitor v2 = new LiveSupport.LiveSupportModel.Visitor();
                v2.AccountId = v1.AccountId;
                v2.Company = v1.Company;
                v2.Email = v1.Email;
                v2.IsVIP = v1.IsVIP;
                v2.Name = v1.Name;
                v2.Remark = v1.Remark;
                v2.VisitCount = v1.VisitCount;
                v2.VisitorId = v1.VisitorId;
                v2.CurrentSession = Convert(v1.CurrentSession) as LiveSupportModel.VisitSession;
                return v2;
            }
            else if (obj is LiveSupport.OperatorConsole.LiveChatWS.VisitSession)
            {
                LiveSupport.OperatorConsole.LiveChatWS.VisitSession v1 = obj as LiveSupport.OperatorConsole.LiveChatWS.VisitSession;
                LiveSupportModel.VisitSession v2 = new LiveSupport.LiveSupportModel.VisitSession();
                v2.Browser = v1.Browser;
                v2.ChatingTime = v1.ChatingTime;
                v2.ChatRequestTime = v1.ChatRequestTime;
                v2.ChattingDuring = v1.ChattingDuring;
                v2.DomainRequested = v1.DomainRequested;
                v2.IP = v1.IP;
                v2.LeaveTime = v1.LeaveTime;
                v2.Location = v1.Location;
                v2.OperatorId = v1.OperatorId;
                v2.PageRequestCount = v1.PageRequestCount;
                v2.PageRequested = v1.PageRequested;
                v2.SessionId = v1.SessionId;
                v2.Referrer = v1.Referrer;
                v2.Status = (LiveSupportModel.VisitSessionStatus)Enum.Parse(typeof(LiveSupportModel.VisitSessionStatus), v1.Status.ToString());
                v2.VisitingTime = v1.VisitingTime;
                v2.VisitorId = v1.VisitorId;
                v2.WaitingDuring = v1.WaitingDuring;
                return v2;
            }
            else if (obj is LiveSupport.OperatorConsole.LiveChatWS.Operator)
            {
                LiveSupport.OperatorConsole.LiveChatWS.Operator v1 = obj as LiveSupport.OperatorConsole.LiveChatWS.Operator;
                LiveSupportModel.Operator v2 = new LiveSupport.LiveSupportModel.Operator();
                v2.AccountId = v1.AccountId;
                v2.AVChatStatus = v1.AVChatStatus;
                v2.Email = v1.Email;
                v2.HeartBeatTime = v1.HeartBeatTime;
                v2.IsAdmin = v1.IsAdmin;
                v2.LoginName = v1.LoginName;
                v2.NickName = v1.NickName;
                v2.OperatorId = v1.OperatorId;
                v2.OperatorSession = v1.OperatorSession;
                v2.Password = v1.Password;
                v2.Status = (LiveSupportModel.OperatorStatus)Enum.Parse(typeof(LiveSupportModel.OperatorStatus), v1.Status.ToString());
                return v2;
            }
            else if (obj is LiveSupportModel.Message)
            {
                LiveSupportModel.Message v1 = obj as  LiveSupport.LiveSupportModel.Message;
                LiveSupport.OperatorConsole.LiveChatWS.Message v2 = new LiveSupport.OperatorConsole.LiveChatWS.Message();
                v2.ChatId = v1.ChatId;
                v2.Destination = v1.Destination;
                v2.MessageId = v1.MessageId;
                v2.SentDate = v1.SentDate;
                v2.Source = v1.Source;
                v2.Text = v1.Text;
                v2.Type = (LiveSupport.OperatorConsole.LiveChatWS.MessageType)Enum.Parse(typeof(LiveSupport.OperatorConsole.LiveChatWS.MessageType), v1.Type.ToString());
                return v2;
            }
            else if (obj is LiveSupport.OperatorConsole.LiveChatWS.Chat)
            {
                LiveSupport.OperatorConsole.LiveChatWS.Chat v1 = obj as LiveSupport.OperatorConsole.LiveChatWS.Chat;
                LiveSupportModel.Chat v2 = new LiveSupport.LiveSupportModel.Chat();
                v2.ChatId = v1.ChatId;
                v2.AcceptTime = v1.AcceptTime;
                v2.AccountId = v1.AccountId;
                v2.CloseBy = v1.CloseBy;
                v2.CloseTime = v1.CloseTime;
                v2.CreateBy = v1.CreateBy;
                v2.CreateTime = v1.CreateTime;
                v2.IsInviteByOperator = v1.IsInviteByOperator;
                v2.LastCheckTime = v1.LastCheckTime;
                v2.OperatorId = v1.OperatorId;
                v2.Status = (LiveSupportModel.ChatStatus)Enum.Parse(typeof(LiveSupportModel.ChatStatus), v1.Status.ToString());
                v2.VisitorId = v1.VisitorId;
                return v2;
            }
            else if (obj is LiveSupport.OperatorConsole.LiveChatWS.LeaveWord)
            {
                LiveSupport.OperatorConsole.LiveChatWS.LeaveWord v1 = obj as LiveSupport.OperatorConsole.LiveChatWS.LeaveWord;
                LiveSupportModel.LeaveWord v2 = new LiveSupport.LiveSupportModel.LeaveWord();
               // v2.Account = v1.Account;
                v2.CallerDate = v1.CallerDate;
                v2.CallerName = v1.CallerName;
                v2.Content = v1.Content;
                v2.DomainName = v1.DomainName;
                v2.Email = v1.Email;
                v2.Id = v1.Id;
                v2.Ip = v1.Ip;
                v2.IsReplied = v1.IsReplied;
                v2.IsSend = v1.IsSend;
                v2.OperatorName = v1.OperatorName;
                v2.Phone = v1.Phone;
                 v2.Senddate = v1.Senddate;
                 v2.Subject = v1.Subject;
                 return v2;
            }
            else if (obj is LiveSupport.OperatorConsole.LiveChatWS.Account)
            {
                LiveSupport.OperatorConsole.LiveChatWS.Account v1 = obj as LiveSupport.OperatorConsole.LiveChatWS.Account;
                LiveSupportModel.Account v2 = new LiveSupport.LiveSupportModel.Account();
                v2.AccountId = v1.AccountId;
                v2.AccountNumber = v1.AccountNumber;
                v2.City = v1.City;
                v2.CompanyName = v1.CompanyName;
                v2.ContactName = v1.ContactName;
                v2.Domain = v1.Domain;
                v2.Email = v1.Email;
                v2.Industry = v1.Industry;
                v2.OperatorCount = v1.OperatorCount;
                v2.PaymentId = v1.PaymentId;
                v2.Phone = v1.Phone;
                v2.Province = v1.Province;
                v2.RegisterDate = v1.RegisterDate;
                v2.Remark = v1.Remark;
                v2.Url = v1.Url;
                return v2;
            }
            else if (obj is LiveSupport.OperatorConsole.LiveChatWS.PageRequest)
            {
             LiveSupport.OperatorConsole.LiveChatWS.PageRequest v1 = obj as LiveSupport.OperatorConsole.LiveChatWS.PageRequest;
                LiveSupportModel.PageRequest v2 = new LiveSupport.LiveSupportModel.PageRequest();
                v2.AccountId = v1.AccountId;
                v2.Page = v1.Page;
                v2.Referrer = v1.Referrer;
                v2.RequestTime = v1.RequestTime;
                v2.SessionId = v1.SessionId;
                return v2;   
            }
            else if (obj is LiveSupport.OperatorConsole.LiveChatWS.QuickResponseCategory)
            {
                LiveSupport.OperatorConsole.LiveChatWS.QuickResponseCategory v1 = obj as LiveSupport.OperatorConsole.LiveChatWS.QuickResponseCategory;
                LiveSupportModel.QuickResponseCategory v2 = new LiveSupport.LiveSupportModel.QuickResponseCategory();
                v2.AccountId = v1.AccountId;
                v2.Name = v1.Name;
                v2.QuickId = v1.QuickId;
                v2.Responses =new List<string>(v1.Responses);
                return v2;  
            }
            else if (obj is LiveSupport.OperatorConsole.LiveChatWS.Message)
            {
                LiveSupport.OperatorConsole.LiveChatWS.Message v1 = obj as LiveSupport.OperatorConsole.LiveChatWS.Message;
                LiveSupportModel.Message v2 = new LiveSupport.LiveSupportModel.Message();
                v2.ChatId = v1.ChatId;
                v2.Destination = v1.Destination;
                v2.MessageId = v1.MessageId;
                v2.SentDate = v1.SentDate;
                v2.Source = v1.Source;
                v2.Text = v1.Text;
                v2.Type = (LiveSupport.LiveSupportModel.MessageType)Enum.Parse(typeof(LiveSupport.LiveSupportModel.MessageType), v1.Type.ToString());
                return v2;
            }
            return null;
        }
    }

}
