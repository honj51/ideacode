CREATE PROCEDURE dnt_checkemailandsecques
@username nchar(20),
@email char(32),
@secques char(8)
AS
SELECT TOP 1 [uid] FROM [dnt_users] WHERE [username]=@username AND [email]=@email AND [secques]=@secques


GO


CREATE PROCEDURE dnt_checkpasswordandsecques
@username nchar(20),
@password char(32),
@secques char(8)
AS
SELECT TOP 1 [uid] FROM [dnt_users] WHERE [username]=@username AND [password]=@password AND [secques]=@secques


GO



CREATE PROCEDURE dnt_checkpasswordbyuid
@uid int,
@password char(32)
AS
SELECT TOP 1 [uid], [groupid], [adminid] FROM [dnt_users] WHERE [uid]=@uid AND [password]=@password


GO



CREATE PROCEDURE dnt_checkpasswordbyusername
@username nchar(20),
@password char(32)
AS
SELECT TOP 1 [uid], [groupid], [adminid] FROM [dnt_users] WHERE [username]=@username AND [password]=@password


GO



CREATE PROCEDURE dnt_createadmingroup
	@admingid smallint,
	@alloweditpost tinyint,
	@alloweditpoll tinyint,
	@allowstickthread tinyint,
	@allowmodpost tinyint,
	@allowdelpost tinyint,
	@allowmassprune tinyint,
	@allowrefund tinyint,
	@allowcensorword tinyint,
	@allowviewip tinyint,
	@allowbanip tinyint,
	@allowedituser tinyint,
	@allowmoduser tinyint,
	@allowbanuser tinyint,
	@allowpostannounce tinyint,
	@allowviewlog tinyint,
	@disablepostctrl tinyint,
	@allowviewrealname tinyint
AS
INSERT INTO dnt_admingroups 
	([admingid],[alloweditpost],[alloweditpoll],[allowstickthread],[allowmodpost],[allowdelpost],[allowmassprune],[allowrefund],[allowcensorword],[allowviewip],[allowbanip],[allowedituser],[allowmoduser],[allowbanuser],[allowpostannounce],[allowviewlog],[disablepostctrl],[allowviewrealname])
VALUES
	(@admingid,@alloweditpost,@alloweditpoll,@allowstickthread,@allowmodpost,@allowdelpost,@allowmassprune,@allowrefund,@allowcensorword,@allowviewip,@allowbanip,@allowedituser,@allowmoduser,@allowbanuser,@allowpostannounce,@allowviewlog,@disablepostctrl,@allowviewrealname)
	


GO



CREATE PROCEDURE [dnt_createattachment]
@uid int,
@tid int,
@pid int,
@postdatetime datetime,
@readperm int,
@filename nchar(200),
@description nchar(200),
@filetype nchar(100),
@filesize int,
@attachment nchar(200),
@downloads int,
@extname nvarchar(50),
@attachprice int

AS
DECLARE @aid int

INSERT INTO [dnt_attachments]([uid],[tid], [pid], [postdatetime], [readperm], [filename], [description], [filetype], [filesize],  [attachment], [downloads],[attachprice]) VALUES(@uid, @tid, @pid, @postdatetime, @readperm, @filename, @description, @filetype, @filesize,  @attachment, @downloads, @attachprice)
SELECT SCOPE_IDENTITY()  AS 'aid'

set @aid=(SELECT SCOPE_IDENTITY()  AS 'aid')
UPDATE [dnt_posts1] SET [attachment]=1 WHERE [pid]=@pid


INSERT INTO [dnt_myattachments]([aid],[uid],[attachment],[description],[postdatetime],[downloads],[filename],[pid],[tid],[extname]) VALUES(@aid,@uid,@attachment,@description,@postdatetime,@downloads,@filename,@pid,@tid,@extname)

GO


CREATE PROCEDURE dnt_createdebatepostexpand
	@tid int,
	@pid int,
	@opinion int,
	@diggs int
AS
BEGIN
	INSERT INTO [dnt_postdebatefields] VALUES(@tid, @pid, @opinion, @diggs)
	IF @opinion = 1
		UPDATE [dnt_debates] SET [positivediggs] = [positivediggs] + 1 WHERE [tid] = @tid
	ELSE IF @opinion = 2
		UPDATE [dnt_debates] SET [negativediggs] = [negativediggs] + 1 WHERE [tid] = @tid
END


GO


CREATE PROCEDURE dnt_createfavorite
@uid int,
@tid int,
@type tinyint

AS
	
	INSERT INTO [dnt_favorites] ([uid],[tid],[typeid]) VALUES(@uid,@tid,@type)
	RETURN
	

GO


CREATE PROCEDURE dnt_createpm
@pmid int,
@msgfrom nvarchar(20),
@msgto nvarchar(20),
@msgfromid int,
@msgtoid int,
@folder smallint=0,
@new int=0,
@subject nvarchar(60),
@postdatetime datetime,
@message ntext,
@savetosentbox smallint=1
AS

IF @folder<>0
	BEGIN
		SET @msgfrom=@msgto
	END
ELSE
	BEGIN
		UPDATE [dnt_users] SET [newpmcount]=ABS(ISNULL([newpmcount],0)*1)+1,[newpm] = 1 WHERE [uid]=@msgtoid
	END

	

INSERT INTO [dnt_pms] 
	([msgfrom],[msgfromid],[msgto],[msgtoid],[folder],[new],[subject],[postdatetime],[message])
VALUES
	(@msgfrom,@msgfromid,@msgto,@msgtoid,@folder,@new,@subject,@postdatetime,@message)
	
SELECT SCOPE_IDENTITY() AS 'pmid'

IF @savetosentbox=1 AND @folder=0
	BEGIN
		INSERT INTO [dnt_pms]
			([msgfrom],[msgfromid],[msgto],[msgtoid],[folder],[new],[subject],[postdatetime],[message])
		VALUES
			(@msgfrom,@msgfromid,@msgto,@msgtoid,1,@new,@subject,@postdatetime,@message)
	END


GO



CREATE PROCEDURE dnt_createpost1
@fid int,
@tid int,
@parentid int,
@layer int,
@poster varchar(20),
@posterid int,
@title nvarchar(60),
@topictitle nvarchar(60),
@postdatetime char(20),
@message ntext,
@ip varchar(15),
@lastedit varchar(50),
@invisible int,
@usesig int,
@htmlon int,
@smileyoff int,
@bbcodeoff int,
@parseurloff int,
@attachment int,
@rate int,
@ratetimes int

AS


DEClARE @postid int

DELETE FROM [dnt_postid] WHERE DATEDIFF(n, postdatetime, GETDATE()) >5

INSERT INTO [dnt_postid] ([postdatetime]) VALUES(GETDATE())

SELECT @postid=SCOPE_IDENTITY()

INSERT INTO [dnt_posts1]([pid], [fid], [tid], [parentid], [layer], [poster], [posterid], [title], [postdatetime], [message], [ip], [lastedit], [invisible], [usesig], [htmlon], [smileyoff], [bbcodeoff], [parseurloff], [attachment], [rate], [ratetimes]) VALUES(@postid, @fid, @tid, @parentid, @layer, @poster, @posterid, @title, @postdatetime, @message, @ip, @lastedit, @invisible, @usesig, @htmlon, @smileyoff, @bbcodeoff, @parseurloff, @attachment, @rate, @ratetimes)

IF @parentid=0
	BEGIN
		
		UPDATE [dnt_posts1] SET [parentid]=@postid WHERE [pid]=@postid
	END

IF @@ERROR=0
	BEGIN
		IF  @invisible = 0
		BEGIN
		
			UPDATE [dnt_statistics] SET [totalpost]=[totalpost] + 1
		
		
		
			DECLARE @fidlist AS VARCHAR(1000)
			DECLARE @strsql AS VARCHAR(4000)
			
			SET @fidlist = '';
			
			SELECT @fidlist = ISNULL([parentidlist],'') FROM [dnt_forums] WHERE [fid] = @fid
			IF RTRIM(@fidlist)<>''
				BEGIN
					SET @fidlist = RTRIM(@fidlist) + ',' + CAST(@fid AS VARCHAR(10))
				END
			ELSE
				BEGIN
					SET @fidlist = CAST(@fid AS VARCHAR(10))
				END
        
			
			UPDATE [dnt_forums] SET 
									[posts]=[posts] + 1, 
									[todayposts]=CASE 
													WHEN DATEDIFF(day, [lastpost], GETDATE())=0 THEN [todayposts]*1 + 1 
												 ELSE 1 
												 END,
									[lasttid]=@tid,	
									[lasttitle]=@topictitle,
									[lastpost]=@postdatetime,
									[lastposter]=@poster,
									[lastposterid]=@posterid 
							
							WHERE (CHARINDEX(',' + RTRIM([fid]) + ',', ',' + (SELECT @fidlist AS [fid]) + ',') > 0)
			
			
			UPDATE [dnt_users] SET
				[lastpost] = @postdatetime,
				[lastpostid] = @postid,
				[lastposttitle] = @title,
				[posts] = [posts] + 1,
				[lastactivity] = GETDATE()
			WHERE [uid] = @posterid
        
        
			IF @layer<=0
				BEGIN
					UPDATE [dnt_topics] SET [replies]=0,[lastposter]=@poster,[lastpost]=@postdatetime,[lastposterid]=@posterid WHERE [tid]=@tid
				END
			ELSE
				BEGIN
					UPDATE [dnt_topics] SET [replies]=[replies] + 1,[lastposter]=@poster,[lastpost]=@postdatetime,[lastposterid]=@posterid WHERE [tid]=@tid
				END
		END

		UPDATE [dnt_topics] SET [lastpostid]=@postid WHERE [tid]=@tid

		IF @posterid <> -1
		BEGIN
			INSERT [dnt_myposts]([uid], [tid], [pid], [dateline]) VALUES(@posterid, @tid, @postid, @postdatetime)
		END
	END
	
SELECT @postid AS postid


GO


CREATE PROCEDURE dnt_createsearchcache
	@keywords varchar(255),
	@searchstring varchar(255),
	@ip varchar(15),
	@uid int,
	@groupid int,
	@postdatetime varchar(19),
	@expiration varchar(19),
	@topics int,
	@tids text
AS
INSERT INTO dnt_searchcaches 
	([keywords],[searchstring],[ip],[uid],[groupid],[postdatetime],[expiration],[topics],[tids])
VALUES
	(@keywords,@searchstring,@ip,@uid,@groupid,@postdatetime,@expiration,@topics,@tids)
SELECT SCOPE_IDENTITY()  AS 'searchid'


GO



CREATE PROCEDURE [dnt_createtags]
@tags nvarchar(55),
@userid int,
@postdatetime datetime
AS
BEGIN	
	INSERT INTO [dnt_tags]([tagname], [userid], [postdatetime], [orderid], [color], [count], [fcount], [pcount], [scount], [vcount]) 
		SELECT [item], @userid, @postdatetime, 0, '', 0, 0, 0, 0, 0 FROM [dnt_split](@tags, ' ') AS [newtags] 
		WHERE NOT EXISTS (SELECT [tagname] FROM [dnt_tags] WHERE [newtags].[item] = [tagname])
END

GO


CREATE PROCEDURE dnt_createtopic
@fid smallint,
@iconid smallint,
@title nchar(80),
@typeid smallint,
@readperm int,
@price smallint,
@poster char(20),
@posterid int,
@postdatetime smalldatetime,
@lastpost smalldatetime,
@lastpostid int,
@lastposter char(20),
@views int,
@replies int,
@displayorder int,
@highlight varchar(500),
@digest int,
@rate int,
@hide int,
@attachment int,
@moderated int,
@closed int,
@magic int,
@special tinyint,
@attention int
AS

DECLARE @topicid int

DELETE FROM [dnt_topics] WHERE [tid]>(SELECT ISNULL(max(tid),0)-100 FROM [dnt_topics]) AND [lastpostid]=0

INSERT INTO [dnt_topics]([fid], [iconid], [title], [typeid], [readperm], [price], [poster], [posterid], [postdatetime], [lastpost], [lastpostid], [lastposter], [views], [replies], [displayorder], [highlight], [digest], [rate], [hide], [attachment], [moderated], [closed], [magic], [special],[attention]) VALUES(@fid, @iconid, @title, @typeid, @readperm, @price, @poster, @posterid, @postdatetime, @lastpost, @lastpostid, @lastposter, @views, @replies, @displayorder, @highlight, @digest, @rate, @hide, @attachment, @moderated, @closed, @magic, @special,@attention)

SET @topicid=SCOPE_IDENTITY()

IF @@ERROR=0 AND @displayorder=0
	BEGIN
		UPDATE [dnt_statistics] SET [totaltopic]=[totaltopic] + 1


		UPDATE [dnt_forums] SET [topics] = [topics] + 1,[curtopics] = [curtopics] + 1 WHERE [fid] = @fid
		
		IF @posterid <> -1
		BEGIN
			INSERT INTO [dnt_mytopics]([tid],[uid],[dateline]) VALUES(@topicid,  @posterid,  @postdatetime)
		END
		
	END
	
SELECT @topicid as topicid

GO


CREATE PROCEDURE dnt_createuser
@username nchar(20),
@nickname nchar(20),
@password char(32),
@secques char(8),
@gender int,
@adminid int,
@groupid smallint,
@groupexpiry int,
@extgroupids char(60),
@regip char(15),
@joindate char(19),
@lastip char(15),
@lastvisit char(19),
@lastactivity char(19),
@lastpost char(19),
@lastpostid int,
@lastposttitle nchar(60),
@posts int,
@digestposts smallint,
@oltime int,
@pageviews int,
@credits int,
@extcredits1 float,
@extcredits2 float,
@extcredits3 float,
@extcredits4 float,
@extcredits5 float,
@extcredits6 float,
@extcredits7 float,
@extcredits8 float,
@avatarshowid int,
@email char(50),
@bday char(19),
@sigstatus int,
@tpp int,
@ppp int,
@templateid smallint,
@pmsound int,
@showemail int,
@newsletter int,
@invisible int,
@newpm int,
@accessmasks int,
@website varchar(80),
@icq varchar(12),
@qq varchar(12),
@yahoo varchar(40),
@msn varchar(40),
@skype varchar(40),
@location nvarchar(30),
@customstatus varchar(30),
@avatar varchar(255),
@avatarwidth int,
@avatarheight int,
@medals varchar(300),
@bio nvarchar(500),
@signature nvarchar(500),
@sightml nvarchar(1000),
@authstr varchar(20),
@realname nvarchar(10),
@idcard varchar(20),
@mobile varchar(20),
@phone varchar(20)
AS
DECLARE @uid int

