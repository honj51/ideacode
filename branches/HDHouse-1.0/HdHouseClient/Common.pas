unit Common;

interface

uses SysUtils,Graphics;
var
  // 软件目录与数据目录
  gs_WorkPath:string;

  // 登录用户与登录时间
  gs_login_userid:string;
  gs_login_username:string;
  gs_login_userlevel:string;
  gt_login_time:TDateTime;
  gs_login_password:string;
  gs_login_qxid:string;
  function CheckPermission(pc:String;id:Integer):Boolean;
  function CheckFatherPermission(strings:String;id:Integer):Boolean;
  function IsUsingAccess():Boolean;
  function IsLicenseValid():Boolean;
  //
implementation
   uses UHDHouseDataModule;
   function IsLicenseValid():Boolean;
   var
     EndDate:TDateTime;
   begin
     EndDate := StrToDate('2009-11-15');
     Result := True;
     if (Now - EndDate) > 0 then
     begin
       Result := False;
     end;
     Exit;
   end;
   function IsUsingAccess():Boolean;
   begin
     Result := False;
    if pos('Jet',HDHouseDataModule.con1.Provider) <> 0 then
      Result := True;
     Exit;
   end;
   function CheckPermission(pc:String;id:Integer):Boolean;
   var strings,str:string;
   begin
     HDHouseDataModule.qry_Qx.Active := True;
     HDHouseDataModule.qry_Qx.Filter:= ' Qx_bh ='+''+gs_login_qxid+'';
     HDHouseDataModule.qry_Qx.Filtered:=true;
     strings:=HDHouseDataModule.qry_Qx.FieldByName(pc).AsString;
     str:=copy(strings,id+1,1);
     if(str='2')then
     begin
        Result := True;
     end
     else
     begin
        Result := false;
     end;
     Exit;
   end;
   function CheckFatherPermission(strings:String;id:Integer):Boolean;
   var str :string;
   begin
     str:=copy(strings,id,1);
     if(str='2')then
     begin
        Result := True;
     end
     else
     begin
        Result := false;
     end;
     Exit;
   end;
end.
