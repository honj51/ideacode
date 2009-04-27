drop proc [dbo].[LiveChat_ChatMessagesGetAll]
/*创建获得所有信息的存储过程*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LiveChat_ChatMessagesGetAll] 
	@ChatID		char(39),
	@Type		int
AS
BEGIN
	select MessageID,
	ChatID,
	FromName,
	[Message],
	SentDate,[Type] from LiveChat_ChatMessages where ChatID=@ChatID and [Type]=@Type
END
GO
