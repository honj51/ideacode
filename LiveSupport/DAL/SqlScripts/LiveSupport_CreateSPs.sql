USE [LiveSupport]
GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_ChatMessagesAdd]    脚本日期: 04/12/2009 22:46:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LiveChat_ChatMessagesAdd]
	@ChatID	char(39),
	@FromName	varchar(100),
	@Message	varchar(3000),
	@SentDate	bigint

AS

INSERT INTO LiveChat_ChatMessages(ChatID, FromName, Message, SentDate)
VALUES(@ChatID, @FromName, @Message, @SentDate)



GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_ChatMessagesGet]    脚本日期: 04/12/2009 22:46:29 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LiveChat_ChatMessagesGet]
	@LastCheck	bigint,
	@ChatID		char(39)

AS

SELECT
	MessageID,
	ChatID,
	FromName,
	Message,
	SentDate
FROM
	LiveChat_ChatMessages
WHERE
	(ChatID = @ChatID) AND
	(MessageID > @LastCheck)
ORDER BY MessageID ASC



GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_ChatRequestsAdd]    脚本日期: 04/12/2009 22:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LiveChat_ChatRequestsAdd]
	@ChatID	char(39),
	@AccountId int,
	@VisitorIP varchar(50),
	@VisitorName varchar(100),
	@VisitorEmail varchar(225),
	@VisitorUserAgent varchar(125),
	@OperatorID int,
	@RequestDate smalldatetime
AS

DECLARE
	@ExistingRequest char(39)

SELECT 
	@ExistingRequest = ChatID
FROM 
	LiveChat_ChatRequests 
WHERE 
	VisitorIP = @VisitorIP AND 
	AccountId = @AccountId AND
	OperatorID = -1

IF @ExistingRequest IS NULL  BEGIN

	INSERT INTO LiveChat_ChatRequests (ChatID, AccountId, VisitorIP, VisitorName, VisitorEmail, VisitorUserAgent, OperatorID, RequestDate)
	VALUES (@ChatID, @AccountId, @VisitorIP, @VisitorName, @VisitorEmail, @VisitorUserAgent, @OperatorID, @RequestDate)

END ELSE BEGIN

	SET @ChatID = @ExistingRequest

END

SELECT @ChatID




GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_ChatRequestsDelete]    脚本日期: 04/12/2009 22:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LiveChat_ChatRequestsDelete]
	@ChatID	char(39)
AS
DELETE FROM LiveChat_ChatRequests
WHERE
	(ChatID = @ChatID)



GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_ChatRequestsGetByChatID]    脚本日期: 04/12/2009 22:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LiveChat_ChatRequestsGetByChatID]
	@ChatID char(39)
AS
SELECT ChatID, AccountId, VisitorIP, VisitorName, VisitorEmail, VisitorUserAgent, OperatorID, RequestDate, AcceptDate, ClosedDate
FROM LiveChat_ChatRequests
WHERE
	ChatID = @ChatID




GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_ChatRequestsGetFromVisitors]    脚本日期: 04/12/2009 22:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LiveChat_ChatRequestsGetFromVisitors]
	@AccountId int,
	@OperatorID	int
AS
SELECT ChatID, AccountId, VisitorIP, VisitorName, VisitorEmail, VisitorUserAgent, OperatorID, RequestDate, AcceptDate, ClosedDate
 FROM LiveChat_ChatRequests
WHERE
	(OperatorID = -1 OR OperatorID = @OperatorID) AND
	(AccountId = @AccountId) AND
	(AcceptDate IS NULL)




GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_ChatRequestsUpdate]    脚本日期: 04/12/2009 22:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LiveChat_ChatRequestsUpdate]
	@ChatID char(39),
	@OperatorID int,
	@AcceptDate smalldatetime
AS

UPDATE LiveChat_ChatRequests SET
	OperatorID = @OperatorID, 
	AcceptDate = @AcceptDate
WHERE
	(ChatID = @ChatID)



GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_CheckNewMessage]    脚本日期: 04/12/2009 22:46:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LiveChat_CheckNewMessage]
	@ChatId	char(39),
	@LastID	bigint
AS