INSERT INTO [dnt_users]([username],[nickname], [password], [secques], [gender], [adminid], [groupid], [groupexpiry], [extgroupids], [regip], [joindate], [lastip], [lastvisit], [lastactivity], [lastpost], [lastpostid], [lastposttitle], [posts], [digestposts], [oltime], [pageviews], [credits], [extcredits1], [extcredits2], [extcredits3], [extcredits4], [extcredits5], [extcredits6], [extcredits7], [extcredits8], [avatarshowid], [email], [bday], [sigstatus], [tpp], [ppp], [templateid], [pmsound], [showemail], [newsletter], [invisible], [newpm], [accessmasks]) VALUES(@username,@nickname, @password, @secques, @gender, @adminid, @groupid, @groupexpiry, @extgroupids, @regip, @joindate, @lastip, @lastvisit, @lastactivity, @lastpost, @lastpostid, @lastposttitle, @posts, @digestposts, @oltime, @pageviews, @credits, @extcredits1, @extcredits2, @extcredits3, @extcredits4, @extcredits5, @extcredits6, @extcredits7, @extcredits8, @avatarshowid, @email, @bday, @sigstatus, @tpp, @ppp, @templateid, @pmsound, @showemail, @newsletter, @invisible, @newpm, @accessmasks)
SELECT SCOPE_IDENTITY()  AS 'userid'
SET @uid = SCOPE_IDENTITY()

IF @@ERROR=0
	BEGIN
		UPDATE [dnt_statistics] SET [totalusers]=[totalusers] + 1,[lastusername]=@username,[lastuserid]=@uid
	END

INSERT INTO dnt_userfields 
	([uid],[website],[icq],[qq],[yahoo],[msn],[skype],[location],[customstatus],[avatar],[avatarwidth],[avatarheight],[medals],[bio],[signature],[sightml],[authstr],[realname],[idcard],[mobile],[phone])
VALUES
	(@uid,@website,@icq,@qq,@yahoo,@msn,@skype,@location,@customstatus,@avatar,@avatarwidth,@avatarheight,@medals,@bio,@signature,@sightml,@authstr,@realname,@idcard,@mobile,@phone)
	

GO



CREATE PROCEDURE dnt_deleteps
	@index int,
	@pmidlist varchar(1000)='',
	@userid int=0
 AS

	DECLARE @strSQL varchar(5000)

	IF @index=0
		BEGIN
			GOTO UserDeletePM
		END



UserDeletePM:

	SET @strSQL='DELETE FROM [dnt_pms] WHERE [pmid] IN (' + @pmidlist + ') AND [userid]=' + STR(@userid)


GO



CREATE PROCEDURE [dnt_deletetopicbytidlist]

	@tidlist AS VARCHAR(2000),
	@posttablename AS VARCHAR(20),
	@chanageposts AS BIT

AS

	DECLARE @postcount int
	DECLARE @topiccount int
	DECLARE @todaycount int
	DECLARE @sqlstr nvarchar(4000)
	DECLARE @fid varchar(2000)
	DECLARE @posterid varchar(200)
	DECLARE @tempFid int
	DECLARE @tempPosterid int
	DECLARE @tempLayer int
	DECLARE @temppostdatetime datetime

	DECLARE @tempfidlist AS VARCHAR(1000)	

	SET @fid = ''
	SET @posterid = ''
	SET @postcount=0
	SET @topiccount=0
	SET @todaycount=0
	
	SET @tempfidlist = '';


	IF @tidlist<>''
		BEGIN
			SET @sqlstr = 'DECLARE cu_dnt_posts CURSOR FOR SELECT [fid],[posterid],[layer],[postdatetime] FROM [' + @posttablename + '] WHERE [tid] IN (' + @tidlist + ')'
			EXEC (@sqlstr)
			OPEN cu_dnt_posts
			FETCH NEXT FROM cu_dnt_posts into @tempFid,@tempPosterid,@tempLayer,@temppostdatetime
			WHILE @@FETCH_STATUS = 0
				BEGIN
					SET @postcount = @postcount + 1
					IF @tempLayer = 0
						BEGIN
							SET @topiccount = @topiccount + 1
							
						END

					IF DATEDIFF(d,@temppostdatetime,GETDATE()) = 0
						BEGIN
							SET @todaycount = @todaycount + 1
						END


					IF CHARINDEX(',' + LTRIM(STR(@tempFid)) + ',',@fid + ',') = 0
						BEGIN
							--SET @fid = @fid + ',' + LTRIM(STR(@tempFid))	
							SELECT @tempfidlist = ISNULL([parentidlist],'') FROM [dnt_forums] WHERE [fid] = @tempFid
							IF RTRIM(@tempfidlist)<>''
								BEGIN
									SET @fid = RTRIM(@fid) + ',' +  RTRIM(@tempfidlist) + ',' + CAST(@tempFid AS VARCHAR(10))
								END
							ELSE
								BEGIN
									SET @fid =RTRIM(@fid) + ',' +  CAST(@tempFid AS VARCHAR(10))
								END

					
						END
					IF @chanageposts = 1
						BEGIN
							UPDATE [dnt_users] SET [posts] = [posts] - 1 WHERE [uid] = @tempPosterid
						END
				
					FETCH NEXT FROM cu_dnt_posts into @tempFid,@tempPosterid,@tempLayer,@temppostdatetime
				END

			CLOSE cu_dnt_posts
			DEALLOCATE cu_dnt_posts

	
			IF LEN(@fid)>0
				BEGIN	

			
					SET @fid = SUBSTRING(@fid,2,LEN(@fid)-1)
		
					IF @chanageposts = 1
						BEGIN
		
							UPDATE [dnt_statistics] SET [totaltopic]=[totaltopic] - @topiccount, [totalpost]=[totalpost] - @postcount

							SET @sqlstr = 'UPDATE [dnt_forums] SET [posts]=[posts] - ' +  cast(@postcount AS VARCHAR(10))  + 
											', [topics]=[topics] - ' + cast(@topiccount AS VARCHAR(10)) + 
											', [todayposts] = [todayposts] - ' + cast(@todaycount AS VARCHAR(10)) + 
									' WHERE [fid] IN (' + @fid + ')'
							EXEC (@sqlstr)
						END
		
					SET @sqlstr = 'DELETE FROM [dnt_favorites] WHERE [tid] IN (' + @tidlist + ') AND [typeid]=0'
					EXEC (@sqlstr)
					
					SET @sqlstr = 'DELETE FROM [dnt_polls] WHERE [tid] IN (' + @tidlist + ')'
					EXEC (@sqlstr)

					SET @sqlstr = 'DELETE FROM [' + @posttablename + '] WHERE [tid] IN (' + @tidlist + ')'
					EXEC (@sqlstr)

					SET @sqlstr = 'DELETE FROM [dnt_mytopics] WHERE [tid] IN (' + @tidlist + ')'
					EXEC(@sqlstr)
				
				END
			SET @sqlstr = 'DELETE FROM [dnt_topics] WHERE [closed] IN (' + @tidlist + ') OR [tid] IN (' + @tidlist + ')'
			EXEC (@sqlstr)
			SET @sqlstr = 'UPDATE [dnt_tags] SET [count]=[count]-1, [fcount]=[fcount]-1 WHERE [tagid] IN (SELECT [tagid] FROM [dnt_topictags] WHERE [tid] IN (' + @tidlist + '))'
			EXEC (@sqlstr)
			SET @sqlstr = 'DELETE FROM [dnt_topictags] WHERE [tid] IN (' + @tidlist + ')'
			EXEC (@sqlstr)
			SET @sqlstr = 'DELETE FROM [dnt_topictagcaches] WHERE [tid] IN (' + @tidlist + ') OR [linktid] IN (' + @tidlist + ')'
		END
		
GO


CREATE PROCEDURE [dnt_deletepost1bypid]
                        @pid int,
			@chanageposts AS BIT
                    AS

                        DECLARE @fid int
                        DECLARE @tid int
                        DECLARE @posterid int
                        DECLARE @lastforumposterid int
                        DECLARE @layer int
                        DECLARE @postdatetime smalldatetime
                        DECLARE @poster varchar(50)
                        DECLARE @postcount int
                        DECLARE @title nchar(60)
                        DECLARE @lasttid int
                        DECLARE @postid int
                        DECLARE @todaycount int
                    	
                    	
                        SELECT @fid = [fid],@tid = [tid],@posterid = [posterid],@layer = [layer], @postdatetime = [postdatetime] FROM [dnt_posts1] WHERE pid = @pid

                        DECLARE @fidlist AS VARCHAR(1000)
                    	
                        SET @fidlist = '';
                    	
                        SELECT @fidlist = ISNULL([parentidlist],'') FROM [dnt_forums] WHERE [fid] = @fid
                        IF RTRIM(@fidlist)<>''
                            BEGIN
                                SET @fidlist = RTRIM(@fidlist) + ',' + CAST(@fid AS VARCHAR(10))
                            END
                        ELSE
                            BEGIN
                                SET @fidlist = CAST(@fid AS VARCHAR(10))
                            END


                        IF @layer<>0

                            BEGIN
                    			
								IF @chanageposts = 1
									BEGIN
										UPDATE [dnt_statistics] SET [totalpost]=[totalpost] - 1

										UPDATE [dnt_forums] SET 
											[posts]=[posts] - 1, 
											[todayposts]=CASE 
																WHEN DATEPART(yyyy, @postdatetime)=DATEPART(yyyy,GETDATE()) AND DATEPART(mm, @postdatetime)=DATEPART(mm,GETDATE()) AND DATEPART(dd, @postdatetime)=DATEPART(dd,GETDATE()) THEN [todayposts] - 1
																ELSE [todayposts]
														END						
										WHERE (CHARINDEX(',' + RTRIM([fid]) + ',', ',' +
															(SELECT @fidlist AS [fid]) + ',') > 0)
                    			
										UPDATE [dnt_users] SET [posts] = [posts] - 1 WHERE [uid] = @posterid

										UPDATE [dnt_topics] SET [replies]=[replies] - 1 WHERE [tid]=@tid
									END
                    			
                                DELETE FROM [dnt_posts1] WHERE [pid]=@pid
                    			
                            END
                        ELSE
                            BEGIN
                    		
                                SELECT @postcount = COUNT([pid]) FROM [dnt_posts1] WHERE [tid] = @tid
                                SELECT @todaycount = COUNT([pid]) FROM [dnt_posts1] WHERE [tid] = @tid AND DATEDIFF(d, [postdatetime], GETDATE()) = 0
                    			
								IF @chanageposts = 1
									BEGIN
										UPDATE [dnt_statistics] SET [totaltopic]=[totaltopic] - 1, [totalpost]=[totalpost] - @postcount
		                    			
										UPDATE [dnt_forums] SET [posts]=[posts] - @postcount, [topics]=[topics] - 1,[todayposts]=[todayposts] - @todaycount WHERE (CHARINDEX(',' + RTRIM([fid]) + ',', ',' +(SELECT @fidlist AS [fid]) + ',') > 0)
		                    			
										UPDATE [dnt_users] SET [posts] = [posts] - @postcount WHERE [uid] = @posterid
                    			
									END

                                DELETE FROM [dnt_posts1] WHERE [tid] = @tid
                    			
                                DELETE FROM [dnt_topics] WHERE [tid] = @tid
                    			
                            END	
                    		

                        IF @layer<>0
                            BEGIN
                                SELECT TOP 1 @pid = [pid], @posterid = [posterid], @postdatetime = [postdatetime], @title = [title], @poster = [poster] FROM [dnt_posts1] WHERE [tid]=@tid ORDER BY [pid] DESC
                                UPDATE [dnt_topics] SET [lastposter]=@poster,[lastpost]=@postdatetime,[lastpostid]=@pid,[lastposterid]=@posterid WHERE [tid]=@tid
                            END



                        SELECT @lasttid = [lasttid] FROM [dnt_forums] WHERE [fid] = @fid

                    	
                        IF @lasttid = @tid
                            BEGIN

                    			
                    			

                                SELECT TOP 1 @pid = [pid], @tid = [tid],@lastforumposterid = [posterid], @title = [title], @postdatetime = [postdatetime], @poster = [poster] FROM [dnt_posts1] WHERE [fid] = @fid ORDER BY [pid] DESC
                    			
                            
                            
                                UPDATE [dnt_forums] SET 
                    			
	                                [lastpost]=@postdatetime,
	                                [lastposter]=ISNULL(@poster,''),
	                                [lastposterid]=ISNULL(@lastforumposterid,'0')

                                WHERE (CHARINDEX(',' + RTRIM([fid]) + ',', ',' +
					                                (SELECT @fidlist AS [fid]) + ',') > 0)


                    			
                                SELECT TOP 1 @pid = [pid], @tid = [tid],@posterid = [posterid], @postdatetime = [postdatetime], @title = [title], @poster = [poster] FROM [dnt_posts1] WHERE [posterid]=@posterid ORDER BY [pid] DESC
                    			
                                UPDATE [dnt_users] SET
                    			
	                                [lastpost] = @postdatetime,
	                                [lastpostid] = @pid,
	                                [lastposttitle] = ISNULL(@title,'')
                    				
                                WHERE [uid] = @posterid
                    			
                            END
GO





CREATE PROCEDURE [dnt_deletetopictags]
	@tid int
 AS
BEGIN       
	UPDATE [dnt_tags] SET [count]=[count]-1,[fcount]=[fcount]-1 
	WHERE EXISTS (SELECT [tagid] FROM [dnt_topictags] WHERE [tid] = @tid AND [tagid] = [dnt_tags].[tagid])

    DELETE FROM [dnt_topictags] WHERE [tid] = @tid	
END

GO



CREATE PROCEDURE [dnt_getadmintopiclist]
@pagesize int,
@pageindex int,
@startnum int,
@condition varchar(80)
AS
DECLARE @strSQL varchar(5000)

