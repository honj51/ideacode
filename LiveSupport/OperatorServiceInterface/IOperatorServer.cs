using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace OperatorServiceInterface
{
    public interface IOperatorServer : IOperatorServerEvents
    {
        #region Client Interface
        Operator Login(string accountNumber, string operatorName, string password);   /// 登陆
        void Logout(); /// 注销
        List<Visitor> GetAllVisitors(string accountId);   /// 取所有该公司的在线客服
        bool IsTyping(string chatId, bool isOperator);
        void UploadFile(byte[] bs, string fileName, string chatId);   /// 上传文件
        bool SendMessage(Message msg); /// 客服发送一条信息给访客
        int ChangePassword(string oldPassword, string newPassword);    /// 修改密码
        int ResetOperatorPassword(string loginName);   /// 重置座席密码
        bool CloseChat(string chatId); /// 关闭对话
        List<Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end);  /// 获取聊天历史记录
        List<PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end);/// 获取网站页面访问历史记录
        int AcceptChatRequest(string chatId); /// 接受对话请求
        Chat InviteChat(string visitorId); /// 主动邀请对话
        List<SystemAdvertise> GetSystemAdvertise(string versionNumber);/// 系统信息提示
        void SaveQuickResponse(List<QuickResponseCategory> response);
        List<QuickResponseCategory> GetQuickResponse();
        #endregion

        #region Management Interface
        void Start();
        void Stop();
        #endregion
    }


}
