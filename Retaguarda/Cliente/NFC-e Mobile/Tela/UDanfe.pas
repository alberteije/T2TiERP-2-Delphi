unit UDanfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtnrs;

type
  TFDanfe = class(TForm)
    OleContainer1: TOleContainer;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDanfe: TFDanfe;

implementation

{$R *.dfm}

procedure TFDanfe.FormShow(Sender: TObject);
begin
  /// EXERCICIO
  ///  Pesquise sobre como exibir arquivos PDFs no Android e no iOS
  ///  Implemente a exibição de acordo com o que for exigido em cada plataforma
  ///  Carregue o arquivo de acordo com o padrão da plataforma
  ///  Converta este formulário para FMX ou crie um novo formulário

  OleContainer1.CreateObjectFromFile('C:\T2Ti\NFe\PDF\53170310793118000178650010004571401004571400-nfe.pdf', False);
  OleContainer1.DoVerb(ovShow);
end;

end.
