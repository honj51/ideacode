using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Runtime.InteropServices;
using System.Drawing;
using Microsoft.Win32;
using System.Xml;
using System.Diagnostics;
using System.Collections;
using System.Threading;
using System.Drawing.Imaging;

namespace ZYC
{
    #region struct

    #region RECT

    [Serializable, StructLayout(LayoutKind.Sequential)]
    public struct RECT
    {
        public int left;
        public int top;
        public int right;
        public int bottom;
    }

    #endregion

    #endregion      


    #region API_const

    /// <summary>
    /// Windows API 常数
    /// </summary>
    public class CommonConst
    {
        public const int SM_CXSCREEN = 0;
        public const int SM_CYSCREEN = 1;

        public const int SRCCOPY = 0x00CC0020; /* dest = source                   */
        public const int SRCPAINT = 0x00EE0086; /* dest = source OR dest           */
        public const int SRCAND = 0x008800C6; /* dest = source AND dest          */
        public const int SRCINVERT = 0x00660046; /* dest = source XOR dest          */
        public const int SRCERASE = 0x00440328; /* dest = source AND (NOT dest )   */
        public const int NOTSRCCOPY = 0x00330008; /* dest = (NOT source)             */
        public const int NOTSRCERASE = 0x001100A6; /* dest = (NOT src) AND (NOT dest) */
        public const int MERGECOPY = 0x00C000CA; /* dest = (source AND pattern)     */
        public const int MERGEPAINT = 0x00BB0226; /* dest = (NOT source) OR dest     */
        public const int PATCOPY = 0x00F00021; /* dest = pattern                  */
        public const int PATPAINT = 0x00FB0A09; /* dest = DPSnoo                   */
        public const int PATINVERT = 0x005A0049; /* dest = pattern XOR dest         */
        public const int DSTINVERT = 0x00550009; /* dest = (NOT dest)               */
        public const int BLACKNESS = 0x00000042; /* dest = BLACK                    */
        public const int WHITENESS = 0x00FF0062; /* dest = WHITE                    */
        public const uint NOMIRRORBITMAP = 0x80000000; /* Do not Mirror the bitmap in this call */
        public const int CAPTUREBLT = 0x40000000;
    }

    #endregion


    #region WindowsAPI

    /// <summary>
    /// 封装Windows API类，可直接调用，和调用平常的方法相同（注：本类的方法调用不需要实利化，全部都是静态方法）
    /// </summary>
    public class WindowsAPI
    {
        public WindowsAPI()
        {
        }

        #region BitBlt

        [DllImportAttribute("gdi32.dll")]
        public static extern bool BitBlt(
            IntPtr hdcDest,   //目标设备的句柄  
            int nXDest,   //   目标对象的左上角的X坐标  
            int nYDest,   //   目标对象的左上角的X坐标  
            int nWidth,   //   目标对象的矩形的宽度  
            int nHeight,   //   目标对象的矩形的长度  
            IntPtr hdcSrc,   //   源设备的句柄  
            int nXSrc,   //   源对象的左上角的X坐标  
            int nYSrc,   //   源对象的左上角的X坐标  
            uint dwRop   //   光栅的操作值  
            );

        #endregion

        #region CreateDC

        [DllImportAttribute("gdi32.dll")]
        public static extern IntPtr CreateDC(
            string lpszDriver,   //   驱动名称  
            string lpszDevice,   //   设备名称  
            string lpszOutput,   //   无用，可以设定位"NULL"  
            IntPtr lpInitData   //   任意的打印机数据  
            );

        #endregion

        #region GetWindowRect

        [DllImport("user32.dll")]
        public static extern bool GetWindowRect(IntPtr handle, ref RECT lpRect);

        #endregion

        #region GetDesktopWindow

        [DllImport("user32.dll")]
        public static extern IntPtr GetDesktopWindow();

        #endregion

        #region ClipCursor

        [DllImport("user32.dll")]
        public static extern bool ClipCursor(ref RECT lpRect);

        #endregion

        #region GetDC

        [DllImport("user32.dll")]
        public static extern IntPtr GetDC(IntPtr hWnd);

        #endregion        

        #region SelectObject

