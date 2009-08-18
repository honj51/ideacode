use LiveSupport

if exists (select * from sysobjects where id = OBJECT_ID('[LiveChat_Chat]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveChat_Chat]

CREATE TABLE [LiveChat_Chat] (
[ChatId] [varchar]  (50) NOT NULL,
[CreateBy] [varchar]  (50) NOT NULL,
[CloseBy] [varchar]  (50) NULL,
[CreateTime] [datetime]  NOT NULL,
[AcceptTime] [datetime]  NULL,
[CloseTime] [datetime]  NULL,
[AccountId] [varchar]  (50) NOT NULL,
[VisitorId] [varchar]  (50) NULL,
[OperatorId] [varchar]  (50) NULL,
[Status] [varchar]  (50) NULL)

ALTER TABLE [LiveChat_Chat] WITH NOCHECK ADD  CONSTRAINT [PK_LiveChat_Chat] PRIMARY KEY  NONCLUSTERED ( [ChatId] )
if exists (select * from sysobjects where id = OBJECT_ID('[LiveChat_Message]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveChat_Message]

CREATE TABLE [LiveChat_Message] (
[MessageId] [varchar]  (50) NOT NULL,
[ChatID] [varchar]  (50) NOT NULL,
[Source] [varchar]  (50) NOT NULL,
[Destination] [varchar]  (50) NOT NULL,
[Text] [text]  NOT NULL,
[SentDate] [bigint]  NOT NULL,
[Type] [varchar]  (50) NULL)

ALTER TABLE [LiveChat_Message] WITH NOCHECK ADD  CONSTRAINT [PK_LiveChat_Message] PRIMARY KEY  NONCLUSTERED ( [MessageId] )
if exists (select * from sysobjects where id = OBJECT_ID('[LiveChat_Operator]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveChat_Operator]

CREATE TABLE [LiveChat_Operator] (
[OperatorId] [varchar]  (50) NOT NULL,
[AccountId] [varchar]  (50) NOT NULL,
[LoginName] [varchar]  (30) NOT NULL,
[Password] [varchar]  (30) NOT NULL,
[NickName] [varchar]  (30) NULL,
[Email] [varchar]  (30) NULL,
[IsAdmin] [bit]  NULL,
[Status] [varchar]  (30) NULL,
[AVChatStatus] [varchar]  (30) NULL,
[DepartmentId] [varchar]  (50) NULL)

ALTER TABLE [LiveChat_Operator] WITH NOCHECK ADD  CONSTRAINT [PK_LiveChat_Operator] PRIMARY KEY  NONCLUSTERED ( [OperatorId] )
if exists (select * from sysobjects where id = OBJECT_ID('[LiveChat_PageRequest]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveChat_PageRequest]

CREATE TABLE [LiveChat_PageRequest] (
[AccountId] [varchar]  (50) NOT NULL,
[SessionId] [varchar]  (50) NULL,
[Page] [text]  NULL,
[RequestTime] [datetime]  NULL,
[Referrer] [text]  NULL)

if exists (select * from sysobjects where id = OBJECT_ID('[LiveChat_QuickResponse]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveChat_QuickResponse]

CREATE TABLE [LiveChat_QuickResponse] (
[QuickId] [int]  IDENTITY (1, 1)  NOT NULL,
[DomainName] [varchar]  (100) NULL,
[AccountId] [varchar]  (50) NOT NULL,
[OperatorId] [varchar]  (50) NULL,
[Submenu] [varchar]  (50) NOT NULL,
[Node] [text]  NULL)

ALTER TABLE [LiveChat_QuickResponse] WITH NOCHECK ADD  CONSTRAINT [PK_LiveChat_QuickResponse] PRIMARY KEY  NONCLUSTERED ( [QuickId] )
SET IDENTITY_INSERT [LiveChat_QuickResponse] ON


SET IDENTITY_INSERT [LiveChat_QuickResponse] OFF
if exists (select * from sysobjects where id = OBJECT_ID('[LiveChat_Visitor]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveChat_Visitor]

CREATE TABLE [LiveChat_Visitor] (
[VisitorId] [varchar]  (50) NOT NULL,
[AccountId] [varchar]  (50) NOT NULL,
[Name] [varchar]  (50) NULL,
[Email] [varchar]  (50) NULL,
[VisitCount] [int]  NULL,
[Company] [varchar]  (50) NULL,
[Remark] [varchar]  (50) NULL,
[IsVIP] [bit]  NULL,
[CurrentSessionId] [varchar]  (50) NULL)

ALTER TABLE [LiveChat_Visitor] WITH NOCHECK ADD  CONSTRAINT [PK_LiveChat_Visitor] PRIMARY KEY  NONCLUSTERED ( [VisitorId] )
if exists (select * from sysobjects where id = OBJECT_ID('[LiveChat_VisitSession]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveChat_VisitSession]

CREATE TABLE [LiveChat_VisitSession] (
[SessionId] [varchar]  (50) NOT NULL,
[VisitorId] [varchar]  (50) NOT NULL,
[IP] [varchar]  (30) NULL,
[Browser] [varchar]  (300) NULL,
[Location] [varchar]  (50) NULL,
[VisitingTime] [datetime]  NULL,
[DomainRequested] [varchar]  (50) NULL,
[OperatorId] [varchar]  (50) NULL DEFAULT ((-1)),
[Referrer] [varchar]  (256) NULL,
[LeaveTime] [datetime]  NULL,
[ChatRequestTime] [datetime]  NULL,
[ChatingTime] [datetime]  NULL,
[WaitingDuring] [datetime]  NULL,
[ChattingDuring] [datetime]  NULL,
[PageRequestCount] [int]  NULL,
[Status] [varchar]  (50) NULL)

ALTER TABLE [LiveChat_VisitSession] WITH NOCHECK ADD  CONSTRAINT [PK_LiveChat_VisitSession] PRIMARY KEY  NONCLUSTERED ( [SessionId] )
if exists (select * from sysobjects where id = OBJECT_ID('[LiveSupport_Account]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveSupport_Account]

CREATE TABLE [LiveSupport_Account] (
[AccountId] [varchar]  (50) NOT NULL,
[AccountNumber] [varchar]  (50) NULL,
[CompanyName] [varchar]  (100) NULL,
[Industry] [varchar]  (50) NULL,
[Email] [varchar]  (50) NULL,
[ContactName] [varchar]  (50) NULL,
[Phone] [varchar]  (50) NULL,
[URL] [varchar]  (256) NULL,
[Domain] [varchar]  (50) NULL,
[OperatorCount] [int]  NULL,
[Province] [varchar]  (20) NULL,
[City] [varchar]  (20) NULL DEFAULT (getdate()),
[RegisterDate] [datetime]  NULL,
[Remark] [text]  NULL,
[PaymentId] [varchar]  (50) NULL)

ALTER TABLE [LiveSupport_Account] WITH NOCHECK ADD  CONSTRAINT [PK_LiveSupport_Account] PRIMARY KEY  NONCLUSTERED ( [AccountId] )
if exists (select * from sysobjects where id = OBJECT_ID('[LiveSupport_Client]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveSupport_Client]

CREATE TABLE [LiveSupport_Client] (
[Id] [varchar]  (50) NOT NULL,
[Name] [varchar]  (50) NULL,
[Job] [varchar]  (50) NULL,
[Unit] [varchar]  (50) NULL,
[Phone] [varchar]  (50) NULL,
[Email] [varchar]  (50) NULL,
[GrounpId] [varchar]  (50) NULL,
[Address] [varchar]  (50) NULL,
[Age] [int]  NULL,
[Sex] [int]  NULL,
[QQ] [varchar]  (50) NULL,
[Remark] [text]  NULL)

ALTER TABLE [LiveSupport_Client] WITH NOCHECK ADD  CONSTRAINT [PK_LiveSupport_Client] PRIMARY KEY  NONCLUSTERED ( [Id] )
if exists (select * from sysobjects where id = OBJECT_ID('[LiveSupport_ClientGrounp]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveSupport_ClientGrounp]

CREATE TABLE [LiveSupport_ClientGrounp] (
[Id] [varchar]  (50) NOT NULL,
[Name] [varchar]  (50) NOT NULL,
[accountId] [varchar]  (50) NOT NULL,
[addDate] [datetime]  NULL)

ALTER TABLE [LiveSupport_ClientGrounp] WITH NOCHECK ADD  CONSTRAINT [PK_LiveSupport_ClientGrounp] PRIMARY KEY  NONCLUSTERED ( [Id] )
if exists (select * from sysobjects where id = OBJECT_ID('[LiveSupport_Content]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveSupport_Content]

CREATE TABLE [LiveSupport_Content] (
[Id] [int]  IDENTITY (1, 1)  NOT NULL,
[UserName] [varchar]  (50) NULL,
[UserEmail] [varchar]  (50) NULL,
[UserQQ] [varchar]  (50) NULL,
[UserUrl] [varchar]  (225) NULL,
[UserIp] [varchar]  (50) NULL,
[FaceUrl] [varchar]  (50) NULL,
[PicUrl] [varchar]  (50) NULL,
[AddTime] [datetime]  NULL,
[Content] [text]  NULL,
[Reply] [text]  NULL,
[IsHid] [int]  NULL,
[IsReply] [int]  NULL)

SET IDENTITY_INSERT [LiveSupport_Content] ON


SET IDENTITY_INSERT [LiveSupport_Content] OFF
if exists (select * from sysobjects where id = OBJECT_ID('[LiveSupport_Department]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveSupport_Department]

CREATE TABLE [LiveSupport_Department] (
[DepartmentId] [varchar]  (50) NOT NULL,
[DepartmentName] [varchar]  (50) NOT NULL,
[AccountId] [varchar]  (50) NOT NULL,
[IsDefault] [bit]  NULL,
[AddDate] [datetime]  NULL)

ALTER TABLE [LiveSupport_Department] WITH NOCHECK ADD  CONSTRAINT [PK_LiveSupport_Department] PRIMARY KEY  NONCLUSTERED ( [DepartmentId] )
if exists (select * from sysobjects where id = OBJECT_ID('[LiveSupport_LeaveWord]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveSupport_LeaveWord]

CREATE TABLE [LiveSupport_LeaveWord] (
[Id] [varchar]  (50) NOT NULL,
[CallerName] [varchar]  (50) NULL,
[Email] [varchar]  (50) NOT NULL,
[Phone] [varchar]  (50) NULL,
[Subject] [varchar]  (50) NULL,
[Content] [text]  NULL,
[IP] [varchar]  (50) NULL,
[CallerDate] [datetime]  NULL,
[Senddate] [datetime]  NULL,
[OperatorName] [varchar]  (50) NULL,
[AccountId] [varchar]  (50) NULL,
[IsReplied] [bit]  NULL,
[DomainName] [varchar]  (50) NULL)

ALTER TABLE [LiveSupport_LeaveWord] WITH NOCHECK ADD  CONSTRAINT [PK_LiveSupport_LeaveWord] PRIMARY KEY  NONCLUSTERED ( [Id] )
if exists (select * from sysobjects where id = OBJECT_ID('[LiveSupport_Payment]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveSupport_Payment]

CREATE TABLE [LiveSupport_Payment] (
[Id] [int]  IDENTITY (1, 1)  NOT NULL,
[AccountId] [varchar]  (50) NOT NULL,
[ServiceId] [int]  NOT NULL,
[PayDate] [datetime]  NOT NULL,
[ExpireDate] [datetime]  NOT NULL)

ALTER TABLE [LiveSupport_Payment] WITH NOCHECK ADD  CONSTRAINT [PK_LiveSupport_Payment] PRIMARY KEY  NONCLUSTERED ( [Id] )
SET IDENTITY_INSERT [LiveSupport_Payment] ON


SET IDENTITY_INSERT [LiveSupport_Payment] OFF
if exists (select * from sysobjects where id = OBJECT_ID('[LiveSupport_Serivces]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [LiveSupport_Serivces]

CREATE TABLE [LiveSupport_Serivces] (
[Id] [int]  IDENTITY (1, 1)  NOT NULL,
[Name] [nchar]  (20) NOT NULL,
[OperatorsAllowed] [int]  NOT NULL,
[During] [int]  NOT NULL,
[Charge] [int]  NOT NULL)

ALTER TABLE [LiveSupport_Serivces] WITH NOCHECK ADD  CONSTRAINT [PK_LiveSupport_Serivces] PRIMARY KEY  NONCLUSTERED ( [Id] )
SET IDENTITY_INSERT [LiveSupport_Serivces] ON


SET IDENTITY_INSERT [LiveSupport_Serivces] OFF
if exists (select * from sysobjects where id = OBJECT_ID('[Portal_City]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Portal_City]

CREATE TABLE [Portal_City] (
[id] [int]  IDENTITY (1, 1)  NOT NULL,
[name] [varchar]  (50) NOT NULL,
[Pid] [int]  NOT NULL)

ALTER TABLE [Portal_City] WITH NOCHECK ADD  CONSTRAINT [PK_Portal_City] PRIMARY KEY  NONCLUSTERED ( [id] )
SET IDENTITY_INSERT [Portal_City] ON

INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 1,'����',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 2,'������',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 3,'������',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 4,'������',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 5,'������',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 6,'������',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 7,'��̨��',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 8,'ʯ��ɽ��',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 9,'���������йش壩',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 10,'��ͷ����',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 11,'��ɽ��',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 12,'ͨ����',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 13,'˳����',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 14,'��ƽ��',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 15,'������',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 16,'������',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 17,'ƽ����',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 18,'������',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 19,'������',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 20,'����',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 21,'��ƽ��',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 22,'�Ӷ���',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 23,'������',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 24,'�Ͽ���',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 25,'������',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 26,'������',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 27,'������',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 28,'�����',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 29,'������',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 30,'������',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 31,'������',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 32,'����',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 33,'������',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 34,'������',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 35,'����',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 36,'ʯ��ׯ��',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 37,'�żҿ���',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 38,'�е���',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 39,'�ػʵ���',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 40,'��ɽ��',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 41,'�ȷ���',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 42,'��ˮ��',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 43,'������',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 44,'��̨��',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 45,'������',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 46,'������',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 47,'����',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 48,'̫ԭ��',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 49,'˷����',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 50,'��ͬ��',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 51,'������',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 52,'������',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 53,'������',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 54,'������',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 55,'�ٷ���',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 56,'������',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 57,'�˳���',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 58,'����',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 59,'���ͺ�����',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 60,'��ͷ��',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 61,'�����',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 62,'���ױ�����',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 63,'������˹��',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 64,'�����첼��',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 65,'�����׶���',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 66,'�˰���',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 67,'��������',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 68,'���ֹ�����',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 69,'����',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 70,'������',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 71,'������',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 72,'������',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 73,'������',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 74,'��˳��',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 75,'������',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 76,'��Ϫ��',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 77,'������',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 78,'��ɽ��',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 79,'������',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 80,'Ӫ����',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 81,'�̽���',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 82,'������',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 83,'��«����',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 84,'����',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 85,'������',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 86,'�׳���',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 87,'������',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 88,'��ƽ��',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 89,'��Դ��',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 90,'ͨ����',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 91,'��ɽ��',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 92,'�ӱ߳�����������',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 93,'����',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 94,'��������',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 95,'��̨����',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 96,'�ں���',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 97,'������',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 98,'���������',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 99,'������',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 100,'��ľ˹��',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 101,'˫Ѽɽ��',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 102,'������',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 103,'���˰������(�Ӹ����)',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 104,'ĵ����',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 105,'�׸���',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 106,'�绯��',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 107,'����',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 108,'������',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 109,'������',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 110,'¬����',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 111,'�����',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 112,'������',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 113,'������',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 114,'������',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 115,'բ����',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 116,'�����',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 117,'������',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 118,'������',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 119,'��ɽ��',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 120,'�ζ���',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 121,'�ֶ�����',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 122,'��ɽ��',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 123,'�ɽ���',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 124,'������',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 125,'�ϻ���',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 126,'������',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 127,'������',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 128,'����',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 129,'�Ͼ���',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 130,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 131,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 132,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 133,'����',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 134,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 135,'̩����',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 136,'��ͨ��',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 137,'���Ƹ���',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 138,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 139,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 140,'�γ���',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 141,'��Ǩ��',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 142,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 143,'�żҸ���',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 144,'��ɽ��',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 145,'�⽭��',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 146,'̫����',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 147,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 148,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 149,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 150,'��̳��',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 151,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 152,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 153,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 154,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 155,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 156,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 157,'�˻���',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 158,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 159,'̩����',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 160,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 161,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 162,'�����',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 163,'ͨ����',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 164,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 165,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 166,'������',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 167,'��̨��',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 168,'�����',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 169,'������',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 170,'������',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 171,'������',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 172,'��ɽ��',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 173,'������',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 174,'������',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 175,'������',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 176,'����',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 177,'̨����',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 178,'������',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 179,'��ˮ��',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 180,'����',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 181,'�Ϸ���',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 182,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 183,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 184,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 185,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 186,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 187,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 188,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 189,'��ɽ��',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 190,'�ߺ���',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 191,'ͭ����',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 192,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 193,'��ɽ��',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 194,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 195,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 196,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 197,'������',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 198,'����',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 199,'������',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 200,'��ƽ��',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 201,'������',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 202,'������',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 203,'Ȫ����',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 204,'������',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 205,'������',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 206,'������',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 207,'������',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 208,'����',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 209,'�ϲ���',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 210,'�Ž���',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 211,'��������',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 212,'ӥ̶��',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 213,'������',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 214,'Ƽ����',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 215,'������',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 216,'������',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 217,'������',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 218,'�˴���',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 219,'������',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 220,'����',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 221,'������',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 222,'�ĳ���',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 223,'������',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 224,'��Ӫ��',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 225,'�Ͳ���',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 226,'Ϋ����',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 227,'��̨��',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 228,'������',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 229,'�ൺ��',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 230,'������',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 231,'������',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 232,'��ׯ��',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 233,'������',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 234,'̩����',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 235,'������',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 236,'������',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 237,'������',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 238,'����',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 239,'֣����',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 240,'����Ͽ��',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 241,'������',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 242,'������',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 243,'������',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 244,'�ױ���',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 245,'������',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 246,'�����',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 247,'������',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 248,'������',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 249,'�����',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 250,'�����',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 251,'ƽ��ɽ��',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 252,'������',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 253,'������',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 254,'�ܿ���',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 255,'פ�����',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 256,'����',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 257,'�人��',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 258,'ʮ����',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 259,'�差��',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 260,'������',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 261,'Т����',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 262,'�Ƹ���',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 263,'������',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 264,'��ʯ��',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 265,'������',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 266,'������',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 267,'�˲���',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 268,'������',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 269,'��ʩ����������������',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 270,'������',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 271,'������',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 272,'Ǳ����',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 273,'��ũ������',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 274,'����',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 275,'��ɳ��',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 276,'�żҽ���',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 277,'������',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 278,'������',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 279,'������',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 280,'������',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 281,'��̶��',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 282,'������',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 283,'������',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 284,'������',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 285,'������',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 286,'������',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 287,'¦����',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 288,'��������������������',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 289,'����',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 290,'������',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 291,'��Զ����',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 292,'�ع���',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 293,'��Դ��',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 294,'÷����',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 295,'������',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 296,'��ͷ��',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 297,'������',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 298,'��β��',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 299,'������',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 300,'��ݸ��',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 301,'������',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 302,'�麣��',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 303,'��ɽ��',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 304,'������',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 305,'��ɽ��',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 306,'������',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 307,'�Ƹ���',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 308,'������',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 309,'ï����',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 310,'տ����',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 311,'����',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 312,'������',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 313,'������',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 314,'������',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 315,'������',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 316,'�����',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 317,'������',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 318,'������',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 319,'������',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 320,'���Ǹ���',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 321,'������',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 322,'��ɫ��',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 323,'�ӳ���',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 324,'������',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 325,'������',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 326,'����',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 327,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 328,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 329,'����',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 330,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 331,'��ɿ���',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 332,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 333,'ɳƺ����',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 334,'��������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 335,'�ϰ���',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 336,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 337,'��ʢ��',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 338,'˫����',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 339,'�山��',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 340,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 341,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 342,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 343,'ǭ����',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 344,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 345,'�ϴ���',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 346,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 347,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 348,'�ϴ���',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 349,'�뽭��',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 350,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 351,'ͭ����',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 352,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 353,'�ɽ��',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 354,'�潭��',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 355,'��¡��',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 356,'�ᶼ��',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 357,'�ǿ���',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 358,'����',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 359,'��Ϫ��',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 360,'��ɽ��',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 361,'�����',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 362,'������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 363,'����',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 364,'ʯ��������������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 365,'��ˮ����������������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 366,'��������������������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 367,'��ɽ����������������',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 368,'����',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 369,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 370,'��������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 371,'�山��',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 372,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 373,'�ϰ���',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 374,'ɳƺ����',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 375,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 376,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 377,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 378,'�ϴ���',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 379,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 380,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 381,'��ɿ���',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 382,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 383,'�ϴ���',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 384,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 385,'ǭ����',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 386,'����',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 387,'�ɽ��',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 388,'�ᶼ��',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 389,'�����',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 390,'�潭��',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 391,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 392,'�뽭��',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 393,'��������������������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 394,'��ƽ��',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 395,'ͭ����',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 396,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 397,'����',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 398,'ʯ��������������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 399,'��ɽ��',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 400,'��¡��',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 401,'��ˮ����������������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 402,'��ɽ����������������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 403,'�ǿ���',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 404,'��ʢ��',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 405,'��Ϫ��',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 406,'�ٲ���',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 407,'������',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 408,'˫����',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 409,'�ɶ���',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 410,'������',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 411,'������',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 412,'��ɽ����������',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 413,'�㰲��',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 414,'������',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 415,'�Ű���',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 416,'������',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 417,'��Ԫ��',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 418,'���β���������',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 419,'��֦����',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 420,'���Ӳ���Ǽ��������',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 421,'������',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 422,'�˱���',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 423,'��ɽ��',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 424,'�ڽ���',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 425,'������',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 426,'üɽ��',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 427,'�Թ���',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 428,'������',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 429,'�ϳ���',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 430,'������',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 431,'������',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 432,'��˳��',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 433,'ǭ�������嶱��������',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 434,'ǭ�ϲ���������������',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 435,'�Ͻڵ���',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 436,'����ˮ��',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 437,'ǭ���ϲ���������������',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 438,'ͭ�ʵ���',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 439,'����',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 440,'������',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 441,'������',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 442,'�������������',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 443,'��������������',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 444,'��Ϫ��',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 445,'��ͨ��',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 446,'�ն���',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 447,'��ӹ���������������',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 448,'�º���徰����������',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 449,'��ɽ��',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 450,'������',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 451,'��ɽ׳������������',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 452,'��˫���ɴ���������',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 453,'�ٲ���',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 454,'ŭ��������������',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 455,'�������������',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 456,'������',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 457,'�տ������',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 458,'��������',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 459,'��������',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 460,'ɽ�ϵ���',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 461,'�������',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 462,'��֥����',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 463,'����',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 464,'������',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 465,'������',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 466,'������',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 467,'������',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 468,'�Ӱ���',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 469,'μ����',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 470,'������',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 471,'������',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 472,'������',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 473,'ͭ����',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 474,'����',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 475,'������',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 476,'������',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 477,'ƽ����',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 478,'��ˮ��',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 479,'������',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 480,'��Ȫ��',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 481,'������',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 482,'�����',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 483,'��Ҵ��',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 484,'��������',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 485,'������',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 486,'���ϲ���������',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 487,'���Ļ���������',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 488,'¤����',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 489,'����',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 490,'������',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 491,'��������������',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 492,'�����ɹ������������',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 493,'���ϲ���������',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 494,'��������',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 495,'��������������',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 496,'�������������',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 497,'���ϲ���������',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 498,'����',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 499,'������',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 500,'��ԭ��',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 501,'������',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 502,'ʯ��ɽ��',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 503,'������',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 504,'����',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 505,'��³ľ����',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 506,'���������ɹ�������',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 507,'�������',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 508,'���ܵ���',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 509,'��������������',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 510,'���ǵ���',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 511,'��³������',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 512,'����̩����',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 513,'��ʲ����',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 514,'���������������',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 515,'���������ɹ�������',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 516,'�����յ���',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 517,'�������տ¶�����������',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 518,'����������',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 519,'����',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 520,'���',32)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 521,'����',32)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 522,'����',33)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 523,'����',33)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 524,'̨����',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 525,'������',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 526,'̨����',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 527,'̨����',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 528,'������',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 529,'��¡��',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 530,'���x��',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 531,'̨���h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 532,'̨�пh',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 533,'���ۿh',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 534,'��Ͷ�h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 535,'̨�Ͽh',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 536,'��ɏ�h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 537,'���|�h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 538,'�҈@�h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 539,'�û��h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 540,'̨�|�h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 541,'�����h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 542,'���m�h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 543,'��ֿh',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 544,'���x�h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 545,'����h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 546,'����h',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 547,'����',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 548,'����',35)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 549,'����',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 550,'����',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 551,'����',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 552,'����',25)

SET IDENTITY_INSERT [Portal_City] OFF
if exists (select * from sysobjects where id = OBJECT_ID('[Portal_Province ]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Portal_Province ]

CREATE TABLE [Portal_Province ] (
[id] [int]  IDENTITY (1, 1)  NOT NULL,
[name] [varchar]  (50) NULL)

ALTER TABLE [Portal_Province ] WITH NOCHECK ADD  CONSTRAINT [PK_Portal_Province ] PRIMARY KEY  NONCLUSTERED ( [id] )
SET IDENTITY_INSERT [Portal_Province ] ON

INSERT [Portal_Province ] ([id],[name]) VALUES ( 1,'������')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 2,'�����')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 3,'�ӱ�ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 4,'ɽ��ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 5,'���ɹ�������')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 6,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 7,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 8,'������ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 9,'�Ϻ���')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 10,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 11,'�㽭ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 12,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 13,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 14,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 15,'ɽ��ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 16,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 17,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 18,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 19,'�㶫ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 20,'����������')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 21,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 22,'������')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 23,'�Ĵ�ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 24,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 25,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 26,'����������')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 27,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 28,'����ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 29,'�ຣʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 30,'���Ļ���������')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 31,'�½�ά���������')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 32,'����ر�������')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 33,'�����ر�������')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 34,'̨��ʡ')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 35,'����')

SET IDENTITY_INSERT [Portal_Province ] OFF
if exists (select * from sysobjects where id = OBJECT_ID('[WebSite]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [WebSite]

CREATE TABLE [WebSite] (
[DomainName] [varchar]  (50) NOT NULL,
[CompanyName] [varchar]  (100) NULL,
[RegisterId] [varchar]  (50) NOT NULL,
[IconStyle] [text]  NOT NULL,
[InviteStyle] [text]  NOT NULL,
[ChatStyle] [text]  NOT NULL,
[IcoLocation] [varchar]  (50) NOT NULL)

ALTER TABLE [WebSite] WITH NOCHECK ADD  CONSTRAINT [PK_WebSite] PRIMARY KEY  NONCLUSTERED ( [DomainName] )
