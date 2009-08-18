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

INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 1,'北京',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 2,'东城区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 3,'西城区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 4,'崇文区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 5,'宣武区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 6,'朝阳区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 7,'丰台区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 8,'石景山区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 9,'海淀区（中关村）',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 10,'门头沟区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 11,'房山区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 12,'通州区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 13,'顺义区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 14,'昌平区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 15,'大兴区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 16,'怀柔区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 17,'平谷区',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 18,'密云县',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 19,'延庆县',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 20,'其他',1)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 21,'和平区',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 22,'河东区',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 23,'河西区',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 24,'南开区',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 25,'红桥区',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 26,'塘沽区',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 27,'汉沽区',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 28,'大港区',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 29,'西青区',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 30,'津南区',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 31,'武清区',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 32,'蓟县',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 33,'宁河县',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 34,'静海县',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 35,'其他',2)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 36,'石家庄市',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 37,'张家口市',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 38,'承德市',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 39,'秦皇岛市',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 40,'唐山市',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 41,'廊坊市',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 42,'衡水市',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 43,'沧州市',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 44,'邢台市',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 45,'邯郸市',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 46,'保定市',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 47,'其他',3)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 48,'太原市',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 49,'朔州市',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 50,'大同市',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 51,'长治市',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 52,'晋城市',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 53,'忻州市',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 54,'晋中市',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 55,'临汾市',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 56,'吕梁市',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 57,'运城市',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 58,'其他',4)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 59,'呼和浩特市',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 60,'包头市',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 61,'赤峰市',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 62,'呼伦贝尔市',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 63,'鄂尔多斯市',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 64,'乌兰察布市',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 65,'巴彦淖尔市',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 66,'兴安盟',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 67,'阿拉善盟',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 68,'锡林郭勒盟',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 69,'其他',5)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 70,'沈阳市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 71,'朝阳市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 72,'阜新市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 73,'铁岭市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 74,'抚顺市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 75,'丹东市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 76,'本溪市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 77,'辽阳市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 78,'鞍山市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 79,'大连市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 80,'营口市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 81,'盘锦市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 82,'锦州市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 83,'葫芦岛市',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 84,'其他',6)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 85,'长春市',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 86,'白城市',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 87,'吉林市',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 88,'四平市',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 89,'辽源市',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 90,'通化市',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 91,'白山市',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 92,'延边朝鲜族自治州',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 93,'其他',7)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 94,'哈尔滨市',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 95,'七台河市',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 96,'黑河市',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 97,'大庆市',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 98,'齐齐哈尔市',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 99,'伊春市',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 100,'佳木斯市',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 101,'双鸭山市',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 102,'鸡西市',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 103,'大兴安岭地区(加格达奇)',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 104,'牡丹江',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 105,'鹤岗市',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 106,'绥化市',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 107,'其他',8)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 108,'黄浦区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 109,'黄浦区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 110,'卢湾区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 111,'徐汇区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 112,'长宁区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 113,'静安区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 114,'普陀区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 115,'闸北区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 116,'虹口区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 117,'杨浦区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 118,'闵行区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 119,'宝山区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 120,'嘉定区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 121,'浦东新区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 122,'金山区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 123,'松江区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 124,'青浦区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 125,'南汇区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 126,'奉贤区',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 127,'崇明县',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 128,'其他',9)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 129,'南京市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 130,'苏州市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 131,'无锡市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 132,'常州市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 133,'镇江市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 134,'扬州市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 135,'泰州市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 136,'南通市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 137,'连云港市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 138,'徐州市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 139,'淮安市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 140,'盐城市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 141,'宿迁市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 142,'常熟市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 143,'张家港市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 144,'昆山市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 145,'吴江市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 146,'太仓市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 147,'宜兴市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 148,'江阴市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 149,'溧阳市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 150,'金坛市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 151,'丹阳市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 152,'扬中市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 153,'句容市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 154,'仪征市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 155,'高邮市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 156,'江都市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 157,'兴化市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 158,'靖江市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 159,'泰兴市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 160,'姜堰市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 161,'启东市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 162,'如皋市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 163,'通州市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 164,'海门市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 165,'新沂市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 166,'邳州市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 167,'东台市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 168,'大丰市',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 169,'杭州市',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 170,'湖州市',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 171,'嘉兴市',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 172,'舟山市',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 173,'宁波市',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 174,'绍兴市',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 175,'衢州市',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 176,'金华市',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 177,'台州市',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 178,'温州市',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 179,'丽水市',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 180,'其他',11)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 181,'合肥市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 182,'宿州市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 183,'淮北市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 184,'亳州市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 185,'阜阳市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 186,'蚌埠市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 187,'淮南市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 188,'滁州市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 189,'马鞍山市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 190,'芜湖市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 191,'铜陵市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 192,'安庆市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 193,'黄山市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 194,'六安市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 195,'巢湖市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 196,'池州市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 197,'宣城市',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 198,'其他',12)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 199,'福州市',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 200,'南平市',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 201,'莆田市',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 202,'三明市',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 203,'泉州市',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 204,'厦门市',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 205,'漳州市',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 206,'龙岩市',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 207,'宁德市',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 208,'其他',13)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 209,'南昌市',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 210,'九江市',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 211,'景德镇市',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 212,'鹰潭市',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 213,'新余市',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 214,'萍乡市',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 215,'赣州市',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 216,'上饶市',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 217,'抚州市',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 218,'宜春市',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 219,'吉安市',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 220,'其他',14)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 221,'济南市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 222,'聊城市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 223,'德州市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 224,'东营市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 225,'淄博市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 226,'潍坊市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 227,'烟台市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 228,'威海市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 229,'青岛市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 230,'日照市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 231,'临沂市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 232,'枣庄市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 233,'济宁市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 234,'泰安市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 235,'莱芜市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 236,'滨州市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 237,'菏泽市',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 238,'其他',15)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 239,'郑州市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 240,'三门峡市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 241,'洛阳市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 242,'焦作市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 243,'新乡市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 244,'鹤壁市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 245,'安阳市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 246,'濮阳市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 247,'开封市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 248,'商丘市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 249,'许昌市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 250,'漯河市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 251,'平顶山市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 252,'南阳市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 253,'信阳市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 254,'周口市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 255,'驻马店市',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 256,'其他',16)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 257,'武汉市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 258,'十堰市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 259,'襄樊市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 260,'荆门市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 261,'孝感市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 262,'黄冈市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 263,'鄂州市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 264,'黄石市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 265,'咸宁市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 266,'荆州市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 267,'宜昌市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 268,'随州市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 269,'恩施土家族苗族自治州',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 270,'仙桃市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 271,'天门市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 272,'潜江市',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 273,'神农架林区',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 274,'其他',17)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 275,'长沙市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 276,'张家界市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 277,'常德市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 278,'益阳市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 279,'岳阳市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 280,'株洲市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 281,'湘潭市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 282,'衡阳市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 283,'郴州市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 284,'永州市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 285,'邵阳市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 286,'怀化市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 287,'娄底市',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 288,'湘西土家族苗族自治州',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 289,'其他',18)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 290,'广州市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 291,'清远市市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 292,'韶关市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 293,'河源市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 294,'梅州市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 295,'潮州市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 296,'汕头市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 297,'揭阳市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 298,'汕尾市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 299,'惠州市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 300,'东莞市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 301,'深圳市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 302,'珠海市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 303,'中山市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 304,'江门市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 305,'佛山市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 306,'肇庆市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 307,'云浮市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 308,'阳江市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 309,'茂名市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 310,'湛江市',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 311,'其他',19)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 312,'南宁市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 313,'桂林市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 314,'柳州市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 315,'梧州市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 316,'贵港市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 317,'玉林市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 318,'钦州市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 319,'北海市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 320,'防城港市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 321,'崇左市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 322,'百色市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 323,'河池市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 324,'来宾市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 325,'贺州市',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 326,'其他',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 327,'海口市',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 328,'三亚市',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 329,'其他',20)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 330,'渝中区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 331,'大渡口区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 332,'江北区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 333,'沙坪坝区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 334,'九龙坡区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 335,'南岸区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 336,'北碚区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 337,'万盛区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 338,'双桥区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 339,'渝北区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 340,'巴南区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 341,'万州区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 342,'涪陵区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 343,'黔江区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 344,'长寿区',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 345,'合川市',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 346,'永川市',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 347,'江津市',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 348,'南川市',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 349,'綦江县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 350,'潼南县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 351,'铜梁县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 352,'大足县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 353,'璧山县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 354,'垫江县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 355,'武隆县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 356,'丰都县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 357,'城口县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 358,'开县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 359,'巫溪县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 360,'巫山县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 361,'奉节县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 362,'云阳县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 363,'忠县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 364,'石柱土家族自治县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 365,'彭水苗族土家族自治县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 366,'酉阳土家族苗族自治县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 367,'秀山土家族苗族自治县',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 368,'其他',21)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 369,'渝中区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 370,'九龙坡区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 371,'渝北区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 372,'江北区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 373,'南岸区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 374,'沙坪坝区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 375,'万州区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 376,'北碚区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 377,'涪陵区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 378,'合川区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 379,'永川区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 380,'巴南区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 381,'大渡口区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 382,'江津区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 383,'南川区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 384,'长寿区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 385,'黔江区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 386,'开县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 387,'璧山县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 388,'丰都县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 389,'奉节县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 390,'垫江县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 391,'云阳县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 392,'綦江县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 393,'酉阳土家族苗族自治县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 394,'梁平县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 395,'铜梁县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 396,'大足县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 397,'忠县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 398,'石柱土家族自治县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 399,'巫山县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 400,'武隆县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 401,'彭水苗族土家族自治县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 402,'秀山土家族苗族自治县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 403,'城口县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 404,'万盛区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 405,'巫溪县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 406,'荣昌县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 407,'潼南县',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 408,'双桥区',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 409,'成都市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 410,'德阳市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 411,'遂宁市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 412,'凉山彝族自治州',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 413,'广安市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 414,'达州市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 415,'雅安市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 416,'绵阳市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 417,'广元市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 418,'甘孜藏族自治州',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 419,'攀枝花市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 420,'阿坝藏族羌族自治州',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 421,'巴中市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 422,'宜宾市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 423,'乐山市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 424,'内江市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 425,'泸州市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 426,'眉山市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 427,'自贡市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 428,'资阳市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 429,'南充市',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 430,'贵阳市',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 431,'遵义市',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 432,'安顺市',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 433,'黔东南苗族侗族自治州',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 434,'黔南布依族苗族自治州',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 435,'毕节地区',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 436,'六盘水市',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 437,'黔西南布依族苗族自治州',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 438,'铜仁地区',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 439,'其他',24)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 440,'昆明市',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 441,'曲靖市',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 442,'大理白族自治州',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 443,'楚雄彝族自治州',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 444,'玉溪市',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 445,'昭通市',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 446,'普洱市',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 447,'红河哈尼族彝族自治州',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 448,'德宏傣族景颇族自治州',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 449,'保山市',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 450,'丽江市',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 451,'文山壮族苗族自治州',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 452,'西双版纳傣族自治州',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 453,'临沧市',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 454,'怒江傈僳族自治州',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 455,'迪庆藏族自治州',25)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 456,'拉萨市',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 457,'日喀则地区',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 458,'那曲地区',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 459,'昌都地区',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 460,'山南地区',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 461,'阿里地区',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 462,'林芝地区',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 463,'其他',26)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 464,'西安市',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 465,'榆林市',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 466,'宝鸡市',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 467,'咸阳市',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 468,'延安市',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 469,'渭南市',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 470,'汉中市',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 471,'商洛市',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 472,'安康市',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 473,'铜川市',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 474,'其他',27)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 475,'兰州市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 476,'庆阳市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 477,'平凉市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 478,'天水市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 479,'定西市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 480,'酒泉市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 481,'白银市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 482,'金昌市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 483,'张掖市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 484,'嘉峪关市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 485,'武威市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 486,'甘南藏族自治州',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 487,'临夏回族自治州',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 488,'陇南市',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 489,'其他',28)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 490,'西宁市',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 491,'玉树藏族自治州',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 492,'海西蒙古族藏族自治州',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 493,'海南藏族自治州',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 494,'海东地区',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 495,'海北藏族自治州',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 496,'果洛藏族自治州',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 497,'黄南藏族自治州',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 498,'其他',29)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 499,'银川市',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 500,'固原市',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 501,'吴忠市',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 502,'石嘴山市',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 503,'中卫市',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 504,'其他',30)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 505,'乌鲁木齐市',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 506,'巴音郭楞蒙古自治州',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 507,'和田地区',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 508,'哈密地区',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 509,'昌吉回族自治州',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 510,'塔城地区',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 511,'吐鲁番地区',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 512,'阿勒泰地区',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 513,'喀什地区',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 514,'伊犁哈萨克自治州',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 515,'博尔塔拉蒙古自治州',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 516,'阿克苏地区',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 517,'克孜勒苏柯尔克孜自治州',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 518,'克拉玛依市',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 519,'其他',31)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 520,'香港',32)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 521,'其他',32)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 522,'澳门',33)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 523,'其他',33)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 524,'台北市',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 525,'高雄市',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 526,'台中市',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 527,'台南市',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 528,'新竹市',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 529,'基隆市',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 530,'嘉義市',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 531,'台北縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 532,'台中縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 533,'高雄縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 534,'南投縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 535,'台南縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 536,'花蓮縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 537,'屏東縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 538,'桃園縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 539,'彰化縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 540,'台東縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 541,'苗栗縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 542,'宜蘭縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 543,'雲林縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 544,'嘉義縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 545,'新竹縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 546,'澎湖縣',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 547,'其他',34)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 548,'其他',35)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 549,'其他',10)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 550,'其他',22)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 551,'其他',23)
INSERT [Portal_City] ([id],[name],[Pid]) VALUES ( 552,'其他',25)

