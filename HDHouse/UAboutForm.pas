unit UAboutForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinExCtrls, StdCtrls, bsSkinCtrls;

type
  TAboutForm = class(TForm)
    lbl1: TbsSkinStdLabel;
    lbl2: TbsSkinLinkLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.dfm}

end.
