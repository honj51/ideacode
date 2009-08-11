use LiveSupport
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
) 
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
CREATE TABLE [dbo].[Portal_Province ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Sheng] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
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
CREATE TABLE [dbo].[LiveChat_PageRequest](
	[AccountId] [varchar](50) NOT NULL,
	[SessionId] [varchar](50) NULL,
	[Page] [text] NULL,
	[RequestTime] [datetime] NULL,
	[Referrer] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
CREATE TABLE [dbo].[Portal_City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[Pid] [int] NOT NULL,
 CONSTRAINT [PK_Shi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
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
