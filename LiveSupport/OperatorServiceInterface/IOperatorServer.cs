using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace OperatorServiceInterface
{
    public interface IOperatorServer : IOperatorServerEvents
    {  
        Operator Login(string accountNumber, string operatorName, string password);
        //void Logout(string OperatorId, string OperatorSession);
        void Logout();
        List<Visitor> GetAllVisitors(string accountId);/// 取所有该公司的在线客服
        //NewChangesCheckResult CheckNewChanges(string OperatorId, string OperatorSession, NewChangesCheckResult check);
        void UploadFile(byte[] bs, string fileName, string chatId);   /// 上传文件
        //{
        //    string saveFilePath = Server.MapPath("~/UploadFile/" + chatId + "/");
        //    OperatorService.UploadFile(bs,fileName,chatId, saveFilePath);
        //}
        bool SendMessage(Message msg); /// 客服发送一条信息给访客
        //{
            
        //    if (msg.Type == MessageType.ChatMessage_OperatorToVisitor)
        //    {
        //        ChatService.SendMessage(msg);            
        //        return true;
        //    }
        //    else
        //        return false;
        //}
        int ChangePassword(string OperatorId, string oldPassword, string newPassword);
        //{
        //    return OperatorService.ChangPassword(string OperatorId, oldPassword, newPassword);
        //}
        int ResetOperatorPassword(string OperatorId ,string loginName);    /// 重置座席密码
        //{
        //    return OperatorService.ResetOperatorPassword(Authentication.OperatorId, loginName);
        //}
        bool CloseChat(string chatId,string nickName);    /// 关闭对话
        //{
        //    return ChatService.CloseChat(chatId, OperatorService.GetOperatorById(Authentication.OperatorId).NickName);
        //}
        /// <summary>
        /// 获取聊天历史记录
        /// </summary>
        /// <param name="visitorId">会话ID</param>
        /// <param name="begin">开始时间</param>
        /// <param name="end">结束时间</param>
        /// <returns>消息集合</returns>
        List<Message> GetHistoryChatMessage(string visitorId, DateTime begin, DateTime end);
      //{
      //      List<Message> list = new List<Message>();
      //      List<Chat> chats = ChatService.GetHistoryChatByVisitorId(visitorId);

      //      foreach (Chat item in chats)
      //      {
      //          if (item.CreateTime > begin && item.CreateTime < end)
      //          {
      //              list.AddRange(MessageService.GetMessagesByChatId(item.ChatId));
      //          }
      //      }
      //       return list;
      //}
    /// <summary>
    /// 获取网站页面访问历史记录
    /// </summary>
    /// <param name="visitorId">访客ID</param>
    /// <param name="begin">开始时间</param>
    /// <param name="end"> 结束时间</param>
    /// <returns>Pagerequest集合</returns>
     List<PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end);
    //{
    //    List<VisitSession> li = VisitSessionService.GetHistoryVisitSessionByVisitorId(visitorId);
    //    List<PageRequest> list = new List<PageRequest>();
    //    foreach(VisitSession m in li)
    //    {
    //       list.AddRange(PageRequestService.GetHistoryPageRequests(m.SessionId, begin, end));
    //    }
    //    return list;
    //}
    /// <summary>
    /// 接受对话请求
    /// </summary>
    /// <param name="chatId"></param>
    /// <returns></returns>
    int AcceptChatRequest(string operatorId,string chatId);
    //{
    //    return ChatService.AcceptChatRequest(Authentication.OperatorId, chatId);
    //}    /// <summary>
    /// 主动邀请对话
    /// </summary>
    /// <param name="visitorId"></param>
    /// <returns></returns>
     Chat InviteChat( string operatorId,string visitorId);
    //{
    //   return ChatService.OperatorRequestChat(Authentication.OperatorId, visitorId);
    //}
    /// <summary>
    /// 系统信息提示
    /// </summary>
    /// <param name="versionNumber"></param>
    /// <returns></returns>

     List<SystemAdvertise> GetSystemAdvertise(string versionNumber);

    void SaveQuickResponse(string operatorId,List<QuickResponseCategory> response);
   
    List<QuickResponseCategory> GetQuickResponse(string operateorId);

    }

    
}