        [DllImport("gdi32.dll")]
        public static extern IntPtr SelectObject(IntPtr hdc, IntPtr hgdiobj);

        #endregion
        
        #region DeleteObject

        [DllImport("gdi32.dll")]
        public static extern bool DeleteObject(IntPtr hObject);

        #endregion

        #region ReleaseDC

        [DllImport("user32.dll")]
        public static extern IntPtr ReleaseDC(IntPtr hWnd, IntPtr hDC);

        #endregion

        #region GetSystemMetrics

        [DllImport("user32.dll")]
        public static extern int GetSystemMetrics(int nIndex);

        #endregion

        #region CreateCompatibleBitmap

        [DllImport("gdi32.dll")]
        public static extern IntPtr CreateCompatibleBitmap(IntPtr hdc, int nWidth, int nHeight);

        #endregion

        #region CreateCompatibleDC

        [DllImport("gdi32.dll")]
        public static extern IntPtr CreateCompatibleDC(IntPtr hdc);

        #endregion

        #region DeleteDC

        [DllImport("gdi32.dll")]
        public static extern bool DeleteDC(IntPtr hdc);

        #endregion
    }
    #endregion


    #region APIMethod
    /// <summary>
    /// 基于Windows API 函数的方法
    /// </summary>
    public sealed partial class APIMethod
    {
        #region 构造函数

        /// <summary>
        /// 初始化APIMethod
        /// </summary>
        public APIMethod()
        {
        }

        public IntPtr DeskHwnd
        {
            get { return WindowsAPI.GetDesktopWindow(); }
        }

        #endregion        

        /// <summary>
        /// 截取当前屏幕的图片(在Windows Vista下可以避免屏幕截图出现白色点，在Windows XP下可以把自绘窗体放到截图中去)
        /// </summary>
        /// <returns></returns>
        public Bitmap GetScreenSnapShot()
        {
            int nWidth = WindowsAPI.GetSystemMetrics(CommonConst.SM_CXSCREEN);
            int nHeight = WindowsAPI.GetSystemMetrics(CommonConst.SM_CYSCREEN);
            IntPtr hDesktopDC = WindowsAPI.GetDC(this.DeskHwnd);
            IntPtr hBmpFileDC = WindowsAPI.CreateCompatibleDC(hDesktopDC);
            IntPtr hBmpFileBitmap = WindowsAPI.CreateCompatibleBitmap(hDesktopDC, nWidth, nHeight);
            IntPtr hOldBitmap = WindowsAPI.SelectObject(hBmpFileDC, hBmpFileBitmap);
            WindowsAPI.BitBlt(hBmpFileDC, 0, 0, nWidth, nHeight, hDesktopDC, 0, 0, CommonConst.SRCCOPY | CommonConst.CAPTUREBLT);
            WindowsAPI.SelectObject(hBmpFileDC, hOldBitmap);
            Bitmap bitmap = Bitmap.FromHbitmap(hBmpFileBitmap);
            WindowsAPI.DeleteDC(hBmpFileDC);
            WindowsAPI.DeleteObject(hBmpFileBitmap);
            return bitmap;
        }

        /// <summary>
        /// 释放鼠标移动
        /// </summary>
        public void ReleaseCursor()
        {
            RECT p = new RECT();
            WindowsAPI.GetWindowRect(WindowsAPI.GetDesktopWindow(), ref p);
            WindowsAPI.ClipCursor(ref p);
        }

        /// <summary>
        /// 从Image中提取指定起始位置、大小的部分
        /// </summary>
        /// <param name="BitmapSource"></param>
        /// <param name="X"></param>
        /// <param name="Y"></param>
        /// <param name="Width"></param>
        /// <param name="Height"></param>
        /// <returns></returns>
        public Bitmap PartBitmapB(Image BitmapSource, int X, int Y, int Width, int Height)
        {
            Bitmap BitmapDest = new Bitmap(Width, Height);//局部大小   
            Graphics g = Graphics.FromImage(BitmapDest);
            g.DrawImage(BitmapSource, new Rectangle(new Point(0, 0), new Size(Width, Height)), new Rectangle(new Point(X, Y), new Size(Width, Height)), GraphicsUnit.Pixel);
            return BitmapDest;
        }
    }

    #endregion    
}