{*******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Socio Responsavel Empresa

The MIT License

Copyright: Copyright (C) 2010 T2Ti.COM

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

       The author may be contacted at:
           t2ti.com@gmail.com</p>

@author Fábio Thomaz (fabio_thz@yahoo.com.br)
@version 1.0   |   Fernando  @version 1.0.0.10
*******************************************************************************}
unit USocioResponsavelEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, SocioResponsavelEmpresaVO,
  SocioResponsavelEmpresaController, Tipos, Atributos, Constantes,
  ResponsavelSocioVO, ResponsavelSocioController,
  LabeledCtrls, Mask, JvExMask, JvToolEdit, JvBaseEdits, StrUtils;

type
  [TFormDescription(TConstantes.MODULO_CADASTROS,'SocioResponsavelEmpresa')]
  TFSocioResponsavelEmpresa = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditSocio: TLabeledEdit;
    EditIdSocio: TLabeledEdit;
    EditIdEmpresa: TLabeledEdit;
    EditEmpresa: TLabeledEdit;
    EditDataIngresso: TLabeledDateEdit;
    EditDataSaida: TLabeledDateEdit;
    RadioGroupResponsavel: TRadioGroup;
    EditTaxaCapitalVotante: TLabeledCalcEdit;
    EditTaxaCapitalTotal: TLabeledCalcEdit;
    EditProlabore: TLabeledCalcEdit;
    EditCodigoRFB: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditIdSocioExit(Sender: TObject);
    procedure EditIdEmpresaExit(Sender: TObject);
    procedure EditIdSocioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditIdEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;

    //Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;

    procedure PopulaEditSocio(Sender: TObject);
    procedure PopulaEditEmpresa(Sender: TObject);

  end;

var
  FSocioResponsavelEmpresa: TFSocioResponsavelEmpresa;

implementation

uses ULookup, EmpresaVO,EmpresaController, Biblioteca, UDataModule;

{$R *.dfm}

procedure TFSocioResponsavelEmpresa.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TSocioResponsavelEmpresaVO;
  ObjetoController := TSocioResponsavelEmpresaController.Create;

  inherited;
end;

procedure TFSocioResponsavelEmpresa.FormShow(Sender: TObject);
begin
  inherited;

end;

{$REGION 'Controles CRUD'}
function TFSocioResponsavelEmpresa.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditIdSocio.SetFocus;
  end;
end;

function TFSocioResponsavelEmpresa.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditIdSocio.SetFocus;
  end;
end;

function TFSocioResponsavelEmpresa.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      Result := TSocioResponsavelEmpresaController(ObjetoController).Exclui(IdRegistroSelecionado);
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TSocioResponsavelEmpresaController(ObjetoController).Consulta(Filtro, Pagina);
end;