IF @pageindex = 1
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[title],

[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[price],

[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[closed],[magic] FROM 

[dnt_topics] WHERE  '+ @condition + ' ORDER BY [lastpostid] DESC'
	END
ELSE
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[title],

[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[price],

[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[closed],[magic] FROM 

[dnt_topics] WHERE [lastpostid] < (SELECT min([lastpostid])  FROM (SELECT TOP ' + STR

((@pageindex-1)*@pagesize-@startnum) + ' [lastpostid] FROM [dnt_topics] WHERE [displayorder]=0' + @condition + ' ORDER BY [lastpostid] DESC) AS tblTmp ) 

AND  ' + @condition + ' ORDER BY [lastpostid] DESC'
	END
EXEC(@strSQL)

GO


CREATE PROCEDURE dnt_getalltopiccount
@fid int
AS

SELECT COUNT(tid) FROM [dnt_topics] WHERE ([fid]=@fid   OR   [fid]  IN (  SELECT fid  FROM [dnt_forums]  WHERE  CHARINDEX(',' + RTRIM(@fid) + ',', ',' + RTRIM(parentidlist) + ',') > 0))  AND [displayorder]>=0


GO


CREATE PROCEDURE [dnt_getdebatepostlist] 
	@tid int,
	@opinion int,
	@pagesize int,
	@pageindex int,
	@posttablename varchar(20),
	@orderby varchar(20),
	@ascdesc varchar(5)
AS
BEGIN
	DECLARE @pagetop int
	SET @pagetop = (@pageindex-1)*@pagesize

	IF @pageindex = 1 
		EXEC('SELECT * FROM ' + @posttablename + ' 
				LEFT JOIN dnt_users ON dnt_users.uid = ' + @posttablename + '.posterid 
				LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid] 
				WHERE ' + @posttablename + '.invisible=0 AND ' + @posttablename + '.pid IN 
					(SELECT TOP ' + @pagesize + ' pid FROM dnt_postdebatefields 
					 WHERE opinion=' + @opinion + ' AND 
							tid=' + @tid+')')
	ELSE
		EXEC('SELECT * FROM ' + @posttablename + ' 
				LEFT JOIN dnt_users ON dnt_users.uid = ' + @posttablename + '.posterid 
				LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid] 
				WHERE ' + @posttablename + '.invisible=0 AND ' + @posttablename + '.pid IN 
					(SELECT TOP ' + @pagesize + ' pid FROM dnt_postdebatefields 
					 WHERE opinion=' + @opinion + ' AND 
							tid=' + @tid+' AND pid > (SELECT MAX(pid) FROM (
								SELECT TOP ' + @pagetop + ' pid FROM dnt_postdebatefields 
								WHERE opinion=' + @opinion + ' AND 
										tid=' + @tid+' ORDER BY pid) AS tblTmp) ORDER BY pid)')
	
END

GO


CREATE PROCEDURE dnt_getfavoritescount
@uid int
AS
SELECT COUNT(uid) as c FROM [dnt_favorites] WHERE [uid]=@uid


GO


CREATE PROCEDURE dnt_getfavoritescountbytype
@uid int,
@typeid tinyint
AS
SELECT COUNT(uid) as c FROM [dnt_favorites] WHERE [uid]=@uid AND [typeid]=@typeid


GO


CREATE PROCEDURE dnt_getfavoriteslist
@uid int,
@pagesize int,
@pageindex int
AS
DECLARE @strSQL varchar(5000)


SET @strSQL='SELECT [f].[uid],[f].[tid],[topics].[title],[topics].[poster],[topics].[postdatetime],[topics].[replies],[topics].[views],[topics].[posterid] FROM [dnt_favorites] [f],[dnt_topics] [topics] WHERE [f].[tid]=[topics].[tid] AND [f].[typeid]=0 AND [f].[uid]=' + STR(@uid)

IF @pageindex = 1
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +'  [uid],[tid],[title],[poster],[postdatetime],[replies],[views],[posterid]  FROM (' + @strSQL + ') f' + '  ORDER BY [tid] DESC'
	END
ELSE
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +'  [uid],[tid],[title],[poster],[postdatetime],[replies],[views],[posterid]  FROM (' + @strSQL + ') f1 WHERE [tid] < (SELECT MIN([tid]) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize) + ' [tid] FROM (' + @strSQL + ') f2' + '  ORDER BY [tid] DESC) AS tblTmp)' + '  ORDER BY [tid] DESC'
	END

EXEC(@strSQL)


GO


CREATE PROCEDURE dnt_getfirstpost1id
@tid int
AS
SELECT TOP 1 [pid] FROM [dnt_posts1] WHERE [tid]=@tid ORDER BY [pid]


GO


CREATE PROCEDURE [dnt_getlastexecutescheduledeventdatetime]
(
	@key VARCHAR(100),
	@servername VARCHAR(100),
	@lastexecuted DATETIME OUTPUT
)
AS
SELECT @lastexecuted = MAX([lastexecuted]) FROM [dnt_scheduledevents] WHERE [key] = @key AND [servername] = @servername

IF(@lastexecuted IS NULL)
BEGIN
	SET @lastexecuted = DATEADD(YEAR,-1,GETDATE())
END

GO




CREATE PROCEDURE [dnt_getlastpostlist]
	@tid int,
	@postnum int,
	@posttablename varchar(20)
AS

EXEC('SELECT TOP ' + @postnum + ' [' + @posttablename + '].[pid], [' + @posttablename + '].[fid], [' + @posttablename + '].[layer], [' + @posttablename + '].[posterid], [' + @posttablename + '].[title], [' + @posttablename + '].[message], [' + @posttablename + '].[postdatetime], [' + @posttablename + '].[attachment], [' + @posttablename + '].[poster], [' + @posttablename + '].[posterid], [' + @posttablename + '].[invisible], [' + @posttablename + '].[usesig], [' + @posttablename + '].[htmlon], [' + @posttablename + '].[smileyoff], [' + @posttablename + '].[parseurloff], [' + @posttablename + '].[bbcodeoff], [' + @posttablename + '].[rate], [' + @posttablename + '].[ratetimes], [dnt_users].[username], [dnt_users].[email], [dnt_users].[showemail], [dnt_userfields].[avatar], [dnt_userfields].[avatarwidth], [dnt_userfields].[avatarheight], [dnt_userfields].[sightml] AS signature, [dnt_userfields].[location], [dnt_userfields].[customstatus] FROM [' + @posttablename + '] LEFT JOIN [dnt_users] ON [dnt_users].[uid]=[' + @posttablename + '].[posterid] LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid] WHERE [' + @posttablename + '].[tid]=' + @tid + '  AND  [' + @posttablename + '].[invisible]=0 ORDER BY [' + @posttablename + '].[pid] DESC')

GO


CREATE PROCEDURE [dnt_getmyattachments]
@uid int,
@pageindex int,
@pagesize int
 AS
DECLARE @strSQL varchar(5000)
IF @pageindex = 1
BEGIN
	SET @strSQL ='select TOP  '+ STR(@pagesize) + ' *  from [dnt_myattachments]  where  [uid]='+STR(@uid)+'  order by [aid] desc'

END
ELSE
BEGIN
	SET @strSQL = 'SELECT TOP  '+STR(@pagesize)+' * FROM [dnt_myattachments] WHERE [aid] >(SELECT ISNULL(MAX([aid]),0) FROM (SELECT TOP '+STR((@pageindex-1)*@pagesize)+' [aid] FROM [dnt_myattachments]  ORDER BY aid) as A) and [uid]='+ STR(@uid)+'  ORDER BY aid '

END
EXEC(@strSQL)

GO




CREATE PROCEDURE [dnt_getmyattachmentsbytype]
@uid int,
@pageindex int,
@pagesize int,
@extlist as varchar(100)
 AS
DECLARE @strSQL varchar(5000)
IF @pageindex = 1
BEGIN
	SET @strSQL ='select TOP '+ STR(@pagesize) + ' *  from [dnt_myattachments] where  [extname] in ('+@extlist+') and [uid]='+STR(@uid)+' order by [aid] desc'

END
ELSE
BEGIN
	SET @strSQL = 'select TOP '+ STR(@pagesize) + ' *  from dnt_myattachments where [extname] in ('+@extlist+')  and [aid] >(SELECT ISNULL(MAX([aid]),0) FROM (SELECT TOP '+STR((@pageindex-1)*@pagesize)+' [aid] FROM [dnt_myattachments]  where [extname] in ('+@extlist+') ORDER BY aid) as A) and [uid]='+STR(@uid)+' ORDER BY aid '

END
EXEC(@strSQL)

GO


CREATE PROCEDURE [dnt_getmyposts]
@uid int,
@pageindex int,
@pagesize int
 AS
DECLARE @strSQL varchar(5000)
IF @pageindex = 1
BEGIN
	SET @strSQL = 'SELECT [tid], [fid], [iconid], [typeid], [readperm], [price], [poster], [posterid], [title], [postdatetime], [lastpost], [lastpostid], [lastposter], [lastposterid], [views], [replies], [displayorder], [highlight], [digest], [rate], [hide], [special], [attachment], [moderated], [closed], [magic]
					 FROM [dnt_topics] 
					WHERE [tid] IN (
							SELECT DISTINCT TOP ' + STR(@pagesize) + ' [tid] 
							FROM [dnt_myposts] 
							WHERE [uid]=' + STR(@uid) + ' 
							ORDER BY [tid] DESC
									) 
					ORDER BY [tid] DESC'
END
ELSE
BEGIN
	SET @strSQL = 'SELECT [tid], [fid], [iconid], [typeid], [readperm], [price], [poster], [posterid], [title], [postdatetime], [lastpost], [lastpostid], [lastposter], [lastposterid], [views], [replies], [displayorder], [highlight], [digest], [rate], [hide], [special], [attachment], [moderated], [closed], [magic]
					 FROM [dnt_topics] 
					WHERE [tid] IN (
							SELECT DISTINCT TOP ' + STR(@pagesize) + ' [tid] 
							FROM [dnt_myposts] 
							WHERE [uid]=' + STR(@uid) + ' 
							AND [tid] < (
										SELECT MIN([tid])
										FROM (
											SELECT DISTINCT TOP ' + STR((@pageindex-1)*@pagesize) + ' [tid] 
											FROM [dnt_myposts]
											WHERE [uid]=' + STR(@uid) + ' 
											ORDER BY [tid] DESC
											 ) AS [ttt]
										)
							ORDER BY [tid] DESC
									) 
					ORDER BY [tid] DESC'

END
EXEC(@strSQL)

GO




CREATE PROCEDURE [dnt_getmytopics]
@uid int,
@pageindex int,
@pagesize int
 AS
DECLARE @strSQL varchar(5000)
IF @pageindex = 1
BEGIN
	SET @strSQL = 'SELECT [tid], [fid], [iconid], [typeid], [readperm], [price], [poster], [posterid], [title], [postdatetime], [lastpost], [lastpostid], [lastposter], [lastposterid], [views], [replies], [displayorder], [highlight], [digest], [rate], [hide], [special], [attachment], [moderated], [closed], [magic]
					 FROM [dnt_topics] 
					WHERE [tid] IN (
							SELECT TOP ' + STR(@pagesize) + ' [tid] 
							FROM [dnt_mytopics] 
							WHERE [uid]=' + STR(@uid) + ' 
							ORDER BY [tid] DESC
									) 
					ORDER BY [tid] DESC'
END
ELSE
BEGIN
	SET @strSQL = 'SELECT [tid], [fid], [iconid], [typeid], [readperm], [price], [poster], [posterid], [title], [postdatetime], [lastpost], [lastpostid], [lastposter], [lastposterid], [views], [replies], [displayorder], [highlight], [digest], [rate], [hide], [special], [attachment], [moderated], [closed], [magic]
					 FROM [dnt_topics] 
					WHERE [tid] IN (
							SELECT TOP ' + STR(@pagesize) + ' [tid] 
							FROM [dnt_mytopics] 
							WHERE [uid]=' + STR(@uid) + ' 
							AND [tid] < (
										SELECT MIN([tid])
										FROM (
											SELECT TOP ' + STR((@pageindex-1)*@pagesize) + ' [tid] 
											FROM [dnt_mytopics]
											WHERE [uid]=' + STR(@uid) + ' 
											ORDER BY [tid] DESC
											 ) AS [ttt]
										)
							ORDER BY [tid] DESC
									) 
					ORDER BY [tid] DESC'

END
EXEC(@strSQL)

GO



CREATE PROCEDURE dnt_getpmcount
@userid int,
@folder int=0,
@state int=-1
AS

IF @folder=-1
	BEGIN
	  SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE ([msgtoid]=@userid AND [folder]=0) OR ([msgfromid] = @userid AND [folder] = 1) OR ([msgfromid] = @userid AND [folder] = 2)
	END
ELSE
    BEGIN
		IF @folder=0
			BEGIN
				IF @state=-1
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgtoid]=@userid AND [folder]=@folder
					END
				ELSE IF @state=2
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgtoid]=@userid AND [folder]=@folder AND [new]=1 AND GETDATE()-[postdatetime]<3
					END
				ELSE
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgtoid]=@userid AND [folder]=@folder AND [new]=@state
					END
			END
		ELSE
			BEGIN
				IF @state=-1
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgfromid]=@userid AND [folder]=@folder
					END
				ELSE IF @state=2
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgfromid]=@userid AND [folder]=@folder AND [new]=1 AND GETDATE()-[postdatetime]<3
					END
				ELSE
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgfromid]=@userid AND [folder]=@folder AND [new]=@state
					END
			END
	END
GO

CREATE PROCEDURE dnt_getnoticecount
@userid int,
@type int = -1,
@state int=-1
AS

	IF @type = -1
		BEGIN
			IF @state = -1
				BEGIN
					SELECT COUNT(nid) AS [pmcount] FROM [dnt_notices] WHERE [uid]=@userid
				END
			ELSE
				BEGIN
					SELECT COUNT(nid) AS [pmcount] FROM [dnt_notices] WHERE [uid]=@userid AND [new]=@state
				END
		END
	ELSE
		BEGIN
			IF @state = -1
				BEGIN
					SELECT COUNT(nid) AS [pmcount] FROM [dnt_notices] WHERE [uid]=@userid AND [type]=@type
				END
			ELSE
				BEGIN
					SELECT COUNT(nid) AS [pmcount] FROM [dnt_notices] WHERE [uid]=@userid AND [new]=@state AND [type]=@type
				END
		END

