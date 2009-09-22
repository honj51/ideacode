unit UBaseFacilitiesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinBoxCtrls, bsSkinData, BusinessSkinForm, bsSkinCtrls;
  type userarray=array of string;
type
  TBaseFacilitiesForm = class(TForm)
    btn2: TbsSkinButton;
    btn3: TbsSkinButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    lst1: TbsSkinCheckListBox;
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function split(s:string;dot:char):userarray;
  private
    { Private declarations }
  public
    SelectItems:string;
  end;

var
  BaseFacilitiesForm: TBaseFacilitiesForm;

implementation
   uses StrUtils,UHDHouseDataModule;
{$R *.dfm}

procedure TBaseFacilitiesForm.btn3Click(Sender: TObject);
begin
Close;
end;

procedure TBaseFacilitiesForm.btn2Click(Sender: TObject);
var 
  i:integer;
begin
  SelectItems:='';
  for i := 0 to self.lst1.Items.Count - 1 do
  begin 
    if lst1.Checked[i] then
    SelectItems:=SelectItems+lst1.Items.Strings[i]+';';
  end;
  if Trim(SelectItems)=''then
   SelectItems:='无';
  Close;
end;

function TBaseFacilitiesForm.split(s:string;dot:char):userarray;
  var
  str:userarray;
  i,j:integer;
begin
  i:=1;
  j:=0;
  SetLength(str, 255);
while Pos(dot, s) > 0 do //Pos返回子串在父串中第一次出现的位置.
begin
  str[j]:=copy(s,i,pos(dot,s)-i);
  i:=pos(dot,s)+1;
  s[i-1] := chr(ord(dot)+1);
  j:=j+1;
  end;
  str[j]:=copy(s,i,strlen(pchar(s))-i+1);
  result:=str;
end ;
procedure TBaseFacilitiesForm.FormShow(Sender: TObject);
var 
ur:userarray;
i,j,m:Integer;
begin
    for m := 0 to self.lst1.Items.Count - 1 do
    begin
        lst1.Checked[m]:=false;
    end;
    
    if Trim(SelectItems)<>'无'then
    begin
      ur:=split(self.SelectItems,';');
      for i :=0 to 20 do
      begin
      if length(ur[i])=0
      then Exit;
          for j := 0 to self.lst1.Items.Count - 1 do
          begin
            if Trim(lst1.Items.Strings[j])=Trim(ur[i]) then
            begin
              lst1.Checked[j]:=true;
            end;
          end;
      end;
    end;
end;

end.