function TFSocioResponsavelEmpresa.DoSalvar: Boolean;
begin
  if EditIdSocio.Text = '' then
  begin
    Mensagem('Informe o código do sócio.');
    EditIdSocio.SetFocus;
    Exit(False);
  end;
  if EditIdEmpresa.Text = '' then
  begin
    Mensagem('Informe o código da empresa.');
    EditIdSocio.SetFocus;
    Exit(False);
  end;
  if RadioGroupResponsavel.ItemIndex = -1 then
  begin
    Application.MessageBox('Informe se o sócio é ou não responsável.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    RadioGroupResponsavel.SetFocus;
    Exit(False);
  end;

  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TSocioResponsavelEmpresaVO.Create;

      TSocioResponsavelEmpresaVO(ObjetoVO).IdResponsavelSocio     := StrToInt(EditIdSocio.Text);
      TSocioResponsavelEmpresaVO(ObjetoVO).IdEmpresa              := StrToInt(EditIdEmpresa.Text);
      TSocioResponsavelEmpresaVO(ObjetoVO).DataIngresso           := EditDataIngresso.Date;
      TSocioResponsavelEmpresaVO(ObjetoVO).DataSaida              := EditDataSaida.Date;
      TSocioResponsavelEmpresaVO(ObjetoVO).PorcentoCapitalVotante := StrToFloat(EditTaxaCapitalVotante.Text);
      TSocioResponsavelEmpresaVO(ObjetoVO).PorcentoCapitalTotal   := StrToFloat(EditTaxaCapitalTotal.Text);
      TSocioResponsavelEmpresaVO(ObjetoVO).ValorProLabore         := StrToFloat(EditProlabore.Text);
      TSocioResponsavelEmpresaVO(ObjetoVO).CodigoSocioRfb         := StrToInt(EditCodigoRfb.Text);
      if RadioGroupResponsavel.ItemIndex = 0 then
        TSocioResponsavelEmpresaVO(ObjetoVO).Responsavel  := 'S'
      else
        TSocioResponsavelEmpresaVO(ObjetoVO).Responsavel  := 'N';
      if StatusTela = stInserindo then
        TSocioResponsavelEmpresaController(ObjetoController).Insere(TSocioResponsavelEmpresaVO(ObjetoVO))
      else
      if StatusTela = stEditando then
      begin
        TSocioResponsavelEmpresaVO(ObjetoVO).ID := IdRegistroSelecionado;
        TSocioResponsavelEmpresaController(ObjetoController).Altera(TSocioResponsavelEmpresaVO(ObjetoVO));
      end;
      Result := True;
    except
      Result := False;
    end;
  end;
end;
procedure TFSocioResponsavelEmpresa.PopulaEditEmpresa(Sender: TObject);
var
  Filtro : String;
begin

  Filtro := 'ID = ' + EditIdEmpresa.Text;

  ConfiguraCDSFromVO(FDataModule.CDSLookup,TEmpresaVO);

  TEmpresaController.SetDataSet(FDataModule.CDSLookup);
  TEmpresaController.Consulta(Filtro,0);
  try
    if (FDataModule.CDSLookup.FieldByName('ID').AsString <> '') then
   begin
     EditIdEmpresa.Text := FDataModule.CDSLookup.FieldByName('ID').AsString;
     EditEmpresa.Text   := FDataModule.CDSLookup.FieldByName('RAZAO_SOCIAL').AsString;
   end
   else
     begin
       EditIdSocio.SetFocus;
       keybd_event(VK_F1, 0, 0, 0);
     end;
  finally
    FDataModule.CDSLookup.Close;
  end;
end;

procedure TFSocioResponsavelEmpresa.PopulaEditSocio(Sender: TObject);
var
  Filtro : String;
begin

  Filtro := 'ID = ' + EditIdSocio.Text;

  ConfiguraCDSFromVO(FDataModule.CDSLookup,TResponsavelSocioVO);

  TResponsavelSocioController.SetDataSet(FDataModule.CDSLookup);
  TResponsavelSocioController.Consulta(Filtro,0);
  try
    if (FDataModule.CDSLookup.FieldByName('ID').AsString <> '') then
   begin
     EditIdSocio.Text := FDataModule.CDSLookup.FieldByName('ID').AsString;
     EditSocio.Text   := FDataModule.CDSLookup.FieldByName('PESSOA.NOME').AsString;
   end
   else
     begin
       EditIdSocio.SetFocus;
       keybd_event(VK_F1, 0, 0, 0);
     end;
  finally
    FDataModule.CDSLookup.Close;
  end;
end;


procedure TFSocioResponsavelEmpresa.EditIdEmpresaExit(Sender: TObject);
begin
  if (EditIdEmpresa.Text <> '') and (EditIdEmpresa.Text <> '0') then
   PopulaEditEmpresa(Self);
end;

procedure TFSocioResponsavelEmpresa.EditIdEmpresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    Application.CreateForm(TFLookup, FLookup);
    ULookup.FLookup.ObjetoVO := TEmpresaVO.Create;
    ULookup.FLookup.ObjetoController := TEmpresaController.Create;
    FLookup.ShowModal;
    EditIdEmpresa.Text := IntToStr(ULookup.FLookup.CDSLookup.FieldByName('ID').AsInteger);
    EditEmpresa.Text   := ULookup.FLookup.CDSLookup.FieldByName('RAZAO_SOCIAL').AsString;
  end;
  if Key = VK_RETURN then
    EditDataIngresso.SetFocus;
end;

procedure TFSocioResponsavelEmpresa.EditIdSocioExit(Sender: TObject);
begin
  if (EditIdSocio.Text <> '') and (EditIdSocio.Text <> '0') then
   PopulaEditSocio(Self);
end;
procedure TFSocioResponsavelEmpresa.EditIdSocioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    Application.CreateForm(TFLookup, FLookup);
    ULookup.FLookup.ObjetoVO := TResponsavelSocioVO.Create;
    ULookup.FLookup.ObjetoController := TResponsavelSocioController.Create;
    FLookup.ShowModal;
    EditIdSocio.Text := IntToStr(ULookup.FLookup.CDSLookup.FieldByName('ID').AsInteger);
    EditSocio.Text   := ULookup.FLookup.CDSLookup.FieldByName('PESSOA.NOME').AsString;
  end;
  if Key = VK_RETURN then
    EditIdEmpresa.SetFocus;
end;

{$ENDREGION}

procedure TFSocioResponsavelEmpresa.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TSocioResponsavelEmpresaVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdSocio.Text           := IntToStr(TSocioResponsavelEmpresaVO(ObjetoVO).IdResponsavelSocio);
    EditSocio.Text             := TSocioResponsavelEmpresaVO(ObjetoVO).NomeSocio;
    EditIdEmpresa.Text         := IntToStr(TSocioResponsavelEmpresaVO(ObjetoVO).IdEmpresa);
    EditEmpresa.Text           := TSocioResponsavelEmpresaVO(ObjetoVO).NomeEmpresa;
    EditDataIngresso.Date      := TSocioResponsavelEmpresaVO(ObjetoVO).DataIngresso;
    EditDataSaida.Date         := TSocioResponsavelEmpresaVO(ObjetoVO).DataSaida;
    EditTaxaCapitalVotante.Text:= FloatToStr(TSocioResponsavelEmpresaVO(ObjetoVO).PorcentoCapitalVotante);
    EditTaxaCapitalTotal.Text  := FloatToStr(TSocioResponsavelEmpresaVO(ObjetoVO).PorcentoCapitalTotal);
    EditProlabore.Text         := FloatToStr(TSocioResponsavelEmpresaVO(ObjetoVO).ValorProLabore);
    EditCodigoRFB.Text         := IntToStr(TSocioResponsavelEmpresaVO(ObjetoVO).CodigoSocioRfb);
    case AnsiIndexStr(TSocioResponsavelEmpresaVO(ObjetoVO).Responsavel, ['S', 'N']) of
      0:
        RadioGroupResponsavel.ItemIndex := 0;
      1:
        RadioGroupResponsavel.ItemIndex := 1;
    else
      RadioGroupResponsavel.ItemIndex := -1;
    end;

  end;
end;

end.