GO

CREATE PROCEDURE dnt_getpmlist
@userid int,
@folder int=0,
@pagesize int,
@pageindex int,
@strwhere varchar(500)
AS
DECLARE @strSQL varchar(5000)

DECLARE @msgformORtoID varchar(10)
SET @msgformortoid='msgtoid'

IF @folder=1 OR @folder=2
	BEGIN
		SET @msgformortoid='msgfromid'
	END

IF @pageindex = 1
	BEGIN
		IF @strwhere != ''   
			SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [pmid],[msgfrom],[msgfromid],[msgto],[msgtoid],[folder],[new],[subject],[postdatetime],[message] FROM [dnt_pms] WHERE [' + @msgformortoid + ']=' +STR(@userid) + ' AND [folder]=' +STR(@folder) + ' AND ' + @strwhere + ' ORDER BY [pmid] DESC'
		ELSE
			SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [pmid],[msgfrom],[msgfromid],[msgto],[msgtoid],[folder],[new],[subject],[postdatetime],[message] FROM [dnt_pms] WHERE [' + @msgformortoid + ']=' +STR(@userid) + ' AND [folder]=' +STR(@folder) + ' ORDER BY [pmid] DESC'
		
	END
ELSE
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [pmid],[msgfrom],[msgfromid],[msgto],[msgtoid],[folder],[new],[subject],[postdatetime],[message] FROM [dnt_pms] WHERE [pmid] < (SELECT MIN([pmid]) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize) + ' [pmid] FROM [dnt_pms] WHERE [' + @msgformortoid + ']=' +STR(@userid) + ' AND [folder]=' +STR(@folder) + ' ORDER BY [pmid] DESC) AS tblTmp) AND [' + @msgformortoid + ']=' +STR(@userid) + ' AND [folder]=' + STR(@folder) + ' ORDER BY [pmid] DESC'
		IF @strwhere != ''
			BEGIN
				SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [pmid],[msgfrom],[msgfromid],[msgto],[msgtoid],[folder],[new],[subject],[postdatetime],[message] FROM [dnt_pms] WHERE [pmid] < (SELECT MIN([pmid]) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize) + ' [pmid] FROM [dnt_pms] WHERE [' + @msgformortoid + ']=' +STR(@userid) + ' AND [folder]=' +STR(@folder) + ' AND ' + @strwhere + ' ORDER BY [pmid] DESC) AS tblTmp) AND [' + @msgformortoid + ']=' +STR(@userid) + ' AND [folder]=' +STR(@folder) + ' AND ' + @strwhere + ' ORDER BY [pmid] DESC'
			END
	END

EXEC(@strSQL)


GO

CREATE PROCEDURE dnt_getpost1count
@tid int
AS
SELECT COUNT(pid) FROM [dnt_posts1] WHERE [tid]=@tid AND [invisible]=0 AND layer>0


GO


CREATE PROCEDURE dnt_getpost1tree
@tid int
AS
SELECT [pid], [layer], [title], [poster], [posterid],[postdatetime],[message] FROM [dnt_posts1] WHERE [tid]=@tid AND [invisible]=0 ORDER BY [parentid];


GO


CREATE PROCEDURE dnt_getpostcountbycondition
@condition varchar(100),
@posttablename varchar(20)
AS
declare @strSQL varchar(200)
set @strSQL ='SELECT COUNT(pid) FROM [' + @posttablename + '] WHERE '+@condition+ ' AND [layer]>=0'

EXEC(@strSQL)

GO

CREATE PROCEDURE dnt_getshortuserinfo
@uid int
AS
SELECT TOP 1 * FROM [dnt_users] WHERE [uid]=@uid
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getsinglepost1]') and OBJECTPROPERTY(id,N'IsProcedure') = 1)
drop procedure [dnt_getsinglepost1]
GO

CREATE PROCEDURE [dnt_getsinglepost1]
                    @tid int,
                    @pid int
                    AS
                    SELECT [aid], [tid], [pid], [postdatetime], [readperm], [filename], [description], [filetype], [filesize], [attachment], [downloads], [attachprice], [uid]  FROM [dnt_attachments] WHERE [tid]=@tid

                    SELECT TOP 1 
	                                [dnt_posts1].[pid], 
	                                [dnt_posts1].[fid], 
	                                [dnt_posts1].[title], 
	                                [dnt_posts1].[layer],
	                                [dnt_posts1].[message], 
	                                [dnt_posts1].[ip], 
	                                [dnt_posts1].[lastedit], 
	                                [dnt_posts1].[postdatetime], 
	                                [dnt_posts1].[attachment], 
	                                [dnt_posts1].[poster], 
	                                [dnt_posts1].[invisible], 
	                                [dnt_posts1].[usesig], 
	                                [dnt_posts1].[htmlon], 
	                                [dnt_posts1].[smileyoff], 
	                                [dnt_posts1].[parseurloff], 
	                                [dnt_posts1].[bbcodeoff], 
	                                [dnt_posts1].[rate], 
	                                [dnt_posts1].[ratetimes], 
	                                [dnt_posts1].[posterid], 
	                                [dnt_users].[nickname],  
	                                [dnt_users].[username], 
	                                [dnt_users].[groupid],
                                    [dnt_users].[spaceid],
                                    [dnt_users].[gender],
									[dnt_users].[bday], 
	                                [dnt_users].[email], 
	                                [dnt_users].[showemail], 
	                                [dnt_users].[digestposts], 
	                                [dnt_users].[credits], 
	                                [dnt_users].[extcredits1], 
	                                [dnt_users].[extcredits2], 
	                                [dnt_users].[extcredits3], 
	                                [dnt_users].[extcredits4], 
	                                [dnt_users].[extcredits5], 
	                                [dnt_users].[extcredits6], 
	                                [dnt_users].[extcredits7], 
	                                [dnt_users].[extcredits8], 
	                                [dnt_users].[posts], 
	                                [dnt_users].[joindate], 
	                                [dnt_users].[onlinestate], 
	                                [dnt_users].[lastactivity], 
	                                [dnt_users].[invisible], 
	                                [dnt_userfields].[avatar], 
	                                [dnt_userfields].[avatarwidth], 
	                                [dnt_userfields].[avatarheight], 
	                                [dnt_userfields].[medals], 
	                                [dnt_userfields].[sightml] AS signature, 
	                                [dnt_userfields].[location], 
	                                [dnt_userfields].[customstatus], 
	                                [dnt_userfields].[website], 
	                                [dnt_userfields].[icq], 
	                                [dnt_userfields].[qq], 
	                                [dnt_userfields].[msn], 
	                                [dnt_userfields].[yahoo], 
	                                [dnt_userfields].[skype] 
                    FROM [dnt_posts1] LEFT JOIN [dnt_users] ON [dnt_users].[uid]=[dnt_posts1].[posterid] LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid] WHERE [dnt_posts1].[pid]=@pid

GO


CREATE PROCEDURE dnt_getsitemapnewtopics
@fidlist VARCHAR(500)
AS
IF @fidlist<>''
     BEGIN
      DECLARE @strSQL VARCHAR(5000)
      SET @strSQL = 'SELECT TOP 20 [tid], [fid], [title], [poster], [postdatetime], [lastpost], [replies], [views], [digest] FROM [dnt_topics] WHERE [fid] 
NOT IN ('+@fidlist +') ORDER BY [tid] DESC' 
     END
ELSE
     BEGIN
      SET @strSQL = 'SELECT TOP 20 [tid], [fid], [title], [poster], [postdatetime], [lastpost], [replies], [views], [digest] FROM [dnt_topics] ORDER BY [tid] 
DESC'
     END
  EXEC(@strSQL)


GO


CREATE PROCEDURE dnt_gettopiccount
@fid int
AS
SELECT [curtopics] FROM [dnt_forums] WHERE [fid]=@fid


GO


CREATE PROCEDURE dnt_gettopiccountbycondition
@fid int,
@state int=0,
@condition varchar(80)=null
AS
DECLARE @sql varchar(500)
IF @state=-1
	BEGIN
		set @sql ='SELECT COUNT(tid) FROM [dnt_topics] WHERE [fid]='+str(@fid)+' AND [displayorder]>-1 AND [closed]<=1'+@condition
	END
ELSE
	BEGIN
set @sql ='SELECT COUNT(tid) FROM [dnt_topics] WHERE [fid]='+str(@fid)+' AND [displayorder]>-1 AND [closed]='+str(@state)+' AND [closed]<=1'+@condition
	END
exec(@sql)


GO



CREATE PROCEDURE dnt_gettopiccountbytype
@condition varchar(4000)
AS
DECLARE @sql varchar(4100)

set @sql ='SELECT COUNT(tid) FROM [dnt_topics] WHERE [displayorder]>-1 AND [closed]<=1 '+@condition
exec(@sql)


GO


CREATE PROCEDURE [dnt_gettopiclist]
@fid int,
@pagesize int,
@pageindex int,
@startnum int,
@condition varchar(80)
AS
DECLARE @strSQL varchar(5000)

IF @pageindex = 1
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [rate],[tid],[iconid],[typeid],[title],[price],[hide],[readperm],

[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],