SELECT COUNT(*) FROM LiveChat_ChatMessages
WHERE
	ChatID = @ChatID AND
	MessageID > @LastID



GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_LogAccessAdd]    脚本日期: 04/12/2009 22:46:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LiveChat_LogAccessAdd]
	@AccountId int,
	@PageRequested varchar(500),
	@DomainRequested varchar(250),
	@RequestedTime	smalldatetime,
	@Referrer varchar(500),
	@VisitorUserAgent varchar(100),
	@VisitorIP varchar(50)
AS
INSERT INTO LiveChat_LogAccess (AccountId, PageRequested, DomainRequested, RequestedTime, Referrer, VisitorUserAgent, VisitorIP)
VALUES (@AccountId, @PageRequested, @DomainRequested, @RequestedTime, @Referrer, @VisitorUserAgent, @VisitorIP)




GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_LogAccessGet]    脚本日期: 04/12/2009 22:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LiveChat_LogAccessGet]
	@AccountId int,
	@RequestedTime	smalldatetime
AS

SELECT 
	MAX(LogAccessID) AS LogAccessID, 
	VisitorIP
INTO #result
FROM 
	LiveChat_LogAccess
WHERE
	(RequestedTime > @RequestedTime) AND
	(AccountId = @AccountId)
GROUP BY VisitorIP

SELECT
	DISTINCT
	la.LogAccessID, 
	la.AccountId,
	la.PageRequested, 
	la.DomainRequested, 
	la.RequestedTime,
	la.Referrer, 
	la.VisitorUserAgent, 
	la.VisitorIP, 
	cr.OperatorID,
	o.Name
FROM 
	LiveChat_LogAccess la INNER JOIN #result r ON
	la.LogAccessID = r.LogAccessID LEFT OUTER JOIN LiveChat_ChatRequests cr ON
	r.VisitorIP = cr.VisitorIP LEFT OUTER JOIN LiveChat_Operators o ON cr.OperatorID = o.Id
WHERE
	(DATEDIFF(hh, la.RequestedTime, GETDATE()) < 2)
ORDER BY RequestedTime DESC





GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_LogAccessGetLastID]    脚本日期: 04/12/2009 22:46:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LiveChat_LogAccessGetLastID]

AS
SELECT
	MAX(LogAccessID)
FROM
	LiveChat_LogAccess



GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_OperatorsAdd]    脚本日期: 04/12/2009 22:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LiveChat_OperatorsAdd]
	@Name varchar(100),
	@Password varchar(50),
	@Email varchar(250),
	@Id int
AS
INSERT INTO LiveChat_Operators (Name, Password, Email, IsOnline, Id)
VALUES (@Name, @Password, @Email, 0, @Id)





GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_OperatorsDelete]    脚本日期: 04/12/2009 22:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LiveChat_OperatorsDelete]
	@Id int
AS
DELETE FROM LiveChat_Operators
WHERE
	(Id = @Id)




GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_OperatorsGet]    脚本日期: 04/12/2009 22:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LiveChat_OperatorsGet]
	@Name varchar(100),
	@Password varchar(50),
	@AccountID int
AS

UPDATE LiveChat_Operators SET
	IsOnline = 1
WHERE
	(Name = @Name) AND
	(Password = @Password)

SELECT Id, Name, Password, Email, IsOnline, AccountID
FROM LiveChat_Operators
WHERE
	(Name = @Name) AND
	(Password = @Password) AND
	(AccountID = @AccountID)




GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_OperatorsGetAllOnline]    脚本日期: 04/12/2009 22:46:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LiveChat_OperatorsGetAllOnline]

AS
SELECT Id, AccountId, Name, Password, Email, IsOnline
FROM LiveChat_Operators
WHERE
	(IsOnline = 1)





GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_OperatorsGetByID]    脚本日期: 04/12/2009 22:46:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LiveChat_OperatorsGetByID]
	@Id	int
AS
SELECT Id, Name, Password, Email, IsOnline
FROM LiveChat_Operators
WHERE
	(Id = @Id)





GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_OperatorsGetStatus]    脚本日期: 04/12/2009 22:46:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LiveChat_OperatorsGetStatus]
	@AccountId	int
