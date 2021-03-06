
GO
/****** Object:  Table [dbo].[LiveChat_ChatMessages]    Script Date: 07/27/2007 05:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LiveChat_ChatMessages](
	[MessageID] [bigint] IDENTITY(1,1) NOT NULL,
	[ChatID] [char](39) NOT NULL,
	[FromName] [varchar](100) NOT NULL CONSTRAINT [DF_ASPLiveSupport_ChatMessages_FromName]  DEFAULT (''),
	[Message] [varchar](3000) NOT NULL CONSTRAINT [DF_ASPLiveSupport_ChatMessages_Message]  DEFAULT (''),
	[SentDate] [bigint] NOT NULL,
 CONSTRAINT [PK_ASPLiveSupport_ChatMessages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LiveChat_ChatRequests]    Script Date: 07/27/2007 05:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LiveChat_ChatRequests](
	[ChatID] [char](39) NOT NULL,
	[VisitorIP] [varchar](50) NOT NULL CONSTRAINT [DF_ASPLiveSupport_ChatRequests_VisitorIP]  DEFAULT (''),
	[VisitorName] [varchar](100) NOT NULL CONSTRAINT [DF_LiveChat_ChatRequests_VisitorName]  DEFAULT (''),
	[VisitorEmail] [varchar](225) NOT NULL CONSTRAINT [DF_LiveChat_ChatRequests_VisitorEmail]  DEFAULT (''),
	[VisitorUserAgent] [varchar](125) NOT NULL CONSTRAINT [DF_LiveChat_ChatRequests_VisitorUserAgent]  DEFAULT (''),
	[OperatorID] [int] NOT NULL CONSTRAINT [DF_LiveChat_ChatRequests_OperatorID]  DEFAULT ((-1)),
	[RequestDate] [smalldatetime] NOT NULL CONSTRAINT [DF_ASPLiveSupport_ChatRequests_RequestDate]  DEFAULT (getdate()),
	[AcceptDate] [smalldatetime] NULL,
	[ClosedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_ASPLiveSupport_ChatRequests] PRIMARY KEY CLUSTERED 
(
	[ChatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LiveChat_LogAccess]    Script Date: 07/27/2007 05:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LiveChat_LogAccess](
	[LogAccessID] [int] IDENTITY(1,1) NOT NULL,
	[PageRequested] [varchar](500) NOT NULL CONSTRAINT [DF_ASPLiveSupport_LogAccess_PageRequested]  DEFAULT (''),
	[DomainRequested] [varchar](250) NOT NULL CONSTRAINT [DF_ASPLiveSupport_LogAccess_DomainRequested]  DEFAULT (''),
	[RequestedTime] [smalldatetime] NOT NULL CONSTRAINT [DF_ASPLiveSupport_LogAccess_RequestedTime]  DEFAULT (getdate()),
	[Referrer] [varchar](500) NOT NULL CONSTRAINT [DF_ASPLiveSupport_LogAccess_Referrer]  DEFAULT (''),
	[VisitorUserAgent] [varchar](100) NOT NULL CONSTRAINT [DF_ASPLiveSupport_LogAccess_VisitorUserAgent]  DEFAULT (''),
	[VisitorIP] [varchar](50) NOT NULL CONSTRAINT [DF_ASPLiveSupport_LogAccess_VisitorIP]  DEFAULT (''),
 CONSTRAINT [PK_ASPLiveSupport_LogAccess] PRIMARY KEY CLUSTERED 
(
	[LogAccessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LiveChat_Operators]    Script Date: 07/27/2007 05:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LiveChat_Operators](
	[OperatorID] [int] IDENTITY(1,1) NOT NULL,
	[OperatorName] [varchar](100) NOT NULL CONSTRAINT [DF_ASPLiveSupport_Operators_OperatorName]  DEFAULT (''),
	[OperatorPassword] [varchar](50) NOT NULL CONSTRAINT [DF_ASPLiveSupport_Operators_OperatorPassword]  DEFAULT ('nopw'),
	[OperatorEmail] [varchar](250) NOT NULL CONSTRAINT [DF_ASPLiveSupport_Operators_OperatorEmail]  DEFAULT (''),
	[IsOnline] [bit] NOT NULL CONSTRAINT [DF_ASPLiveSupport_Operators_OperatorStatus]  DEFAULT ((0)),
 CONSTRAINT [PK_ASPLiveSupport_Operators] PRIMARY KEY CLUSTERED 
(
	[OperatorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Offline | 1: Online | 2: Be Right Back' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiveChat_Operators', @level2type=N'COLUMN',@level2name=N'IsOnline'