use master
go
if exists (select * from sysdatabases where name='LiveSupport')
    drop database LiveSupport
/*-0---创建MyShop数据库----*/
create database LiveSupport
on
(
  name='LiveSupport_data',--主数据文件的逻辑名
  filename='C:\Program Files\Microsoft SQL Server\MSSQL.2\MSSQL\Data\LiveSupport_data.mdf',--主数据文件的物理名
  size=10mb,--初始大小
  filegrowth=20%--增长率
)
log on
(
  name='bbsDB_log',
  filename='C:\Program Files\Microsoft SQL Server\MSSQL.2\MSSQL\Data\LiveSupport_log.ldf',
  size=1mb,
  maxsize=20mb,
  filegrowth=10%
)
go
/*--1--创建用户表Users----*/
use LiveSupport
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveChat_Visitor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveChat_Visitor](
	[VisitorId] [varchar](50) NOT NULL,
	[AccountId] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[VisitCount] [int] NULL,
	[Company] [varchar](50) NULL,
	[Remark] [varchar](50) NULL,
	[IsVIP] [bit] NULL,
	[CurrentSessionId] [varchar](50) NULL,
 CONSTRAINT [PK_LiveChat_Visitor] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveSupport_Account]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveSupport_Account](
	[AccountId] [varchar](50) NOT NULL,
	[AccountNumber] [varchar](50) NULL,
	[CompanyName] [varchar](100) NULL,
	[Industry] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ContactName] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[URL] [varchar](256) NULL,
	[Domain] [varchar](50) NULL,
	[OperatorCount] [int] NULL,
	[Province] [varchar](20) NULL,
	[City] [varchar](20) NULL CONSTRAINT [DF_LiveSupport_Accounts_RegisterDate]  DEFAULT (getdate()),
	[RegisterDate] [datetime] NULL,
	[Remark] [text] NULL,
	[PaymentId] [varchar](50) NULL,
 CONSTRAINT [PK_LiveSupport_Accounts_1] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveSupport_Serivces]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveSupport_Serivces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[OperatorsAllowed] [int] NOT NULL,
	[During] [int] NOT NULL,
	[Charge] [int] NOT NULL,
 CONSTRAINT [PK_LiveSupport_Serivces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveSupport_Content]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveSupport_Content](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserEmail] [varchar](50) NULL,
	[UserQQ] [varchar](50) NULL,
	[UserUrl] [varchar](225) NULL,
	[UserIp] [varchar](50) NULL,
	[FaceUrl] [varchar](50) NULL,
	[PicUrl] [varchar](50) NULL,
	[AddTime] [datetime] NULL,
	[Content] [text] NULL,
	[Reply] [text] NULL,
	[IsHid] [int] NULL,
	[IsReply] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Portal_Province ]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Portal_Province ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Sheng] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebSite]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebSite](
	[DomainName] [varchar](50) NOT NULL,
	[CompanyName] [varchar](100) NULL,
	[RegisterId] [varchar](50) NOT NULL,
	[IconStyle] [text] NOT NULL,
	[InviteStyle] [text] NOT NULL,
	[ChatStyle] [text] NOT NULL,
	[IcoLocation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_WebSite] PRIMARY KEY CLUSTERED 
(
	[DomainName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WebSite', N'COLUMN',N'DomainName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'域名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'DomainName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WebSite', N'COLUMN',N'RegisterId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'RegisterId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WebSite', N'COLUMN',N'IconStyle'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客服样式(图片)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'IconStyle'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WebSite', N'COLUMN',N'InviteStyle'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主动邀请样式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'InviteStyle'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WebSite', N'COLUMN',N'ChatStyle'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'聊天样式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'ChatStyle'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WebSite', N'COLUMN',N'IcoLocation'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示的位置样式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'IcoLocation'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveChat_Chat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveChat_Chat](
	[ChatId] [varchar](50) NOT NULL,
	[CreateBy] [varchar](50) NOT NULL,
	[CloseBy] [varchar](50) NULL,
	[CreateTime] [datetime] NOT NULL,
	[AcceptTime] [datetime] NULL,
	[CloseTime] [datetime] NULL,
	[AccountId] [varchar](50) NOT NULL,
	[VisitorId] [varchar](50) NULL,
	[OperatorId] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED 
(
	[ChatId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveChat_PageRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveChat_PageRequest](
	[AccountId] [varchar](50) NOT NULL,
	[SessionId] [varchar](50) NULL,
	[Page] [text] NULL,
	[RequestTime] [datetime] NULL,
	[Referrer] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveChat_VisitSession]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveChat_VisitSession](
	[SessionId] [varchar](50) NOT NULL,
	[VisitorId] [varchar](50) NOT NULL,
	[IP] [varchar](30) NULL,
	[Browser] [varchar](300) NULL,
	[Location] [varchar](50) NULL,
	[VisitingTime] [datetime] NULL,
	[DomainRequested] [varchar](50) NULL,
	[OperatorId] [varchar](50) NULL CONSTRAINT [DF_LiveChat_VisitSession_Operator]  DEFAULT ((-1)),
	[Referrer] [varchar](256) NULL,
	[LeaveTime] [datetime] NULL,
	[ChatRequestTime] [datetime] NULL,
	[ChatingTime] [datetime] NULL,
	[WaitingDuring] [datetime] NULL,
	[ChattingDuring] [datetime] NULL,
	[PageRequestCount] [int] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_LiveChat_VisitSession] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveChat_Message]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveChat_Message](
	[MessageId] [varchar](50) NOT NULL,
	[ChatID] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Destination] [varchar](50) NOT NULL,
	[Text] [text] NOT NULL,
	[SentDate] [bigint] NOT NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveSupport_LeaveWord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveSupport_LeaveWord](
	[Id] [varchar](50) NOT NULL,
	[CallerName] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Subject] [varchar](50) NULL,
	[Content] [text] NULL,
	[IP] [varchar](50) NULL,
	[CallerDate] [datetime] NULL,
	[Senddate] [datetime] NULL,
	[OperatorName] [varchar](50) NULL,
	[AccountId] [varchar](50) NULL,
	[IsReplied] [bit] NULL,
	[DomainName] [varchar](50) NULL,
 CONSTRAINT [PK_LiveSupport_ LeaveWord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LiveSupport_LeaveWord', N'COLUMN',N'CallerName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问者名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiveSupport_LeaveWord', @level2type=N'COLUMN',@level2name=N'CallerName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LiveSupport_LeaveWord', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiveSupport_LeaveWord', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LiveSupport_LeaveWord', N'COLUMN',N'Phone'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''电话''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiveSupport_LeaveWord', @level2type=N'COLUMN',@level2name=N'Phone'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LiveSupport_LeaveWord', N'COLUMN',N'Subject'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiveSupport_LeaveWord', @level2type=N'COLUMN',@level2name=N'Subject'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LiveSupport_LeaveWord', N'COLUMN',N'Content'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiveSupport_LeaveWord', @level2type=N'COLUMN',@level2name=N'Content'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LiveSupport_LeaveWord', N'COLUMN',N'IP'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiveSupport_LeaveWord', @level2type=N'COLUMN',@level2name=N'IP'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LiveSupport_LeaveWord', N'COLUMN',N'CallerDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiveSupport_LeaveWord', @level2type=N'COLUMN',@level2name=N'CallerDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LiveSupport_LeaveWord', N'COLUMN',N'Senddate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiveSupport_LeaveWord', @level2type=N'COLUMN',@level2name=N'Senddate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LiveSupport_LeaveWord', N'COLUMN',N'OperatorName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复客服名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiveSupport_LeaveWord', @level2type=N'COLUMN',@level2name=N'OperatorName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LiveSupport_LeaveWord', N'COLUMN',N'AccountId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiveSupport_LeaveWord', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveSupport_Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveSupport_Department](
	[DepartmentId] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
	[AccountId] [varchar](50) NOT NULL,
	[IsDefault] [bit] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_LiveSupportDepartment] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveSupport_ClientGrounp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveSupport_ClientGrounp](
	[Id] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[accountId] [varchar](50) NOT NULL,
	[addDate] [datetime] NULL,
 CONSTRAINT [PK_LiveSupport_ClientGrounp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveChat_QuickResponse]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveChat_QuickResponse](
	[QuickId] [int] IDENTITY(1,1) NOT NULL,
	[DomainName] [varchar](100) NULL,
	[AccountId] [varchar](50) NOT NULL,
	[OperatorId] [varchar](50) NULL,
	[Submenu] [varchar](50) NOT NULL,
	[Node] [text] NULL,
 CONSTRAINT [PK__LiveChat_QuickRe__0C85DE4D] PRIMARY KEY CLUSTERED 
(
	[QuickId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveChat_Operator]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveChat_Operator](
	[OperatorId] [varchar](50) NOT NULL,
	[AccountId] [varchar](50) NOT NULL,
	[LoginName] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[NickName] [varchar](30) NULL,
	[Email] [varchar](30) NULL,
	[IsAdmin] [bit] NULL,
	[Status] [varchar](30) NULL,
	[AVChatStatus] [varchar](30) NULL,
	[DepartmentId] [varchar](50) NULL,
 CONSTRAINT [PK_Operator] PRIMARY KEY CLUSTERED 
(
	[OperatorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveSupport_Payment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveSupport_Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [varchar](50) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[PayDate] [datetime] NOT NULL,
	[ExpireDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LiveSupport_Payment_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Portal_City]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Portal_City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[Pid] [int] NOT NULL,
 CONSTRAINT [PK_Shi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveSupport_Client]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LiveSupport_Client](
	[Id] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Job] [varchar](50) NULL,
	[Unit] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[GrounpId] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Age] [int] NULL,
	[Sex] [int] NULL,
	[QQ] [varchar](50) NULL,
	[Remark] [text] NULL,
 CONSTRAINT [PK_LiveSupport_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LiveChat_ChatMessagesAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[LiveChat_ChatMessagesAdd]
	@MessageId varchar(50),
	@ChatID varchar(50),
	@Source varchar(50),
	@Destination varchar(50),
	@Text text,
	@SentDate bigint,
	@Type varchar(50)
AS

INSERT INTO LiveChat_Message  VALUES(@MessageId,@ChatID,@Source,@Destination,@Text,@SentDate,@Type)
' 
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_Chat_LiveChat_Operator]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_Chat]'))
ALTER TABLE [dbo].[LiveChat_Chat]  WITH CHECK ADD  CONSTRAINT [FK_LiveChat_Chat_LiveChat_Operator] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[LiveChat_Operator] ([OperatorId])
GO
ALTER TABLE [dbo].[LiveChat_Chat] CHECK CONSTRAINT [FK_LiveChat_Chat_LiveChat_Operator]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_Chat_LiveChat_Visitor]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_Chat]'))
ALTER TABLE [dbo].[LiveChat_Chat]  WITH CHECK ADD  CONSTRAINT [FK_LiveChat_Chat_LiveChat_Visitor] FOREIGN KEY([VisitorId])
REFERENCES [dbo].[LiveChat_Visitor] ([VisitorId])
GO
ALTER TABLE [dbo].[LiveChat_Chat] CHECK CONSTRAINT [FK_LiveChat_Chat_LiveChat_Visitor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_PageRequest_LiveChat_VisitSession]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_PageRequest]'))
ALTER TABLE [dbo].[LiveChat_PageRequest]  WITH CHECK ADD  CONSTRAINT [FK_LiveChat_PageRequest_LiveChat_VisitSession] FOREIGN KEY([SessionId])
REFERENCES [dbo].[LiveChat_VisitSession] ([SessionId])
GO
ALTER TABLE [dbo].[LiveChat_PageRequest] CHECK CONSTRAINT [FK_LiveChat_PageRequest_LiveChat_VisitSession]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_PageRequest_LiveSupport_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_PageRequest]'))
ALTER TABLE [dbo].[LiveChat_PageRequest]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveChat_PageRequest_LiveSupport_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])
GO
ALTER TABLE [dbo].[LiveChat_PageRequest] CHECK CONSTRAINT [FK_LiveChat_PageRequest_LiveSupport_Account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_VisitSession_LiveChat_Visitor]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_VisitSession]'))
ALTER TABLE [dbo].[LiveChat_VisitSession]  WITH CHECK ADD  CONSTRAINT [FK_LiveChat_VisitSession_LiveChat_Visitor] FOREIGN KEY([VisitorId])
REFERENCES [dbo].[LiveChat_Visitor] ([VisitorId])
GO
ALTER TABLE [dbo].[LiveChat_VisitSession] CHECK CONSTRAINT [FK_LiveChat_VisitSession_LiveChat_Visitor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_Message_LiveChat_Chat]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_Message]'))
ALTER TABLE [dbo].[LiveChat_Message]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveChat_Message_LiveChat_Chat] FOREIGN KEY([ChatID])
REFERENCES [dbo].[LiveChat_Chat] ([ChatId])
GO
ALTER TABLE [dbo].[LiveChat_Message] CHECK CONSTRAINT [FK_LiveChat_Message_LiveChat_Chat]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupport_ LeaveWord_LiveSupport_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_LeaveWord]'))
ALTER TABLE [dbo].[LiveSupport_LeaveWord]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveSupport_ LeaveWord_LiveSupport_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])
GO
ALTER TABLE [dbo].[LiveSupport_LeaveWord] CHECK CONSTRAINT [FK_LiveSupport_ LeaveWord_LiveSupport_Account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupportDepartment_LiveSupport_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_Department]'))
ALTER TABLE [dbo].[LiveSupport_Department]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveSupportDepartment_LiveSupport_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])
GO
ALTER TABLE [dbo].[LiveSupport_Department] CHECK CONSTRAINT [FK_LiveSupportDepartment_LiveSupport_Account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupport_ClientGrounp_LiveSupport_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_ClientGrounp]'))
ALTER TABLE [dbo].[LiveSupport_ClientGrounp]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveSupport_ClientGrounp_LiveSupport_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])
GO
ALTER TABLE [dbo].[LiveSupport_ClientGrounp] CHECK CONSTRAINT [FK_LiveSupport_ClientGrounp_LiveSupport_Account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_QuickResponse_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_QuickResponse]'))
ALTER TABLE [dbo].[LiveChat_QuickResponse]  WITH NOCHECK ADD  CONSTRAINT [fk_QuickResponse_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LiveChat_QuickResponse] CHECK CONSTRAINT [fk_QuickResponse_Account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_Operator_LiveChat_Operator]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_Operator]'))
ALTER TABLE [dbo].[LiveChat_Operator]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveChat_Operator_LiveChat_Operator] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[LiveSupport_Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[LiveChat_Operator] CHECK CONSTRAINT [FK_LiveChat_Operator_LiveChat_Operator]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_Operator_LiveSupport_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_Operator]'))
ALTER TABLE [dbo].[LiveChat_Operator]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveChat_Operator_LiveSupport_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])
GO
ALTER TABLE [dbo].[LiveChat_Operator] CHECK CONSTRAINT [FK_LiveChat_Operator_LiveSupport_Account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupport_Payment_LiveSupport_Accounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_Payment]'))
ALTER TABLE [dbo].[LiveSupport_Payment]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveSupport_Payment_LiveSupport_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])
GO
ALTER TABLE [dbo].[LiveSupport_Payment] CHECK CONSTRAINT [FK_LiveSupport_Payment_LiveSupport_Accounts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupport_Payment_LiveSupport_Serivces]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_Payment]'))
ALTER TABLE [dbo].[LiveSupport_Payment]  WITH CHECK ADD  CONSTRAINT [FK_LiveSupport_Payment_LiveSupport_Serivces] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[LiveSupport_Serivces] ([Id])
GO
ALTER TABLE [dbo].[LiveSupport_Payment] CHECK CONSTRAINT [FK_LiveSupport_Payment_LiveSupport_Serivces]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Portal_City_Portal_Province ]') AND parent_object_id = OBJECT_ID(N'[dbo].[Portal_City]'))
ALTER TABLE [dbo].[Portal_City]  WITH CHECK ADD  CONSTRAINT [FK_Portal_City_Portal_Province ] FOREIGN KEY([Pid])
REFERENCES [dbo].[Portal_Province ] ([id])
GO
ALTER TABLE [dbo].[Portal_City] CHECK CONSTRAINT [FK_Portal_City_Portal_Province ]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupport_Client_LiveSupport_ClientGrounp]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_Client]'))
ALTER TABLE [dbo].[LiveSupport_Client]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveSupport_Client_LiveSupport_ClientGrounp] FOREIGN KEY([GrounpId])
REFERENCES [dbo].[LiveSupport_ClientGrounp] ([Id])
GO
ALTER TABLE [dbo].[LiveSupport_Client] CHECK CONSTRAINT [FK_LiveSupport_Client_LiveSupport_ClientGrounp]