SET IDENTITY_INSERT [Portal_City] OFF
if exists (select * from sysobjects where id = OBJECT_ID('[Portal_Province ]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Portal_Province ]

CREATE TABLE [Portal_Province ] (
[id] [int]  IDENTITY (1, 1)  NOT NULL,
[name] [varchar]  (50) NULL)

ALTER TABLE [Portal_Province ] WITH NOCHECK ADD  CONSTRAINT [PK_Portal_Province ] PRIMARY KEY  NONCLUSTERED ( [id] )
SET IDENTITY_INSERT [Portal_Province ] ON

INSERT [Portal_Province ] ([id],[name]) VALUES ( 1,'北京市')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 2,'天津市')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 3,'河北省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 4,'山西省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 5,'内蒙古自治区')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 6,'辽宁省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 7,'吉林省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 8,'黑龙江省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 9,'上海市')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 10,'江苏省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 11,'浙江省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 12,'安徽省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 13,'福建省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 14,'江西省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 15,'山东省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 16,'河南省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 17,'湖北省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 18,'湖南省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 19,'广东省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 20,'广西自治区')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 21,'海南省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 22,'重庆市')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 23,'四川省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 24,'贵州省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 25,'云南省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 26,'西藏自治区')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 27,'陕西省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 28,'甘肃省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 29,'青海省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 30,'宁夏回族自治区')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 31,'新疆维吾尔自治区')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 32,'香港特别行政区')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 33,'澳门特别行政区')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 34,'台湾省')
INSERT [Portal_Province ] ([id],[name]) VALUES ( 35,'其它')

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