AS

DECLARE
	@IsOnline bit

SET @IsOnline = 0

-- Any body online

SELECT
	@IsOnline = ISNULL(IsOnline, 0)
FROM
	LiveChat_Operators
WHERE
	(IsOnline = 1) AND
	(AccountId = @AccountId)

SELECT @IsOnline




GO
/****** 对象:  StoredProcedure [dbo].[LiveChat_OperatorsUpdate]    脚本日期: 04/12/2009 22:46:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LiveChat_OperatorsUpdate]
	@Id int,
	@IsOnline bit
AS
UPDATE LiveChat_Operators SET
	IsOnline = @IsOnline
WHERE
	(Id = @Id)


GO
/****** 对象:  StoredProcedure [dbo].[LiveSupport_Accounts_CreateAccount]    脚本日期: 04/12/2009 22:46:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[LiveSupport_Accounts_CreateAccount]
 @AdminUserName	NVARCHAR(256)

as 
declare @AdminUserId uniqueidentifier
select @AdminUserId = UserId from aspnet_users where Username = @AdminUserName
-- todo: check null for AdminUserId
if not exists (select Id from LiveSupport_Accounts where AdminUserId = @AdminUserId)
begin
	insert LiveSupport_Accounts
	(
		AdminUserId	
	)
	values
	(
		@AdminUserId
	)
	return @@identity
end
else
	return 1



GO
/****** 对象:  StoredProcedure [dbo].[LiveSupport_Accounts_FindAccountByAdminUserId]    脚本日期: 04/12/2009 22:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE procedure [dbo].[LiveSupport_Accounts_FindAccountByAdminUserId]
 @AdminUserId	uniqueidentifier
as 

select * from LiveSupport_Accounts a where @AdminUserId= AdminUserId









GO
/****** 对象:  StoredProcedure [dbo].[LiveSupport_Accounts_GetAccountByName]    脚本日期: 04/12/2009 22:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LiveSupport_Accounts_GetAccountByName]
	@Name varchar(100)
AS

SELECT *
FROM LiveSupport_Accounts
WHERE
	(Name = @Name)


GO
/****** 对象:  StoredProcedure [dbo].[LiveSupport_Operators_CreateOperator]    脚本日期: 04/12/2009 22:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[LiveSupport_Operators_CreateOperator]
 @AccountId	int,
 @Name varchar(100), 
 @Password varchar(50),
 @Email varchar(250)

as 
-- TODO: table name is not consistant with sp name
if exists (select Id from LiveChat_Operators where Email = @Email)
	return -1
else if exists (select Id from LiveChat_Operators where Name = @Name)
	return -2
else
begin
	insert LiveChat_Operators
	(
		AccountId,
		Name,
		Password,
		Email
	)
	values
	(
		@AccountId,
		@Name,
		@Password,
		@Email
	)
	return @@identity
end





GO
/****** 对象:  StoredProcedure [dbo].[LiveSupport_Operators_FindOperatorsByAccountId]    脚本日期: 04/12/2009 22:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[LiveSupport_Operators_FindOperatorsByAccountId]
 @AccountId	int

as 
select * from LiveChat_Operators where AccountId = @AccountId


GO
/****** 对象:  StoredProcedure [dbo].[LiveSupport_Operators_GetOperatorById]    脚本日期: 04/12/2009 22:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create procedure [dbo].[LiveSupport_Operators_GetOperatorById]
 @OperatorId	int

as 
select * from LiveChat_Operators where Id = @OperatorId



GO
/****** 对象:  StoredProcedure [dbo].[LiveSupport_Operators_LoginOperator]    脚本日期: 04/12/2009 22:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LiveSupport_Operators_LoginOperator]
	@Name varchar(100),
	@Password varchar(50),
	@AccountId int
AS

UPDATE LiveChat_Operators SET
	IsOnline = 1
WHERE
	(Name = @Name) AND
	(Password = @Password) AND
	(AccountId = @AccountId)

SELECT *
FROM LiveChat_Operators
WHERE
	(Name = @Name) AND
	(Password = @Password) AND
	(@AccountId = AccountId)
return @@Identity


