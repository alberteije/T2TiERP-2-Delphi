unit USplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvComponentBase, JvFormTransparent, jpeg, ExtCtrls;

type
  TFSplash = class(TForm)
    imgPrincipal: TImage;
    imgOperadoras: TImage;
    imgECF: TImage;
    imgBanco: TImage;
    lbMensagem: TLabel;
    imgTEF: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash: TFSplash;

implementation

{$R *.dfm}

procedure TFSplash.FormCreate(Sender: TObject);
begin
  if FileExists('imgSplash\imgPrincipal.jpg') then
    imgPrincipal.Picture.LoadFromFile('imgSplash\imgPrincipal.jpg');
  if FileExists('imgSplash\imgBanco.jpg') then
    imgBanco.Picture.LoadFromFile('imgSplash\imgBanco.jpg');
  if FileExists('imgSplash\imgECF.jpg') then
    imgECF.Picture.LoadFromFile('imgSplash\imgECF.jpg');
  if FileExists('imgSplash\imgTEF.jpg') then
    imgTEF.Picture.LoadFromFile('imgSplash\imgTEF.jpg');
  if FileExists('imgSplash\imgOperadoras.jpg') then
    imgOperadoras.Picture.LoadFromFile('imgSplash\imgOperadoras.jpg');
end;

end.
