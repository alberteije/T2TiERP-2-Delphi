unit UPontoRegistroIncluidoAFD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LabeledCtrls, ExtCtrls, Mask, JvExMask, JvToolEdit,
  ToolWin, ActnMan, ActnCtrls, ActnList, RibbonSilverStyleActnCtrls, StrUtils,
  MaskUtils;

type
  TFPontoRegistroIncluidoAFD = class(TForm)
    PanelRegistroIncluido: TPanel;
    EditDataMarcacao: TLabeledDateEdit;
    EditHoraMarcacao: TLabeledMaskEdit;
    EditJustificativa: TLabeledEdit;
    ActionManagerLocal: TActionManager;
    ActionCancelar: TAction;
    ActionSalvar: TAction;
    ActionToolBar1: TActionToolBar;
    ComboBoxTipoMarcacao: TLabeledComboBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPontoRegistroIncluidoAFD: TFPontoRegistroIncluidoAFD;
  Confirmou: Boolean;

implementation

uses UMenu, UPontoTratamentoArquivoAFD;
{$R *.dfm}

procedure TFPontoRegistroIncluidoAFD.FormCreate(Sender: TObject);
begin
  EditDataMarcacao.Clear;
  EditHoraMarcacao.Clear;
  EditJustificativa.Clear;
  Confirmou := False;
end;

procedure TFPontoRegistroIncluidoAFD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not Confirmou then
    ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFPontoTratamentoArquivoAFD).CDSRegistro3.Delete;
  Release;
end;

procedure TFPontoRegistroIncluidoAFD.ActionCancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPontoRegistroIncluidoAFD.ActionSalvarExecute(Sender: TObject);
begin
  EditDataMarcacao.EditMask := '##/##/####;0;_';
  ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFPontoTratamentoArquivoAFD).CDSRegistro3.Edit;
  ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFPontoTratamentoArquivoAFD).CDSRegistro3DataMarcacao.AsString := EditDataMarcacao.Text;
  ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFPontoTratamentoArquivoAFD).CDSRegistro3HoraMarcacao.AsString := EditHoraMarcacao.Text;
  ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFPontoTratamentoArquivoAFD).CDSRegistro3JUSTIFICATIVA.AsString := EditJustificativa.Text;
  ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFPontoTratamentoArquivoAFD).CDSRegistro3TIPO_MARCACAO.AsString := Copy(ComboBoxTipoMarcacao.Text, 4, Length(ComboBoxTipoMarcacao.Text) - 3);
  ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFPontoTratamentoArquivoAFD).CDSRegistro3PAR_ENTRADA_SAIDA.AsString := Copy(ComboBoxTipoMarcacao.Text, 4, 1) + Copy(ComboBoxTipoMarcacao.Text, 1, 1);
  ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFPontoTratamentoArquivoAFD).CDSRegistro3.Post;
  ((FMenu.JvPageList.ActivePage.Components[0] as TForm) as TFPontoTratamentoArquivoAFD).ActionValidarDados.Execute;
  Confirmou := True;
  Close;
end;

procedure TFPontoRegistroIncluidoAFD.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
