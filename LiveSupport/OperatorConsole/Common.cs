﻿using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.Runtime.InteropServices;
using System.Drawing;
using System.IO;

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

    }

}
