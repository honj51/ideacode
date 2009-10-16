unit UEstateDictionaryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinGrids, bsDBGrids, bsSkinCtrls, ComCtrls, StdCtrls, Mask,
  bsSkinBoxCtrls, BusinessSkinForm, DB, ADODB, Menus, bsSkinMenus;

type
  TEstateDictionaryForm = class(TForm)
    bskntlbr1: TbsSkinToolBar;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    btn7: TbsSkinSpeedButton;
    bsknlbl1: TbsSkinLabel;
    bsknpnl1: TbsSkinPanel;
    bsknpnl2: TbsSkinPanel;
    tv1: TbsSkinTreeView;
    bsknscrlbr1: TbsSkinScrollBar;
    bskndbgrd1: TbsSkinDBGrid;
    bsknscrlbr2: TbsSkinScrollBar;
    bsknscrlbr3: TbsSkinScrollBar;
    btn8: TbsSkinSpeedButton;
    btn9: TbsSkinSpeedButton;
    btn10: TbsSkinSpeedButton;
    btn11: TbsSkinSpeedButton;
    btn12: TbsSkinSpeedButton;
    lbl1: TbsSkinStdLabel;
    edt1: TbsSkinEdit;
    btn14: TbsSkinSpeedButton;
    bsbsnsknfrm1: TbsBusinessSkinForm;
    qry1: TADOQuery;
    ds1: TDataSource;
    qrycity: TADOQuery;
    dsDistrict: TDataSource;
    dsCity: TDataSource;
    tblDistrict: TADOTable;
    dsArea: TDataSource;
    tblArea: TADOTable;
    tbl1: TADOTable;
    bsSkinPopupMenu1: TbsSkinPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    bsSkinPopupMenu2: TbsSkinPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure btn10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure btn1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EstateDictionaryForm: TEstateDictionaryForm;

implementation
           uses UHDHouseDataModule, UEstateDictionaryInfoForm,Math;

{$R *.dfm}

procedure TEstateDictionaryForm.btn10Click(Sender: TObject);
var CityName:string;
    DistrictName:string;
    AreaName:string;
begin
  inherited;
  Begin
    Try
      if (tv1.Selected=nil)or(tv1.Selected.Level=0) or (tv1.Selected.Level=1)then
      begin
        Application.MessageBox('请选择城区或片区', '', MB_OK);
        Exit;
      end;
      if tv1.Selected.Level=2 then
      begin
         CityName:=tv1.Selected.Parent.Text;
         DistrictName:=tv1.Selected.Text;
      end
      else if tv1.Selected.Level=3 then
      begin
         CityName:=tv1.Selected.Parent.Parent.Text;
         DistrictName:=tv1.Selected.Parent.Text;
         AreaName:=tv1.Selected.Text;
      end;
      if EstateDictionaryInfoForm=nil then
      begin
         EstateDictionaryInfoForm:=TEstateDictionaryInfoForm.Create(Self);
      end;
     Randomize;//初始
     EstateDictionaryInfoForm.ParmEditorMode:='ADD';
     EstateDictionaryInfoForm.ParmId:=FormatDateTime('yyyymmdd',Now)+IntToStr(RandomRange(10000000,99999999));
     EstateDictionaryInfoForm.CityName:=CityName;
     EstateDictionaryInfoForm.DistrictName:=DistrictName;
     EstateDictionaryInfoForm.AreaName:=AreaName;
     EstateDictionaryInfoForm.ShowModal;
     self.btn5Click(nil);
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure TEstateDictionaryForm.FormShow(Sender: TObject);
 var aNode:TTreeNode;
     bNode:TTreeNode;
     cNode:TTreeNode;
begin
     self.qry1.Active:=true;
     self.qrycity.Active:=true;
     self.tblDistrict.Active:=true;
     self.tblArea.Active:=true;
     self.tbl1.Active:=true;
     self.tv1.Items.Clear;
     aNode:=TTreeNode.Create(self.tv1.Items);
     aNode:=self.tv1.Items.Add(nil,'所有城市');
     with self.dsCity.DataSet do
     begin
      First;
      while not Eof do
      begin
        bNode:=self.tv1.Items.AddChild(aNode,VarToStr(FieldValues['CityName']));
        with self.dsDistrict.DataSet do
        begin
         First;
         while not Eof do
         begin
            cNode:=self.tv1.Items.AddChild(bNode,VarToStr(FieldValues['DistrictName']));
            with self.dsArea.DataSet do
            begin
             First;
             while not Eof do
             begin
              self.tv1.Items.AddChild(cNode,VarToStr(FieldValues['AreaName']));
              Next;
             end;
             end;
            Next;
          end;
        end;
        Next;
      end;
     end;
     tv1.Items[0].Expanded:=True;
     tv1.Items[0].Item[0].Expanded:=True;
     edt1.Text:='';
     self.bsknlbl1.Caption:=IntToStr(self.qry1.Recordset.RecordCount); //行数
end;

procedure TEstateDictionaryForm.tv1Change(Sender: TObject;
  Node: TTreeNode);
  var sql:string;
