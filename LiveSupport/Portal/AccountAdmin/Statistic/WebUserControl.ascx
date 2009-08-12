<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="AccountAdmin_Statistic_WebUserControl" %>

<frameset rows="90" id="AllFrame" border="0">
	<frameset cols="205,*" id="fstMain">
		<frame src="Left.aspx" id="fraLeft" marginwidth="0" marginheight="0" scrolling="no" />
		<frame src="OperatorStatistic.aspx" name="fraMain" scrolling="auto" marginwidth="0" marginheight="0" />
	</frameset>
</frameset>