[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[special] FROM 

[dnt_topics] WHERE [fid]=' +STR(@fid) + ' AND [displayorder]=0' + @condition + ' ORDER BY [lastpostid] DESC'
	END
ELSE
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +'[rate], [tid],[iconid],[typeid],[title],[price],[hide],[readperm],

[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],

[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[special] FROM 

[dnt_topics] WHERE [lastpostid] < (SELECT min([lastpostid])  FROM (SELECT TOP ' + STR

((@pageindex-1)*@pagesize-@startnum) + ' [lastpostid] FROM [dnt_topics] WHERE [fid]=' +STR

(@fid) + ' AND [displayorder]=0' + @condition + ' ORDER BY [lastpostid] DESC) AS tblTmp ) 

AND [fid]=' +STR(@fid) + ' AND [displayorder]=0' + @condition + ' ORDER BY [lastpostid] DESC'
	END
EXEC(@strSQL)

GO

CREATE  PROCEDURE dnt_gettopiclistbydate
@fid int,
@pagesize int,
@pageindex int,
@startnum int,
@condition varchar(100),
@orderby varchar(100),
@ascdesc int
AS

DECLARE @strsql varchar(5000)
DECLARE @sorttype varchar(5)

IF @ascdesc=0
   SET @sorttype='ASC'
ELSE
   SET @sorttype='DESC'

IF @pageindex = 1
	BEGIN
		SET @strsql = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[title],[price],[typeid],[readperm],[hide],[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[rate] FROM [dnt_topics] WHERE [fid]=' +STR(@fid) + ' AND [displayorder]=0'+@condition+' ORDER BY '+@orderby+' '+@sorttype
	END
ELSE
           IF @sorttype='DESC'
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[title],[price],[typeid],[hide],[readperm],[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[rate] FROM [dnt_topics] WHERE ['+@orderby+'] < (SELECT min(['+@orderby+']) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize-@startnum) + ' ['+@orderby+']  FROM [dnt_topics] WHERE [fid]=' +STR(@fid) + ' AND [displayorder]=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype+')AS tblTmp ) AND [fid]=' +STR(@fid) + ' AND [displayorder]=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype
	END
      ELSE
             BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[title],[price],[hide],[typeid],[readperm],[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[rate] FROM [dnt_topics] WHERE ['+@orderby+'] > (SELECT MAX(['+@orderby+']) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize-@startnum) + ' ['+@orderby+'] FROM [dnt_topics] WHERE [fid]=' +STR(@fid) + ' AND [displayorder]=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype+')AS tblTmp ) AND [fid]=' +STR(@fid) + ' AND [displayorder]=0'+@condition+' ORDER BY '+@orderby+' '+@sorttype
            END
EXEC(@strsql)

GO


CREATE PROCEDURE dnt_gettopiclistbynumber
( 
@orderfield varchar(100),
@pageindex int,
@pagesize int=16,
@strwhere varchar(200),
@ordertype bit=1
) 
AS 
Declare @tablename varchar(100);
set @tablename='dnt_topics'
Declare @fieldlist varchar(500);
set  @fieldlist=' [tid],[iconid],[title],[price],[hide],[readperm],[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[rate]'
Declare @keyfield varchar(100);
set  @keyfield=' tid'


 SET NOCOUNT ON 
    declare @sqlstr varchar(6000) 
    set @strwhere=replace(@strwhere,'''','''''') 
    set @strwhere=replace(@strwhere,'--','') 
    set @strwhere=replace(@strwhere,';','') 
    set @sqlstr='declare @CurPageNum int;' 
    set @sqlstr=@sqlstr+'declare @nextpagenum int;' 
    set @sqlstr=@sqlstr+'set @curpagenum='+cast(@PageIndex as varchar)+'*'+cast(@Pagesize as varchar)+';' 
    set @sqlstr=@sqlstr+'set @nextpagenum='+cast(@PageIndex+1 as varchar)+'*'+cast(@Pagesize as varchar)+';' 
    set @sqlstr=@sqlstr+'declare @sqlstr varchar(6000);' 
    if @ordertype=1 
    begin 
    set @sqlstr=@sqlstr+'set @sqlstr=''select '+@fieldlist+' from ( select top ''+cast(@nextpagenum as varchar)+'' * from  
 
'+@tablename+'  where '+@strwhere+' order by '+@orderfield+' desc ) as a where '+@keyfield+' not in (  
 
select top ''+cast(@curpagenum as varchar)+'' '+@keyfield+' from '+@tablename+' where '+@strwhere+'  
 
order by '+@orderfield+' desc) order by '+@orderfield+' desc'';' 
    end 
    else 
    begin 
    set @sqlstr=@sqlstr+'set @sqlstr=''select '+@fieldlist+' from ( select top ''+cast(@nextpagenum as varchar)+'' * from  
 
'+@tablename+'  where '+@strwhere+' order by '+@orderfield+' asc ) as a where '+@keyfield+' not in (  
 
select top ''+cast(@curpagenum as varchar)+'' '+@keyfield+' from '+@tablename+' where '+@strwhere+'  
 
order by '+@orderfield+' asc) order by '+@orderfield+' asc'';' 
    end 
    set @sqlstr=@sqlstr+'execute( @sqlstr)' 
    execute(@sqlstr)
    

GO


CREATE PROCEDURE [dnt_gettopiclistbytag]	
	@tagid int,
	@pageindex int,
	@pagesize int
AS
BEGIN
	DECLARE @strSQL varchar(2000)
	IF @pageindex = 1
	BEGIN
		SET @strSQL='SELECT TOP ' + STR(@pagesize) + ' [t].[tid], [t].[title],[t].[poster],[t].[posterid],[t].[fid],[t].[postdatetime],[t].[replies],[t].[views],[t].[lastposter],[t].[lastposterid],[t].[lastpost] 
		FROM [dnt_topictags] AS [tt], [dnt_topics] AS [t] 
		WHERE [t].[tid] = [tt].[tid] AND [t].[displayorder] >=0 AND [tt].[tagid] = ' + STR(@tagid) + ' 
		ORDER BY [t].[lastpostid] DESC'
	END
	ELSE
	BEGIN
		SET @strSQL='SELECT TOP ' + STR(@pagesize) + ' [t].[tid], [t].[title],[t].[poster],[t].[posterid],[t].[fid],[t].[postdatetime],[t].[replies],[t].[views],[t].[lastposter],[t].[lastposterid],[t].[lastpost] 
		FROM [dnt_topictags] AS [tt], [dnt_topics] AS [t] 
		WHERE [t].[tid] = [tt].[tid] AND [t].[displayorder] >=0 AND [tt].[tagid] = ' + STR(@tagid) + ' 
		AND [t].[lastpostid] < (SELECT MIN([lastpostid]) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize) + ' 
		[lastpostid] FROM [dnt_topictags] AS [tt], [dnt_topics] AS [t] 
		WHERE [t].[tid] = [tt].[tid] AND [t].[displayorder] >=0 AND [tt].[tagid] = ' + STR(@tagid) + ' 
		ORDER BY [t].[lastpostid] DESC) as tblTmp) 
		ORDER BY [t].[lastpostid] DESC'
	END
	EXEC(@strSQL)
END

GO


CREATE PROCEDURE [dnt_gettopiclistbytype]
@pagesize int,
@pageindex int,
@startnum int,
@condition varchar(1000),
@ascdesc int
AS
DECLARE @strSQL varchar(5000)

DECLARE @sorttype varchar(5)

IF @ascdesc=0
   SET @sorttype='ASC'
ELSE
   SET @sorttype='DESC'

IF @pageindex = 1
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[price],[hide],[readperm],

[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],

[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[rate] FROM 

[dnt_topics] WHERE  [displayorder]>=0' + @condition + ' ORDER BY [tid] '+@sorttype +',  [lastpostid] '+@sorttype
	END
ELSE
	BEGIN
		IF @sorttype='DESC'
		BEGIN
			SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[price],[hide],[readperm],
	
	[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],
	
	[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[rate] FROM 
	
	[dnt_topics] WHERE [lastpostid] < (SELECT min([lastpostid])  FROM (SELECT TOP ' + STR
	
	((@pageindex-1)*@pagesize-@startnum) + ' [lastpostid] FROM [dnt_topics] WHERE  [displayorder]>=0' + @condition + ' ORDER BY [tid] ' + @sorttype + ' , [lastpostid] ' + @sorttype + ') AS tblTmp ) 
	
	AND  [displayorder]>=0' + @condition +'ORDER BY [tid] ' + @sorttype + ' ,  [lastpostid] ' + @sorttype
		END
		ELSE
		BEGIN
			SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[price],[hide],[readperm],
	
	[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],
	
	[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic] FROM 
	
	[dnt_topics] WHERE [lastpostid] > (SELECT MAX([lastpostid])  FROM (SELECT TOP ' + STR
	
	((@pageindex-1)*@pagesize-@startnum) + ' [lastpostid] FROM [dnt_topics] WHERE  [displayorder]>=0' + @condition + ' ORDER BY [tid] ' + @sorttype + ' , [lastpostid] ' + @sorttype + ') AS tblTmp ) 
	
	AND  [displayorder]>=0' + @condition +'ORDER BY [tid] ' + @sorttype + ' ,  [lastpostid] ' + @sorttype
		END
	END
EXEC(@strSQL)

GO

CREATE PROCEDURE dnt_gettopiclistbytypedate
@pagesize int,
@pageindex int,
@startnum int,
@condition varchar(1000),
@orderby varchar(100),
@ascdesc int
AS

DECLARE @strsql varchar(5000)
DECLARE @sorttype varchar(5)

IF @ascdesc=0
   SET @sorttype='ASC'
ELSE
   SET @sorttype='DESC'

IF @pageindex = 1
	BEGIN
		SET @strsql = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[special],[price],[hide],[readperm],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[closed],[attachment],[magic],[rate] FROM [dnt_topics] WHERE [displayorder]>=0'+@condition+' ORDER BY '+@orderby+' '+@sorttype
	END
ELSE
           IF @sorttype='DESC'
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[special],[price],[hide],[readperm],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[closed],[attachment],[magic],[rate] FROM [dnt_topics] WHERE ['+@orderby+'] < (SELECT min(['+@orderby+']) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize-@startnum) + ' ['+@orderby+']  FROM [dnt_topics] WHERE  [displayorder]>=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype+')AS tblTmp ) AND [displayorder]>=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype
	END
      ELSE
             BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[special],[price],[hide],[readperm],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[closed],[attachment],[magic],[rate] FROM [dnt_topics] WHERE ['+@orderby+'] > (SELECT MAX(['+@orderby+']) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize-@startnum) + ' ['+@orderby+'] FROM [dnt_topics] WHERE [displayorder]>=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype+')AS tblTmp ) AND [displayorder]>=0'+@condition+' ORDER BY '+@orderby+' '+@sorttype
            END

EXEC(@strsql)

GO


CREATE PROCEDURE dnt_gettoptopiclist
@fid int,
@pagesize int,
@pageindex int,
@tids varchar(500)
AS
DECLARE @strSQL varchar(5000)

IF @pageindex = 1
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) + '[rate], [tid],[fid],[typeid],[iconid],[title],[price],[hide],[readperm], [special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[closed],[attachment],[magic],[special] FROM [dnt_topics] WHERE [displayorder]>0 AND charindex('',''+CAST([tid] AS varchar(10))+'','' , '','+@tids+','')>0  ORDER BY [lastpost] DESC'
	END
ELSE
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) + ' [rate],[tid], [fid],[typeid], [iconid], [title], [price], [hide], [readperm], [special], [poster], [posterid], [replies], [views], 
      [postdatetime], [lastpost], [lastposter], [lastpostid], [lastposterid], [replies] AS Expr1, [highlight], 
      [digest], [displayorder], [closed], [attachment],[magic],[special] FROM dnt_topics
WHERE (EXISTS   (SELECT TOP ' + STR((@pageindex-1)*@pagesize) + ' [tid]
                 FROM [dnt_topics]
                 WHERE [displayorder] > 0 AND  charindex('',''+CAST([tid] AS varchar(10))+'','' , '','+@tids+','')>0
                 ORDER BY [lastpost] DESC)) AND (displayorder > 0) AND 
      ( charindex('',''+CAST([tid] AS varchar(10))+'','' , '','+@tids+','')>0)
ORDER BY lastpost DESC'
	
	END

EXEC(@strSQL)

GO

CREATE PROCEDURE dnt_getuserinfo
@uid int
AS
SELECT TOP 1 [dnt_users].*, [dnt_userfields].* FROM [dnt_users] LEFT JOIN [dnt_userfields] ON [dnt_users].[uid]=[dnt_userfields].[uid] WHERE [dnt_users].[uid]=@uid


GO


CREATE PROCEDURE [dnt_getuserlist]
@pagesize int,
@pageindex int,
@orderby AS varchar(200)
AS
DECLARE @pagetop int
DECLARE @sql varchar(1000)

SET @pagetop = (@pageindex-1)*@pagesize

IF @pageindex = 1
	BEGIN
	SET @sql = 'SELECT TOP ' + CAST(@pagesize AS varchar(10)) + ' [dnt_users].[uid], 
									[dnt_users].[groupid],
									[dnt_users].[username], 
									[dnt_users].[nickname], 
									[dnt_users].[joindate], 
									[dnt_users].[credits], 
									[dnt_users].[posts], 
									[dnt_users].[lastactivity], 
									[dnt_users].[email], 
									[dnt_users].[oltime], 
									[dnt_userfields].[location] 
					FROM [dnt_users] LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid] ' + @orderby
	END
ELSE
	BEGIN
		SET @sql = 'SELECT TOP ' + CAST(@pagesize AS varchar(10)) + ' [dnt_users].[uid], [dnt_users].[groupid], [dnt_users].[username], [dnt_users].[nickname], [dnt_users].[joindate], [dnt_users].[credits], [dnt_users].[posts], [dnt_users].[email], [dnt_users].[lastactivity], [dnt_users].[oltime], [dnt_userfields].[location] FROM [dnt_users] LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid] WHERE [dnt_users].[uid] NOT IN (SELECT TOP ' + CAST(@pagetop AS varchar(10)) + ' [uid] FROM [dnt_users]  ' + @orderby + ') '+ replace(@orderby,'WHERE','AND')

	END
	
	EXEC(@sql)

GO





CREATE PROCEDURE [dnt_neatenrelatetopic]
AS
BEGIN
	DECLARE @tagid int
	DECLARE [tag_cursor] CURSOR FOR	
	SELECT DISTINCT [tagid] FROM [dnt_topictags]
	OPEN [tag_cursor]
	FETCH NEXT FROM [tag_cursor] INTO @tagid
	WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO [dnt_topictagcaches] 
			SELECT [t1].[tid],[t2].[tid],[t2].[title] FROM (SELECT [tid] FROM [dnt_topictags]
				WHERE [tagid] = @tagid) AS [t1],(SELECT [t].[tid],[t].[title] FROM [dnt_topics] AS [t],[dnt_topictags] AS [tt] 
				WHERE [tt].[tagid] = @tagid AND [t].[tid] = [tt].[tid] AND [t].[displayorder] >=0) AS [t2] 
			WHERE [t1].[tid] <> [t2].[tid] AND NOT EXISTS (SELECT 1 FROM [dnt_topictagcaches] WHERE [tid]=[t1].[tid] AND [linktid]=[t2].[tid])
			

			FETCH NEXT FROM [tag_cursor] INTO @tagid
		END;
	CLOSE [tag_cursor]
	DEALLOCATE [tag_cursor]

END

GO


CREATE PROCEDURE [dnt_revisedebatetopicdiggs]
	@tid int,
	@opinion int,
	@count int out
AS
BEGIN
	SELECT @count=COUNT(1) FROM [dnt_postdebatefields] WHERE [tid] = @tid AND [opinion] = @opinion
	IF @opinion=1
	BEGIN
		UPDATE [dnt_debates] SET [positivediggs]= @count WHERE [tid] = @tid
	END
	ELSE
	BEGIN
		UPDATE [dnt_debates] SET [negativediggs]= @count WHERE [tid] = @tid
	END
END

GO


CREATE PROCEDURE [dnt_setlastexecutescheduledeventdatetime]
(
	@key VARCHAR(100),
	@servername VARCHAR(100),
	@lastexecuted DATETIME
)
AS
DELETE FROM [dnt_scheduledevents] WHERE ([key]=@key) AND ([lastexecuted] < DATEADD([day], - 7, GETDATE()))

INSERT [dnt_scheduledevents] ([key], [servername], [lastexecuted]) Values (@key, @servername, @lastexecuted)

GO


CREATE PROCEDURE dnt_shrinklog  
@DBName  nchar(50) 
AS
Begin
	exec('BACKUP LOG ['+@DBName+']  WITH NO_LOG')
	exec('DBCC  SHRINKDATABASE(['+@DBName+'])')
End


GO


CREATE PROCEDURE dnt_updateadmingroup
	@admingid smallint,
	@alloweditpost tinyint,
	@alloweditpoll tinyint,
	@allowstickthread tinyint,
	@allowmodpost tinyint,
	@allowdelpost tinyint,
	@allowmassprune tinyint,
	@allowrefund tinyint,
	@allowcensorword tinyint,
	@allowviewip tinyint,
	@allowbanip tinyint,
	@allowedituser tinyint,
	@allowmoduser tinyint,
	@allowbanuser tinyint,
	@allowpostannounce tinyint,
	@allowviewlog tinyint,
	@disablepostctrl tinyint,
	@allowviewrealname tinyint
AS
UPDATE dnt_admingroups SET 
	[alloweditpost]=@alloweditpost,
	[alloweditpoll]=@alloweditpoll,
	[allowstickthread]=@allowstickthread,
	[allowmodpost]=@allowmodpost,
	[allowdelpost]=@allowdelpost,
	[allowmassprune]=@allowmassprune,
	[allowrefund]=@allowrefund,
	[allowcensorword]=@allowcensorword,
	[allowviewip]=@allowviewip,
	[allowbanip]=@allowbanip,
	[allowedituser]=@allowedituser,
	[allowmoduser]=@allowmoduser,
	[allowbanuser]=@allowbanuser,
	[allowpostannounce]=@allowpostannounce,
	[allowviewlog]=@allowviewlog,
	[disablepostctrl]=@disablepostctrl,
	[allowviewrealname]=@allowviewrealname
WHERE [admingid]=@admingid


GO


CREATE PROCEDURE dnt_updatepost1
	@pid int,
	@title nvarchar(160),
	@message ntext,
	@lastedit nvarchar(50),
	@invisible int,
	@usesig int,
	@htmlon int,
	@smileyoff int,
	@bbcodeoff int,
	@parseurloff int
AS
UPDATE dnt_posts1 SET 
	[title]=@title,
	[message]=@message,
	[lastedit]=@lastedit,
	[invisible]=@invisible,
	[usesig]=@usesig,
	[htmlon]=@htmlon,
	[smileyoff]=@smileyoff,
	[bbcodeoff]=@bbcodeoff,
	[parseurloff]=@parseurloff WHERE [pid]=@pid


GO

CREATE PROCEDURE dnt_updatetopic
	@tid int,
	@fid smallint,
	@iconid smallint,
	@title nchar(60),
	@typeid smallint,
	@readperm int,
	@price smallint,
	@poster char(20),
	@posterid int,
	@postdatetime smalldatetime,
	@lastpost smalldatetime,
	@lastposter char(20),
	@replies int,
	@displayorder int,
	@highlight varchar(500),
	@digest int,
	@rate int,
	@hide int,
    @special int,
	@attachment int,
	@moderated int,
	@closed int,
	@magic int
AS
UPDATE dnt_topics SET
	[fid]=@fid,
	[iconid]=@iconid,
	[title]=@title,
	[typeid]=@typeid,
	[readperm]=@readperm,
	[price]=@price,
	[poster]=@poster,
	[posterid]=@posterid,
	[postdatetime]=@postdatetime,
	[lastpost]=@lastpost,
	[lastposter]=@lastposter,
	[replies]=@replies,
	[displayorder]=@displayorder,
	[highlight]=@highlight,
	[digest]=@digest,
	[rate]=@rate,
	[hide]=@hide,
    [special]=@special,
	[attachment]=@attachment,
	[moderated]=@moderated,
	[closed]=@closed,
	[magic]=@magic WHERE [tid]=@tid 
GO

CREATE PROCEDURE dnt_updatetopicviewcount
@tid int,
@viewcount int
AS
UPDATE [dnt_topics]  SET [views]= [views] + @viewcount WHERE [tid]=@tid


GO


CREATE PROCEDURE dnt_updateuserauthstr
	@uid int,
	@authstr char(20),
	@authflag int =1
AS
UPDATE [dnt_userfields] SET [authstr]=@authstr, [authtime] = getdate(), [authflag]=@authflag WHERE [uid]=@uid


GO


CREATE PROCEDURE dnt_updateuserforumsetting
	@uid int,
	@tpp int,
	@ppp int,
	@invisible int,
	@customstatus varchar(30),
	@sigstatus int,
	@signature nvarchar(500),
	@sightml nvarchar(1000)
AS
UPDATE [dnt_users] SET [tpp]=@tpp, [ppp]=@ppp, [invisible]=@invisible,[sigstatus]=@sigstatus WHERE [uid]=@uid
UPDATE [dnt_userfields] SET [signature]=@signature,[sightml] = @sightml,[customstatus]=@customstatus WHERE [uid]=@uid


GO


CREATE PROCEDURE dnt_updateuserpassword
	@uid int,
	@password char(44)
AS
UPDATE [dnt_users] SET [password]=@password WHERE [uid]=@uid


GO


CREATE PROCEDURE dnt_updateuserpreference
	@uid int,
	@avatar varchar(255),
	@avatarwidth int,
	@avatarheight int,
	@templateid int
AS
UPDATE [dnt_userfields] SET [avatar]=@avatar, [avatarwidth]=@avatarwidth, [avatarheight]=@avatarheight WHERE [uid]=@uid
UPDATE [dnt_users] SET [templateid]=@templateid WHERE [uid]=@uid


GO


CREATE PROCEDURE dnt_updateuserprofile
	@uid int,
	@nickname nchar(20),
	@gender int,
	@email char(50),
	@bday char(10),
	@showemail int,
	@website nvarchar(80),
	@icq varchar(12),
	@qq varchar(12),
	@yahoo varchar(40),
	@msn varchar(40),
	@skype varchar(40),
	@location nvarchar(30),
	@bio nvarchar(500),
	@realname nvarchar(10),
	@idcard varchar(20),
	@mobile varchar(20),
	@phone varchar(20)
AS
UPDATE [dnt_users] SET [nickname]=@nickname, [gender]=@gender , [email]=@email , [bday]=@bday, [showemail]=@showemail WHERE [uid]=@uid
UPDATE [dnt_userfields] SET [website]=@website , [icq]=@icq , [qq]=@qq , [yahoo]=@yahoo , [msn]=@msn , [skype]=@skype , [location]=@location , [bio]=@bio,[realname]=@realname,[idcard]=@idcard,[mobile]=@mobile,[phone]=@phone  WHERE [uid]=@uid

GO




CREATE PROCEDURE dnt_getforumnewtopics
@fid int
AS
SELECT TOP 20 [dnt_topics].[tid],[dnt_topics].[title],[dnt_topics].[poster],[dnt_topics].[postdatetime],[dnt_posts1].[message] FROM [dnt_topics] LEFT JOIN [dnt_posts1] ON [dnt_topics].[tid]=[dnt_posts1].[tid]  WHERE [dnt_posts1].[layer]=0 AND  [dnt_topics].[fid]=@fid ORDER BY [lastpost] DESC


GO

CREATE PROCEDURE [dnt_createtopictags]
@tags nvarchar(55),
@tid int,
@userid int,
@postdatetime datetime
AS
BEGIN
	exec [dnt_createtags] @tags, @userid, @postdatetime

	UPDATE [dnt_tags] SET [fcount]=[fcount]+1,[count]=[count]+1
	WHERE EXISTS (SELECT [item] FROM [dnt_split](@tags, ' ') AS [newtags] WHERE [newtags].[item] = [tagname])

	INSERT INTO [dnt_topictags] (tagid, tid)
	SELECT tagid, @tid FROM [dnt_tags] WHERE EXISTS (SELECT * FROM [dnt_split](@tags, ' ') WHERE [item] = [dnt_tags].[tagname])
END

GO


CREATE PROCEDURE dnt_getfavoriteslistbyalbum
@uid int,
@pagesize int,
@pageindex int
AS
DECLARE @strSQL varchar(5000)


SET @strSQL='SELECT [f].[tid], [f].[uid], [albumid], [albumcateid], [userid] AS [posterid], [username] AS [poster], [title], [description], [logo], [password], [imgcount], [views], [type], [createdatetime] AS [postdatetime] FROM [dnt_favorites] [f],[dnt_albums] [albums] WHERE [f].[tid]=[albums].[albumid] AND [f].[typeid]=1 AND [f].[uid]=' + STR(@uid)

IF @pageindex = 1
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +'  [tid], [uid], [albumid], [albumcateid], [posterid], [poster], [title], [description], [logo], [password], [imgcount], [views], [type], [postdatetime]  FROM (' + @strSQL + ') f' + '  ORDER BY [tid] DESC'
	END
ELSE
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +'  [tid], [uid], [albumid], [albumcateid], [posterid], [poster], [title], [description], [logo], [password], [imgcount], [views], [type], [postdatetime]  FROM (' + @strSQL + ') f1 WHERE [tid] < (SELECT MIN([tid]) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize) + ' [tid] FROM (' + @strSQL + ') f2' + '  ORDER BY [tid] DESC) AS tblTmp)' + '  ORDER BY [tid] DESC'
	END

EXEC(@strSQL)


GO

if exists(select * from sysobjects where id=object_id(N'[dnt_getnewtopics]')and OBJECTPROPERTY(id,N'IsProcedure') = 1) 
drop procedure [dnt_getnewtopics]
GO
CREATE PROCEDURE [dnt_getnewtopics] 
                    @fidlist VARCHAR(500)
                    AS
                    DECLARE @strSQL VARCHAR(5000)
					DECLARE @strMaxPostTableId VARCHAR(3)
					SELECT @strMaxPostTableId=max([id]) FROM [dnt_tablelist]
                    IF @fidlist<>''
                    BEGIN
                    SET @strSQL = 'SELECT TOP 20 [dnt_posts' + @strMaxPostTableId + '].[tid], [dnt_posts' + @strMaxPostTableId + '].[title], [dnt_posts' + @strMaxPostTableId + '].[poster], [dnt_posts' + @strMaxPostTableId + '].[postdatetime], [dnt_posts' + @strMaxPostTableId + '].[message],[dnt_forums].[name] FROM [dnt_posts' + @strMaxPostTableId + ']  LEFT JOIN [dnt_forums] ON [dnt_posts' + @strMaxPostTableId + '].[fid]=[dnt_forums].[fid] WHERE  [dnt_forums].[fid] NOT IN ('+@fidlist +')  AND [dnt_posts' + @strMaxPostTableId + '].[layer]=0 ORDER BY [dnt_posts' + @strMaxPostTableId + '].[pid] DESC' 
                    END
                    ELSE
                    BEGIN
                    SET @strSQL = 'SELECT TOP 20 [dnt_posts' + @strMaxPostTableId + '].[tid], [dnt_posts' + @strMaxPostTableId + '].[title], [dnt_posts' + @strMaxPostTableId + '].[poster], [dnt_posts' + @strMaxPostTableId + '].[postdatetime], [dnt_posts' + @strMaxPostTableId + '].[message],[dnt_forums].[name] FROM [dnt_posts' + @strMaxPostTableId + ']  LEFT JOIN [dnt_forums] ON [dnt_posts' + @strMaxPostTableId + '].[fid]=[dnt_forums].[fid] WHERE [dnt_posts' + @strMaxPostTableId + '].[layer]=0 ORDER BY [dnt_posts' + @strMaxPostTableId + '].[pid] DESC'
                    END
                    EXEC(@strSQL)
           
GO


CREATE PROCEDURE dnt_getpostlistbycondition
@tid int,
@pagesize int,
@pageindex int,
@condition varchar(100),
@posttablename varchar(20)
AS
DECLARE @pagetop int

SET @pagetop = (@pageindex-1)*@pagesize

IF @pageindex = 1

EXEC('SELECT TOP ' + @pagesize + '
									[' + @posttablename + '].[pid], 
									[' + @posttablename + '].[fid], 
									[' + @posttablename + '].[title], 
									[' + @posttablename + '].[layer],
									[' + @posttablename + '].[message], 
									[' + @posttablename + '].[ip], 
									[' + @posttablename + '].[lastedit], 
									[' + @posttablename + '].[postdatetime], 
									[' + @posttablename + '].[attachment], 
									[' + @posttablename + '].[poster], 
									[' + @posttablename + '].[posterid], 
									[' + @posttablename + '].[invisible], 
									[' + @posttablename + '].[usesig], 
									[' + @posttablename + '].[htmlon], 
									[' + @posttablename + '].[smileyoff], 
									[' + @posttablename + '].[parseurloff], 
									[' + @posttablename + '].[bbcodeoff], 
									[' + @posttablename + '].[rate], 
									[' + @posttablename + '].[ratetimes], 
									[dnt_users].[nickname],  
									[dnt_users].[username], 
									[dnt_users].[groupid], 
									[dnt_users].[spaceid],
									[dnt_users].[gender],
									[dnt_users].[bday],
									[dnt_users].[email], 
									[dnt_users].[showemail], 
									[dnt_users].[digestposts], 
									[dnt_users].[credits], 
									[dnt_users].[extcredits1], 
									[dnt_users].[extcredits2], 
									[dnt_users].[extcredits3], 
									[dnt_users].[extcredits4], 
									[dnt_users].[extcredits5], 
									[dnt_users].[extcredits6], 
									[dnt_users].[extcredits7], 
									[dnt_users].[extcredits8], 
									[dnt_users].[posts], 
									[dnt_users].[joindate], 
									[dnt_users].[onlinestate],
									[dnt_users].[lastactivity],  
									[dnt_users].[invisible], 
									[dnt_userfields].[avatar], 
									[dnt_userfields].[avatarwidth],
									[dnt_userfields].[avatarheight],
									[dnt_userfields].[medals],
									[dnt_userfields].[sightml] AS signature, 
									[dnt_userfields].[location], 
									[dnt_userfields].[customstatus], 
									[dnt_userfields].[website], 
									[dnt_userfields].[icq], 
									[dnt_userfields].[qq], 
									[dnt_userfields].[msn], 
									[dnt_userfields].[yahoo], 
									[dnt_userfields].[skype] 
	 FROM [' + @posttablename + '] LEFT JOIN [dnt_users] ON [dnt_users].[uid]=[' + @posttablename + '].[posterid] LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid] WHERE [' + @posttablename + '].[tid]=' + @tid + ' AND [' + @posttablename + '].[invisible]=0 AND '+@condition+' ORDER BY [' + @posttablename + '].[pid]')

ELSE

EXEC('SELECT TOP ' + @pagesize + ' 
									[' + @posttablename + '].[pid], 
									[' + @posttablename + '].[fid], 
									[' + @posttablename + '].[title], 
									[' + @posttablename + '].[layer],
									[' + @posttablename + '].[message], 
									[' + @posttablename + '].[ip], 
									[' + @posttablename + '].[lastedit], 
									[' + @posttablename + '].[postdatetime], 
									[' + @posttablename + '].[attachment], 
									[' + @posttablename + '].[poster], 
									[' + @posttablename + '].[posterid], 
									[' + @posttablename + '].[invisible], 
									[' + @posttablename + '].[usesig], 
									[' + @posttablename + '].[htmlon], 
									[' + @posttablename + '].[smileyoff], 
									[' + @posttablename + '].[parseurloff], 
									[' + @posttablename + '].[bbcodeoff], 
									[' + @posttablename + '].[rate], 
									[' + @posttablename + '].[ratetimes],
									[dnt_users].[nickname],  
									[dnt_users].[username], 
									[dnt_users].[groupid], 
									[dnt_users].[spaceid],
									[dnt_users].[gender],
									[dnt_users].[bday],
									[dnt_users].[email], 
									[dnt_users].[showemail], 
									[dnt_users].[digestposts], 
									[dnt_users].[credits], 
									[dnt_users].[extcredits1], 
									[dnt_users].[extcredits2], 
									[dnt_users].[extcredits3], 
									[dnt_users].[extcredits4], 
									[dnt_users].[extcredits5], 
									[dnt_users].[extcredits6], 
									[dnt_users].[extcredits7], 
									[dnt_users].[extcredits8], 
									[dnt_users].[posts], 
									[dnt_users].[joindate], 
									[dnt_users].[onlinestate], 
									[dnt_users].[lastactivity], 
									[dnt_users].[invisible], 
									[dnt_userfields].[avatar], 
									[dnt_userfields].[avatarwidth], 
									[dnt_userfields].[avatarheight], 
									[dnt_userfields].[medals],
									[dnt_userfields].[sightml] AS signature, 
									[dnt_userfields].[location], 
									[dnt_userfields].[customstatus], 
									[dnt_userfields].[website], 
									[dnt_userfields].[icq], 
									[dnt_userfields].[qq], 
									[dnt_userfields].[msn], 
									[dnt_userfields].[yahoo], 
									[dnt_userfields].[skype] 
	FROM [' + @posttablename + '] LEFT JOIN [dnt_users] ON [dnt_users].[uid]=[' + @posttablename + '].[posterid] LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid] WHERE [' + @posttablename + '].[tid]=' + @tid + ' AND [' + @posttablename + '].[invisible]=0 AND '+ @condition+'  AND [pid] > (SELECT MAX([pid]) FROM (SELECT TOP ' + @pagetop + ' [' + @posttablename + '].[pid] FROM [' + @posttablename + '] LEFT JOIN [dnt_users] ON [dnt_users].[uid]=[' + @posttablename + '].[posterid] LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid] WHERE [' + @posttablename + '].[tid]=' + @tid + '  AND '+@condition+'  ORDER BY [' + @posttablename + '].[pid]) AS tblTmp) ORDER BY [' + @posttablename + '].[pid]')


GO

CREATE PROCEDURE [dnt_getattentiontopics] 

@fid varchar(255)='',
@tpp int,
@pageid int,
@condition nvarchar(255)=''
AS

DECLARE @pagetop int,@strSQL varchar(5000)

SET @pagetop = (@pageid-1)*@tpp
IF @pageid = 1
	BEGIN
		SET @strSQL = 'SELECT TOP  ' +STR( @tpp) + '  * FROM [dnt_topics] WHERE [displayorder]>=0  AND [attention]=1'
                     	
		IF @fid<>'0'
                            SELECT  @strSQL=@strSQL+'  AND [fid] IN ('+@fid+')'


                            IF @condition<>''
                            SELECT  @strSQL=@strSQL+@condition

                           SELECT @strSQL=@strSQL+'  ORDER BY [lastpost] DESC'
                            

      
	END
ELSE
	BEGIN
		SET @strSQL = 'SELECT TOP  ' +STR( @tpp) + '  * FROM [dnt_topics]  WHERE [tid] < (SELECT MIN([tid])  FROM (SELECT TOP '+STR(@pagetop)+' [tid] FROM [dnt_topics]   WHERE [displayorder]>=0  AND [attention]=1'
		

		 IF @fid<>'0'
 
                            SELECT  @strSQL=@strSQL+'  AND [fid] IN ('+@fid+')'
                          


                            IF @condition<>''
                            SELECT  @strSQL=@strSQL+@condition
                     

                          SELECT @strSQL=@strSQL+'   ORDER BY [tid] DESC'


                          SELECT @strSQL=@strSQL+'  )  AS T) '

		 IF @fid<>'0'
 
                           SELECT  @strSQL=@strSQL+'  AND [fid] IN ('+@fid+')'

			    IF @condition<>''
                            SELECT  @strSQL=@strSQL+@condition


                           SELECT @strSQL=@strSQL+'  AND [displayorder]>=0  AND [attention]=1 ORDER BY [tid] DESC'

                                 
	END
EXEC(@strSQL)
GO

CREATE PROCEDURE [dnt_updateuser]
@username nchar(20),
@nickname nchar(20),
@password char(32),
@secques char(8),
@spaceid int,
@gender int,
@adminid int,
@groupid smallint,
@groupexpiry int,
@extgroupids char(60),
@regip char(15),
@joindate char(19),
@lastip char(15),
@lastvisit char(19),
@lastactivity char(19),
@lastpost char(19),
@lastpostid int,
@lastposttitle nchar(60),
@posts int,
@digestposts smallint,
@oltime int,
@pageviews int,
@credits int,
@extcredits1 float,
@extcredits2 float,
@extcredits3 float,
@extcredits4 float,
@extcredits5 float,
@extcredits6 float,
@extcredits7 float,
@extcredits8 float,
@avatarshowid int,
@email char(50),
@bday char(19),
@sigstatus int,
@tpp int,
@ppp int,
@templateid smallint,
@pmsound int,
@showemail int,
@newsletter int,
@invisible int,
@newpm int,
@newpmcount int,
@accessmasks int,
@onlinestate int,
@website varchar(80),
@icq varchar(12),
@qq varchar(12),
@yahoo varchar(40),
@msn varchar(40),
@skype varchar(40),
@location nvarchar(30),
@customstatus varchar(30),
@avatar varchar(255),
@avatarwidth int,
@avatarheight int,
@medals varchar(300),
@bio nvarchar(500),
@signature nvarchar(500),
@sightml nvarchar(1000),
@authstr varchar(20),
@authtime smalldatetime,
@authflag tinyint,
@realname nvarchar(10),
@idcard varchar(20),
@mobile varchar(20),
@phone varchar(20),
@ignorepm nvarchar(1000),
@uid int
AS

UPDATE [dnt_users] SET [username]=@username,[nickname]=@nickname, [password]=@password, [secques]=@secques, [spaceid]=@spaceid, [gender]=@gender, [adminid]=@adminid, [groupid]=@groupid, [groupexpiry]=@groupexpiry, 
[extgroupids]=@extgroupids, [regip]= @regip, [joindate]= @joindate, [lastip]=@lastip, [lastvisit]=@lastvisit, [lastactivity]=@lastactivity, [lastpost]=@lastpost, 
[lastpostid]=@lastpostid, [lastposttitle]=@lastposttitle, [posts]=@posts, [digestposts]=@digestposts, [oltime]=@oltime, [pageviews]=@pageviews, [credits]=@credits, 
[extcredits1]=@extcredits1, [extcredits2]=@extcredits2, [extcredits3]=@extcredits3, [extcredits4]=@extcredits4, [extcredits5]=@extcredits5, [extcredits6]=@extcredits6, 
[extcredits7]=@extcredits7, [extcredits8]=@extcredits8, [avatarshowid]=@avatarshowid, [email]=@email, [bday]=@bday, [sigstatus]=@sigstatus, [tpp]=@tpp, [ppp]=@ppp, 
[templateid]=@templateid, [pmsound]=@pmsound, [showemail]=@showemail, [newsletter]=@newsletter, [invisible]=@invisible, [newpm]=@newpm, [newpmcount]=@newpmcount, [accessmasks]=@accessmasks, [onlinestate]=@onlinestate 
WHERE [uid]=@uid

UPDATE [dnt_userfields] SET [website]=@website,[icq]=@icq,[qq]=@qq,[yahoo]=@yahoo,[msn]=@msn,[skype]=@skype,[location]=@location,[customstatus]=@customstatus,
[avatar]=@avatar,[avatarwidth]=@avatarwidth,[avatarheight]=@avatarheight,[medals]=@medals,[bio]=@bio,[signature]=@signature,[sightml]=@sightml,[authstr]=@authstr,
[authtime]=@authtime,[authflag]=@authflag,[realname]=@realname,[idcard]=@idcard,[mobile]=@mobile,[phone]=@phone,[ignorepm]=@ignorepm 
WHERE [uid]=@uid
GO

CREATE FUNCTION [dnt_split]
(
 @splitstring NVARCHAR(4000),
 @separator CHAR(1) = ','
)
RETURNS @splitstringstable TABLE
(
 [item] NVARCHAR(200)
)
AS
BEGIN
    DECLARE @currentindex INT
    DECLARE @nextindex INT
    DECLARE @returntext NVARCHAR(200)

    SELECT @currentindex=1

    WHILE(@currentindex<=datalength(@splitstring)/2)
    BEGIN
        SELECT @nextindex=charindex(@separator,@splitstring,@currentindex)
        IF(@nextindex=0 OR @nextindex IS NULL)
            SELECT @nextindex=datalength(@splitstring)/2+1
        
        SELECT @returntext=substring(@splitstring,@currentindex,@nextindex-@currentindex)

        INSERT INTO @splitstringstable([item])
        VALUES(@returntext)
        
        SELECT @currentindex=@nextindex+1
    END
    RETURN
END

GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getindexforumlist]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getindexforumlist]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getonlineuser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getonlineuser]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getonlineuserlist]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getonlineuserlist]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getonlineuserlistbyfid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getonlineuserlistbyfid]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getrelatedtopics]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getrelatedtopics]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_gettopicinfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_gettopicinfo]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_createonlineuser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_createonlineuser]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_deleteonlineusers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_deleteonlineusers]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getexpiredonlineuserlist]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getexpiredonlineuserlist]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_updateuseronlinestates]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_updateuseronlinestates]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_updateonlineaction]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_updateonlineaction]
GO

CREATE PROCEDURE [dnt_updateonlineaction] 
@action smallint,
@lastupdatetime datetime,
@forumid int,
@forumname nvarchar(100),
@titleid int,
@title nvarchar(160),
@olid int
AS

UPDATE [dnt_online] SET [lastactivity]=[action],[action]=@action,[lastupdatetime]=@lastupdatetime,[forumid]=@forumid,[forumname]=@forumname,[titleid]=@titleid,[title]=@title WHERE [olid]=@olid
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_gettopictags]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_gettopictags]
GO

CREATE PROCEDURE [dnt_getindexforumlist]
AS
SELECT CASE WHEN DATEDIFF(n, [lastpost], GETDATE())<600 THEN 'new' ELSE 'old' END AS [havenew],[dnt_forums].*, [dnt_forumfields].* FROM [dnt_forums] LEFT JOIN [dnt_forumfields] ON [dnt_forums].[fid]=[dnt_forumfields].[fid] WHERE [dnt_forums].[parentid] NOT IN (SELECT [fid] FROM [dnt_forums] WHERE [status] < 1 AND [layer] = 0) AND [dnt_forums].[status] > 0 AND [layer] <= 1 ORDER BY [displayorder]
GO

CREATE PROCEDURE [dnt_getonlineuser]
@userid int,
@password char(32)
AS
SELECT TOP 1 [olid]
      ,[userid]
      ,[ip]
      ,[username]
      ,[nickname]
      ,[password]
      ,[groupid]
      ,[olimg]
      ,[adminid]
      ,[invisible]
      ,[action]
      ,[lastactivity]
      ,[lastposttime]
      ,[lastpostpmtime]
      ,[lastsearchtime]
      ,[lastupdatetime]
      ,[forumid]
      ,[forumname]
      ,[titleid]
      ,[title]
      ,[verifycode]
      ,[newpms]
      ,[newnotices] FROM [dnt_online] WHERE [userid]=@userid AND [password]=@password
GO

CREATE PROCEDURE [dnt_getonlineuserlist]
AS
SELECT [olid]
      ,[userid]
      ,[ip]
      ,[username]
      ,[nickname]
      ,[password]
      ,[groupid]
      ,[olimg]
      ,[adminid]
      ,[invisible]
      ,[action]
      ,[lastactivity]
      ,[lastposttime]
      ,[lastpostpmtime]
      ,[lastsearchtime]
      ,[lastupdatetime]
      ,[forumid]
      ,[forumname]
      ,[titleid]
      ,[title]
      ,[verifycode]
      ,[newpms]
      ,[newnotices] FROM [dnt_online]
GO

CREATE PROCEDURE [dnt_getonlineuserlistbyfid]
@fid int
AS
SELECT [olid]
      ,[userid]
      ,[ip]
      ,[username]
      ,[nickname]
      ,[password]
      ,[groupid]
      ,[olimg]
      ,[adminid]
      ,[invisible]
      ,[action]
      ,[lastactivity]
      ,[lastposttime]
      ,[lastpostpmtime]
      ,[lastsearchtime]
      ,[lastupdatetime]
      ,[forumid]
      ,[forumname]
      ,[titleid]
      ,[title]
      ,[verifycode]
      ,[newpms]
      ,[newnotices] FROM [dnt_online] WHERE [forumid]=@fid
GO

CREATE PROCEDURE [dnt_getrelatedtopics]
@count int,
@tid int
AS

EXEC('SELECT TOP ' + @count + ' * FROM [dnt_topictagcaches] WHERE [tid]=' + @tid + ' ORDER BY [linktid] DESC')
GO

CREATE PROCEDURE [dnt_gettopicinfo]
@tid int,
@fid int,
@mode int
AS
IF @mode = 1
	BEGIN
       SELECT TOP 1 [tid]
      ,[fid]
      ,[iconid]
      ,[readperm]
      ,[price]
      ,[poster]
      ,[posterid]
      ,[title]
      ,[postdatetime]
      ,[lastpost]
      ,[lastpostid]
      ,[lastposter]
      ,[lastposterid]
      ,[views]
      ,[replies]
      ,[displayorder]
      ,[highlight]
      ,[digest]
      ,[hide]
      ,[attachment]
      ,[moderated]
      ,[closed]
      ,[magic]
      ,[identify]
      ,[special]
      ,[typeid]
      ,[rate]
      ,[attention] FROM [dnt_topics] WHERE [fid]=@fid AND [tid]<@tid AND [displayorder]>=0 ORDER BY [tid] DESC
	END
ELSE IF @mode = 2
	BEGIN
       SELECT TOP 1 [tid]
      ,[fid]
      ,[iconid]
      ,[readperm]
      ,[price]
      ,[poster]
      ,[posterid]
      ,[title]
      ,[postdatetime]
      ,[lastpost]
      ,[lastpostid]
      ,[lastposter]
      ,[lastposterid]
      ,[views]
      ,[replies]
      ,[displayorder]
      ,[highlight]
      ,[digest]
      ,[hide]
      ,[attachment]
      ,[moderated]
      ,[closed]
      ,[magic]
      ,[identify]
      ,[special]
      ,[typeid]
      ,[rate]
      ,[attention] FROM [dnt_topics] WHERE [fid]=@fid AND [tid]>@tid AND [displayorder]>=0 ORDER BY [tid] ASC
	END
ELSE
	BEGIN
       SELECT TOP 1 [tid]
      ,[fid]
      ,[iconid]
      ,[readperm]
      ,[price]
      ,[poster]
      ,[posterid]
      ,[title]
      ,[postdatetime]
      ,[lastpost]
      ,[lastpostid]
      ,[lastposter]
      ,[lastposterid]
      ,[views]
      ,[replies]
      ,[displayorder]
      ,[highlight]
      ,[digest]
      ,[hide]
      ,[attachment]
      ,[moderated]
      ,[closed]
      ,[magic]
      ,[identify]
      ,[special]
      ,[typeid]
      ,[rate]
      ,[attention] FROM [dnt_topics] WHERE [tid]=@tid
	END
GO

CREATE PROCEDURE [dnt_gettopictags]
@topicid int
AS

SELECT t.* FROM [dnt_tags] t, [dnt_topictags] tt WHERE tt.[tagid] = t.[tagid] AND tt.[tid] = @topicid ORDER BY [orderid]
GO

CREATE PROCEDURE [dnt_createonlineuser] 
@onlinestate int,
@userid int,
@ip varchar(15),
@username nvarchar(40),
@nickname nvarchar(40),
@password char(32),
@groupid smallint,
@olimg varchar(80),
@adminid smallint,
@invisible smallint,
@action smallint,
@lastactivity smallint,
@lastposttime datetime,
@lastpostpmtime datetime,
@lastsearchtime datetime,
@lastupdatetime datetime,
@forumid int,
@forumname nvarchar(50),
@titleid int,
@title nvarchar(80),
@verifycode varchar(10),
@newpms smallint,
@newnotices smallint

AS

IF @onlinestate = 0
BEGIN
	UPDATE [dnt_users] SET [onlinestate]=1 WHERE [uid]=@userid
END


INSERT INTO [dnt_online] ([userid],[ip],[username],[nickname],[password],[groupid],[olimg],[adminid],[invisible],[action],[lastactivity],[lastposttime],[lastpostpmtime],[lastsearchtime],[lastupdatetime],[forumid],[forumname],[titleid],[title],[verifycode],[newpms],[newnotices])VALUES(@userid,@ip,@username,@nickname,@password,@groupid,@olimg,@adminid,@invisible,@action,@lastactivity,@lastposttime,@lastpostpmtime,@lastsearchtime,@lastupdatetime,@forumid,@forumname,@titleid,@title,@verifycode,@newpms,@newnotices);SELECT SCOPE_IDENTITY()
GO



CREATE PROCEDURE [dnt_deleteonlineusers] 
@olidlist varchar(5000) = ''
AS

EXEC('DELETE FROM [dnt_online] WHERE [olid] IN (' + @olidlist + ')');
GO



CREATE PROCEDURE [dnt_getexpiredonlineuserlist]
@expires datetime
AS

SELECT [olid], [userid] FROM [dnt_online] WHERE [lastupdatetime]<@expires
GO



CREATE PROCEDURE [dnt_updateuseronlinestates] 
@uidlist varchar(5000) = '' 
AS

EXEC('UPDATE [dnt_users] SET [onlinestate]=0,[lastactivity]=GETDATE() WHERE [uid] IN (' + @uidlist + ')')
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getonlineuserbyip]') and OBJECTPROPERTY(id,N'IsProcedure') = 1)
drop procedure [dnt_getonlineuserbyip]
GO

CREATE PROCEDURE [dnt_getonlineuserbyip]
@userid int,
@ip varchar(15)
AS

SELECT TOP 1 [olid]
      ,[userid]
      ,[ip]
      ,[username]
      ,[nickname]
      ,[password]
      ,[groupid]
      ,[olimg]
      ,[adminid]
      ,[invisible]
      ,[action]
      ,[lastactivity]
      ,[lastposttime]
      ,[lastpostpmtime]
      ,[lastsearchtime]
      ,[lastupdatetime]
      ,[forumid]
      ,[forumname]
      ,[titleid]
      ,[title]
      ,[verifycode]
      ,[newpms]
      ,[newnotices] FROM [dnt_online] WHERE [userid]=@userid AND [ip]=@ip
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getreplypid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getreplypid]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_gettodayuploadedfilesize]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_gettodayuploadedfilesize]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getuseridbyemail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getuseridbyemail]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getuserinfobyip]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getuserinfobyip]
GO

CREATE PROCEDURE dnt_getreplypid
@uid int,
@tid int,
@posttableid char(3)

AS

EXEC('SELECT TOP 1 [pid] FROM [dnt_posts' + @posttableid + '] WHERE [tid] = ' + @tid + ' AND [posterid]=' + @uid)
GO

CREATE PROCEDURE dnt_gettodayuploadedfilesize 
@uid int

AS

SELECT SUM([filesize]) AS [todaysize] FROM [dnt_attachments] WHERE [uid]=@uid AND DATEDIFF(d,[postdatetime],GETDATE())=0
GO

CREATE PROCEDURE dnt_getuseridbyemail
@email char(50)
AS

SELECT TOP 1 [uid] FROM [dnt_users] WHERE [email]=@email
GO

CREATE PROCEDURE dnt_getuserinfobyip
@regip char(15)
AS

SELECT TOP 1 [u].[uid], [u].[username], [u].[nickname], [u].[password], [u].[secques], [u].[spaceid], [u].[gender], [u].[adminid], [u].[groupid], [u].[groupexpiry], [u].[extgroupids], [u].[regip], [u].[joindate], [u].[lastip], [u].[lastvisit], [u].[lastactivity], [u].[lastpost], [u].[lastpostid], [u].[lastposttitle], [u].[posts], [u].[digestposts], [u].[oltime], [u].[pageviews], [u].[credits], [u].[extcredits1], [u].[extcredits2], [u].[extcredits3], [u].[extcredits4], [u].[extcredits5], [u].[extcredits6], [u].[extcredits7], [u].[extcredits8], [u].[avatarshowid], [u].[email], [u].[bday], [u].[sigstatus], [u].[tpp], [u].[ppp], [u].[templateid], [u].[pmsound], [u].[showemail], [u].[invisible], [u].[newpm], [u].[newpmcount], [u].[accessmasks], [u].[onlinestate], [u].[newsletter], [uf].[website], [uf].[icq], [uf].[qq], [uf].[yahoo], [uf].[msn], [uf].[skype], [uf].[location], [uf].[customstatus], [uf].[avatar], [uf].[avatarwidth], [uf].[avatarheight], [uf].[medals], [uf].[bio], [uf].[signature], [uf].[sightml], [uf].[authstr], [uf].[authtime], [uf].[authflag], [uf].[realname], [uf].[idcard], [uf].[mobile], [uf].[phone], [uf].[ignorepm] FROM [dnt_users] [u] LEFT JOIN [dnt_userfields] [uf] ON [u].[uid]=[uf].[uid] WHERE [u].[regip]=@regip ORDER BY [u].[uid] DESC
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getnoticebyuid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getnoticebyuid]
GO

CREATE PROCEDURE [dnt_getnoticebyuid]
@uid int,
@type int

AS

IF @type = 0
     SELECT nid, uid, type, new, posterid, poster, note, postdatetime FROM [dnt_notices] WHERE [uid] = @uid  ORDER BY [postdatetime] DESC
ELSE
    SELECT nid, uid, type, new, posterid, poster, note, postdatetime  FROM [dnt_notices] WHERE [uid] = @uid AND [type] = @type ORDER BY [postdatetime] DESC
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_createnotice]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_createnotice]
GO

CREATE PROCEDURE [dnt_createnotice]
@uid int,
@type int,
@new  int,
@posterid int,
@poster nchar(20),
@note ntext,
@postdatetime datetime

AS

INSERT INTO [dnt_notices] ([uid], [type], [new], [posterid], [poster], [note], [postdatetime]) VALUES (@uid, @type, @new, @posterid, @poster, @note, @postdatetime);

SELECT SCOPE_IDENTITY()  AS 'nid'
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getnewnoticecountbyuid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getnewnoticecountbyuid]
GO

CREATE PROCEDURE [dnt_getnewnoticecountbyuid]
@uid int
AS

SELECT COUNT(nid) FROM [dnt_notices] WHERE [uid] =  @uid  AND [new] = 1
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getnoticecountbyuid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getnoticecountbyuid]
GO

CREATE PROCEDURE [dnt_getnoticecountbyuid]
@uid int,
@type int
AS
IF @type = -1
   SELECT COUNT(nid) FROM [dnt_notices] WHERE [uid] = @uid
ELSE
    SELECT COUNT(nid) FROM [dnt_notices] WHERE [uid] = @uid AND [type]=@type
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getpostlist]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getpostlist]
GO

CREATE PROCEDURE [dnt_getpostlist]
@tid int,
@pagesize int,
@pageindex int,
@posttablename varchar(20)
AS
DECLARE @pagetop int

SET @pagetop = (@pageindex-1)*@pagesize

IF @pageindex = 1

EXEC('SELECT TOP ' + @pagesize + '
									[' + @posttablename + '].[pid], 
									[' + @posttablename + '].[fid], 
									[' + @posttablename + '].[title], 
									[' + @posttablename + '].[layer],
									[' + @posttablename + '].[message], 
									[' + @posttablename + '].[ip], 
									[' + @posttablename + '].[lastedit], 
									[' + @posttablename + '].[postdatetime], 
									[' + @posttablename + '].[attachment], 
									[' + @posttablename + '].[poster], 
									[' + @posttablename + '].[posterid], 
									[' + @posttablename + '].[invisible], 
									[' + @posttablename + '].[usesig], 
									[' + @posttablename + '].[htmlon], 
									[' + @posttablename + '].[smileyoff], 
									[' + @posttablename + '].[parseurloff], 
									[' + @posttablename + '].[bbcodeoff], 
									[' + @posttablename + '].[rate], 
									[' + @posttablename + '].[ratetimes], 
									[dnt_users].[nickname],  
									[dnt_users].[username], 
									[dnt_users].[groupid], 
									[dnt_users].[spaceid],
									[dnt_users].[gender],
									[dnt_users].[bday],
									[dnt_users].[email], 
									[dnt_users].[showemail], 
									[dnt_users].[digestposts], 
									[dnt_users].[credits], 
									[dnt_users].[extcredits1], 
									[dnt_users].[extcredits2], 
									[dnt_users].[extcredits3], 
									[dnt_users].[extcredits4], 
									[dnt_users].[extcredits5], 
									[dnt_users].[extcredits6], 
									[dnt_users].[extcredits7], 
									[dnt_users].[extcredits8], 
									[dnt_users].[posts], 
									[dnt_users].[joindate], 
									[dnt_users].[onlinestate],
									[dnt_users].[lastactivity], 
									[dnt_users].[invisible], 
									[dnt_userfields].[avatar], 
									[dnt_userfields].[avatarwidth], 
									[dnt_userfields].[avatarheight],
									[dnt_userfields].[medals],
									[dnt_userfields].[sightml] AS signature, 
									[dnt_userfields].[location], 
									[dnt_userfields].[customstatus], 
									[dnt_userfields].[website], 
									[dnt_userfields].[icq], 
									[dnt_userfields].[qq], 
									[dnt_userfields].[msn], 
									[dnt_userfields].[yahoo], 
									[dnt_userfields].[skype] 
	 FROM [' + @posttablename + '] LEFT JOIN [dnt_users] ON [dnt_users].[uid]=[' + @posttablename + '].[posterid] LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid] WHERE [' + @posttablename + '].[tid]=' + @tid + ' AND [' + @posttablename + '].[invisible]<=0 ORDER BY [' + @posttablename + '].[pid]')

ELSE

EXEC('SELECT TOP ' + @pagesize + ' 
									[' + @posttablename + '].[pid], 
									[' + @posttablename + '].[fid], 
									[' + @posttablename + '].[title], 
									[' + @posttablename + '].[layer],
									[' + @posttablename + '].[message], 
									[' + @posttablename + '].[ip], 
									[' + @posttablename + '].[lastedit], 
									[' + @posttablename + '].[postdatetime], 
									[' + @posttablename + '].[attachment], 
									[' + @posttablename + '].[poster], 
									[' + @posttablename + '].[posterid], 
									[' + @posttablename + '].[invisible], 
									[' + @posttablename + '].[usesig], 
									[' + @posttablename + '].[htmlon], 
									[' + @posttablename + '].[smileyoff], 
									[' + @posttablename + '].[parseurloff], 
									[' + @posttablename + '].[bbcodeoff], 
									[' + @posttablename + '].[rate], 
									[' + @posttablename + '].[ratetimes],
									[dnt_users].[nickname],  
									[dnt_users].[username], 
									[dnt_users].[groupid], 
									[dnt_users].[spaceid],
									[dnt_users].[gender],
									[dnt_users].[bday],
									[dnt_users].[email], 
									[dnt_users].[showemail], 
									[dnt_users].[digestposts], 
									[dnt_users].[credits], 
									[dnt_users].[extcredits1], 
									[dnt_users].[extcredits2], 
									[dnt_users].[extcredits3], 
									[dnt_users].[extcredits4], 
									[dnt_users].[extcredits5], 
									[dnt_users].[extcredits6], 
									[dnt_users].[extcredits7], 
									[dnt_users].[extcredits8], 
									[dnt_users].[posts], 
									[dnt_users].[joindate], 
									[dnt_users].[onlinestate],
									[dnt_users].[lastactivity],  
									[dnt_users].[invisible] AS [userinvisible], 
									[dnt_userfields].[avatar], 
									[dnt_userfields].[avatarwidth], 
									[dnt_userfields].[avatarheight], 
									[dnt_userfields].[medals],
									[dnt_userfields].[sightml] AS [signature], 
									[dnt_userfields].[location], 
									[dnt_userfields].[customstatus], 
									[dnt_userfields].[website], 
									[dnt_userfields].[icq], 
									[dnt_userfields].[qq], 
									[dnt_userfields].[msn], 
									[dnt_userfields].[yahoo], 
									[dnt_userfields].[skype] 
	FROM [' + @posttablename + '] LEFT JOIN [dnt_users] ON [dnt_users].[uid]=[' + @posttablename + '].[posterid] LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid] WHERE [' + @posttablename + '].[tid]=' + @tid + ' AND [pid] > (SELECT MAX([pid]) FROM (SELECT TOP ' + @pagetop + ' [' + @posttablename + '].[pid] FROM [' + @posttablename + '] WHERE [' + @posttablename + '].[tid]=' + @tid + ' AND [' + @posttablename + '].[invisible]<=0 ORDER BY [' + @posttablename + '].[pid]) AS tblTmp) AND [' + @posttablename + '].[invisible]<=0 ORDER BY [' + @posttablename + '].[pid]')