begin
  if (Node.Level=0) or (Node.Level=1) then
  begin
    Exit;
  end;
  if Node.Level=2 then
  begin
     sql:=' a.DistrictName='+QuotedStr(Node.Text) ;
  end
  else if Node.Level=3 then
  begin
     sql:=' AreaName='+QuotedStr(Node.Text);
  end;
  qry1.Filter:=sql;
  qry1.Filtered:=true;
  self.bsknlbl1.Caption:=IntToStr(self.qry1.Recordset.RecordCount);
end;

procedure TEstateDictionaryForm.btn1Click(Sender: TObject);
var sql:string;
begin
  if (tv1.Selected.Level=0) or (tv1.Selected.Level=1) then
  begin
    Exit;
  end;
  if tv1.Selected.Level=2 then
  begin
     sql:=' a.DistrictName='+QuotedStr(tv1.Selected.Text) ;
  end
  else if tv1.Selected.Level=3 then
  begin
     sql:=' AreaName='+QuotedStr(tv1.Selected.Text);
  end;
  if not (Trim(self.edt1.Text)='') then
  begin
     sql:=sql +' and Spell like '+QuotedStr(self.edt1.Text+'%') ;
  end;
  self.qry1.Filter:=sql;
  self.qry1.Filtered:=true;
end;

procedure TEstateDictionaryForm.edt1Change(Sender: TObject);
var sql:string;
begin
  if (tv1.Selected=nil)or(tv1.Selected.Level=0) or (tv1.Selected.Level=1)then
  begin
    Exit;
  end;
  if tv1.Selected.Level=2 then
  begin
     sql:=' a.DistrictName='+QuotedStr(tv1.Selected.Text) ;
  end
  else if tv1.Selected.Level=3 then
  begin
     sql:=' AreaName='+QuotedStr(tv1.Selected.Text);
  end;
  if not (Trim(self.edt1.Text)='') then
  begin
     sql:=sql +' and Spell like '+QuotedStr(self.edt1.Text+'%') ;
  end;
  self.qry1.Filter:=sql;
  self.qry1.Filtered:=true;
  self.bsknlbl1.Caption:=IntToStr(self.qry1.Recordset.RecordCount);
end;

procedure TEstateDictionaryForm.btn5Click(Sender: TObject);
begin
  qry1.Close;
  qry1.Open;
  self.bsknlbl1.Caption:=IntToStr(self.qry1.Recordset.RecordCount); //行数
end;
//折
procedure TEstateDictionaryForm.btn8Click(Sender: TObject);
begin
     tv1.Items[0].Expanded:=false;
     tv1.Items[0].Item[0].Expanded:=false;
end;
  //展
procedure TEstateDictionaryForm.btn9Click(Sender: TObject);
begin
     tv1.Items[0].Expanded:=True;
     tv1.Items[0].Item[0].Expanded:=True;
end;

procedure TEstateDictionaryForm.btn14Click(Sender: TObject);
var sql:string;
begin
  if (tv1.Selected.Level=0) or (tv1.Selected.Level=1) then
  begin
    Exit;
  end;
  if tv1.Selected.Level=2 then
  begin
     sql:=' a.DistrictName='+QuotedStr(tv1.Selected.Text) ;
  end
  else if tv1.Selected.Level=3 then
  begin
     sql:=' AreaName='+QuotedStr(tv1.Selected.Text);
  end;
  self.qry1.Filter:=sql;
  self.qry1.Filtered:=true;
  self.bsknlbl1.Caption:=IntToStr(self.qry1.Recordset.RecordCount); //行数
end;
procedure TEstateDictionaryForm.btn7Click(Sender: TObject);
begin
 Close;
end;
//删除
procedure TEstateDictionaryForm.btn11Click(Sender: TObject);
begin
  self.tbl1.Active:=true;

  if not self.qry1.Eof then
  begin
    self.tbl1.Edit;
    self.tbl1.FieldByName('FlagDeleted').Value:=1;
    self.tbl1.Post;
    self.btn5Click(nil);
  end;
end;

procedure TEstateDictionaryForm.btn12Click(Sender: TObject);
begin
 inherited;
  Begin
    Try
      if EstateDictionaryInfoForm=nil then
      begin
         EstateDictionaryInfoForm:=TEstateDictionaryInfoForm.Create(Self);
      end;
     EstateDictionaryInfoForm.ParmEditorMode:='EDIT';
     EstateDictionaryInfoForm.ParmId:=self.qry1.FieldByName('EstateID').AsString;
     EstateDictionaryInfoForm.CityName:=self.qry1.FieldByName('a.CityName').AsString;
     EstateDictionaryInfoForm.DistrictName:=self.qry1.FieldByName('a.DistrictName').AsString;
     EstateDictionaryInfoForm.AreaName:=self.qry1.FieldByName('AreaName').AsString;
     EstateDictionaryInfoForm.ShowModal;
     self.btn5Click(nil);
    Finally
        //HouseDetailsForm.Free;
    End;
  end;
end;

procedure TEstateDictionaryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
     EstateDictionaryForm:=nil;
end;

end.
