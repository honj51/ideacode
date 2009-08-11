use LiveSupport
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_Chat_LiveChat_Operator]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_Chat]'))
ALTER TABLE [dbo].[LiveChat_Chat]  WITH CHECK ADD  CONSTRAINT [FK_LiveChat_Chat_LiveChat_Operator] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[LiveChat_Operator] ([OperatorId])

ALTER TABLE [dbo].[LiveChat_Chat] CHECK CONSTRAINT [FK_LiveChat_Chat_LiveChat_Operator]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_Chat_LiveChat_Visitor]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_Chat]'))
ALTER TABLE [dbo].[LiveChat_Chat]  WITH CHECK ADD  CONSTRAINT [FK_LiveChat_Chat_LiveChat_Visitor] FOREIGN KEY([VisitorId])
REFERENCES [dbo].[LiveChat_Visitor] ([VisitorId])

ALTER TABLE [dbo].[LiveChat_Chat] CHECK CONSTRAINT [FK_LiveChat_Chat_LiveChat_Visitor]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_PageRequest_LiveChat_VisitSession]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_PageRequest]'))
ALTER TABLE [dbo].[LiveChat_PageRequest]  WITH CHECK ADD  CONSTRAINT [FK_LiveChat_PageRequest_LiveChat_VisitSession] FOREIGN KEY([SessionId])
REFERENCES [dbo].[LiveChat_VisitSession] ([SessionId])

ALTER TABLE [dbo].[LiveChat_PageRequest] CHECK CONSTRAINT [FK_LiveChat_PageRequest_LiveChat_VisitSession]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_PageRequest_LiveSupport_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_PageRequest]'))
ALTER TABLE [dbo].[LiveChat_PageRequest]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveChat_PageRequest_LiveSupport_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])

ALTER TABLE [dbo].[LiveChat_PageRequest] CHECK CONSTRAINT [FK_LiveChat_PageRequest_LiveSupport_Account]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_VisitSession_LiveChat_Visitor]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_VisitSession]'))
ALTER TABLE [dbo].[LiveChat_VisitSession]  WITH CHECK ADD  CONSTRAINT [FK_LiveChat_VisitSession_LiveChat_Visitor] FOREIGN KEY([VisitorId])
REFERENCES [dbo].[LiveChat_Visitor] ([VisitorId])

ALTER TABLE [dbo].[LiveChat_VisitSession] CHECK CONSTRAINT [FK_LiveChat_VisitSession_LiveChat_Visitor]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_Message_LiveChat_Chat]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_Message]'))
ALTER TABLE [dbo].[LiveChat_Message]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveChat_Message_LiveChat_Chat] FOREIGN KEY([ChatID])
REFERENCES [dbo].[LiveChat_Chat] ([ChatId])

ALTER TABLE [dbo].[LiveChat_Message] CHECK CONSTRAINT [FK_LiveChat_Message_LiveChat_Chat]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupport_ LeaveWord_LiveSupport_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_LeaveWord]'))
ALTER TABLE [dbo].[LiveSupport_LeaveWord]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveSupport_ LeaveWord_LiveSupport_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])

ALTER TABLE [dbo].[LiveSupport_LeaveWord] CHECK CONSTRAINT [FK_LiveSupport_ LeaveWord_LiveSupport_Account]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupportDepartment_LiveSupport_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_Department]'))
ALTER TABLE [dbo].[LiveSupport_Department]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveSupportDepartment_LiveSupport_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])

ALTER TABLE [dbo].[LiveSupport_Department] CHECK CONSTRAINT [FK_LiveSupportDepartment_LiveSupport_Account]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupport_ClientGrounp_LiveSupport_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_ClientGrounp]'))
ALTER TABLE [dbo].[LiveSupport_ClientGrounp]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveSupport_ClientGrounp_LiveSupport_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])

ALTER TABLE [dbo].[LiveSupport_ClientGrounp] CHECK CONSTRAINT [FK_LiveSupport_ClientGrounp_LiveSupport_Account]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupport_Payment_LiveSupport_Accounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_Payment]'))
ALTER TABLE [dbo].[LiveSupport_Payment]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveSupport_Payment_LiveSupport_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])

ALTER TABLE [dbo].[LiveSupport_Payment] CHECK CONSTRAINT [FK_LiveSupport_Payment_LiveSupport_Accounts]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupport_Payment_LiveSupport_Serivces]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_Payment]'))
ALTER TABLE [dbo].[LiveSupport_Payment]  WITH CHECK ADD  CONSTRAINT [FK_LiveSupport_Payment_LiveSupport_Serivces] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[LiveSupport_Serivces] ([Id])

ALTER TABLE [dbo].[LiveSupport_Payment] CHECK CONSTRAINT [FK_LiveSupport_Payment_LiveSupport_Serivces]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_Operator_LiveChat_Operator]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_Operator]'))
ALTER TABLE [dbo].[LiveChat_Operator]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveChat_Operator_LiveChat_Operator] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[LiveSupport_Department] ([DepartmentId])

ALTER TABLE [dbo].[LiveChat_Operator] CHECK CONSTRAINT [FK_LiveChat_Operator_LiveChat_Operator]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveChat_Operator_LiveSupport_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_Operator]'))
ALTER TABLE [dbo].[LiveChat_Operator]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveChat_Operator_LiveSupport_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])

ALTER TABLE [dbo].[LiveChat_Operator] CHECK CONSTRAINT [FK_LiveChat_Operator_LiveSupport_Account]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_QuickResponse_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveChat_QuickResponse]'))
ALTER TABLE [dbo].[LiveChat_QuickResponse]  WITH NOCHECK ADD  CONSTRAINT [fk_QuickResponse_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[LiveSupport_Account] ([AccountId])
ON DELETE CASCADE

ALTER TABLE [dbo].[LiveChat_QuickResponse] CHECK CONSTRAINT [fk_QuickResponse_Account]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Portal_City_Portal_Province ]') AND parent_object_id = OBJECT_ID(N'[dbo].[Portal_City]'))
ALTER TABLE [dbo].[Portal_City]  WITH CHECK ADD  CONSTRAINT [FK_Portal_City_Portal_Province ] FOREIGN KEY([Pid])
REFERENCES [dbo].[Portal_Province ] ([id])

ALTER TABLE [dbo].[Portal_City] CHECK CONSTRAINT [FK_Portal_City_Portal_Province ]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LiveSupport_Client_LiveSupport_ClientGrounp]') AND parent_object_id = OBJECT_ID(N'[dbo].[LiveSupport_Client]'))
ALTER TABLE [dbo].[LiveSupport_Client]  WITH NOCHECK ADD  CONSTRAINT [FK_LiveSupport_Client_LiveSupport_ClientGrounp] FOREIGN KEY([GrounpId])
REFERENCES [dbo].[LiveSupport_ClientGrounp] ([Id])

ALTER TABLE [dbo].[LiveSupport_Client] CHECK CONSTRAINT [FK_LiveSupport_Client_LiveSupport_ClientGrounp]
