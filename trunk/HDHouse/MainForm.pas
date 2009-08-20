unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BusinessSkinForm, bsSkinData, StdCtrls, bsSkinCtrls,
  ImgList, bsPngImageList, ComCtrls, bsSkinTabs, bsColorCtrls, bsDialogs,
  bsMessages, HouseListFrame, DB, ADODB, UCustomerAutoMatchView,
  UTrackInfoView, UDataOperatoBarView, UDetailRequirementInfoView,
  UTrackRecordView;

type
  TformMain = class(TForm)
    bsbsnsknfrm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    bscmprsdstrdskn1: TbsCompressedStoredSkin;
    bsknpgcntrl1: TbsSkinPageControl;
    bskntbsht1: TbsSkinTabSheet;
    bspngmglstPngImglst64: TbsPngImageList;
    bskntlbr1: TbsSkinToolBar;
    btn1: TbsSkinSpeedButton;
    btn2: TbsSkinSpeedButton;
    btn3: TbsSkinSpeedButton;
    btn4: TbsSkinSpeedButton;
    btn5: TbsSkinSpeedButton;
    btn6: TbsSkinSpeedButton;
    btn7: TbsSkinSpeedButton;
    bspngmglst32: TbsPngImageList;
    bskntbsht2: TbsSkinTabSheet;
    bskntbsht3: TbsSkinTabSheet;
    bskntbsht4: TbsSkinTabSheet;
    bskntbsht5: TbsSkinTabSheet;
    bsknmsg1: TbsSkinMessage;
    frmhslst1: TframeHouseList;
    con1: TADOConnection;
    qry1: TADOQuery;
    ds1: TDataSource;
    CustomerAutoMatchView1: TCustomerAutoMatchView;
    trckrcrdvw1: TTrackRecordView;
    btn8: TbsSkinButton;
    btn9: TbsSkinButton;
    btn10: TbsSkinButton;
    btn11: TbsSkinButton;
    btn12: TbsSkinButton;
    btn13: TbsSkinButton;
    btn14: TbsSkinButton;
    btn15: TbsSkinButton;
    btn16: TbsSkinButton;
    btn17: TbsSkinButton;
    trcknfvw1: TTrackInfoView;
    procedure btn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

procedure TformMain.btn7Click(Sender: TObject);
var i:Integer;
begin
  i := Self.bsknmsg1.MessageDlg2('真的要退出本系统吗？','提示信息', mtConfirmation, [mbYes,mbNo],0);
  if i = 6 then
    Application.Terminate;
end;

end.
