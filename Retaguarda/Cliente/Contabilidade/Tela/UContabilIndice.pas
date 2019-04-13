{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de Cadastro de Índices para o módulo Contabilidade

The MIT License

Copyright: Copyright (C) 2016 T2Ti.COM

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

@author Albert Eije (t2ti.com@gmail.com)
@version 2.0
******************************************************************************* }
unit UContabilIndice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, ContabilIndiceVO,
  ContabilIndiceController, Tipos, Atributos, Constantes, LabeledCtrls, JvToolEdit,
  Mask, JvExMask, JvBaseEdits, Math, StrUtils, ActnList, Generics.Collections,
  RibbonSilverStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, Controller;

type
  [TFormDescription(TConstantes.MODULO_CONTABILIDADE, 'Índices')]

  TFContabilIndice = class(TFTelaCadastro)
    DSContabilIndiceValor: TDataSource;
    CDSContabilIndiceValor: TClientDataSet;
    PanelMestre: TPanel;
    PageControlItens: TPageControl;
    tsItens: TTabSheet;
    PanelItens: TPanel;
    GridDetalhe: TJvDBUltimGrid;
    ComboBoxPeriodicidade: TLabeledComboBox;
    CDSContabilIndiceValorID: TIntegerField;
    CDSContabilIndiceValorID_CONTABIL_INDICE: TIntegerField;
    CDSContabilIndiceValorDATA_INDICE: TDateField;
    CDSContabilIndiceValorVALOR: TFMTBCDField;
    EditMensalMesAno: TLabeledMaskEdit;
    EditDiarioAPartirDe: TLabeledDateEdit;
    EditIdIndiceEconomico: TLabeledCalcEdit;
    EditIndiceEconomico: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure EditIdIndiceEconomicoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure LimparCampos; override;
    procedure ControlaBotoes; override;
    procedure ControlaPopupMenu; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;

    procedure ConfigurarLayoutTela;
  end;

var
  FContabilIndice: TFContabilIndice;

implementation

uses ULookup, Biblioteca, UDataModule, ContabilIndiceValorVO, IndiceEconomicoVO,
IndiceEconomicoController;
{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFContabilIndice.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContabilIndiceVO;
  ObjetoController := TContabilIndiceController.Create;

  inherited;
end;

procedure TFContabilIndice.LimparCampos;
begin
  inherited;
  CDSContabilIndiceValor.EmptyDataSet;
end;

procedure TFContabilIndice.ConfigurarLayoutTela;
begin
  PanelEdits.Enabled := True;

  if StatusTela = stNavegandoEdits then
  begin
    PanelMestre.Enabled := False;
    PanelItens.Enabled := False;
  end
  else
  begin
    PanelMestre.Enabled := True;
    PanelItens.Enabled := True;
  end;
end;

procedure TFContabilIndice.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFContabilIndice.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFContabilIndice.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditIdIndiceEconomico.SetFocus;
  end;
end;

function TFContabilIndice.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditIdIndiceEconomico.SetFocus;
  end;
end;

function TFContabilIndice.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('ContabilIndiceController.TContabilIndiceController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
      Result := TController.RetornoBoolean;
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TController.ExecutarMetodo('ContabilIndiceController.TContabilIndiceController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFContabilIndice.DoSalvar: Boolean;
var
  ContabilIndiceValor: TContabilIndiceValorVO;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TContabilIndiceVO.Create;

      TContabilIndiceVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TContabilIndiceVO(ObjetoVO).IdIndiceEconomico := EditIdIndiceEconomico.AsInteger;
      TContabilIndiceVO(ObjetoVO).Periodicidade := IfThen(ComboBoxPeriodicidade.ItemIndex = 0, 'D', 'M');
      TContabilIndiceVO(ObjetoVO).MensalMesAno := EditMensalMesAno.Text;
      TContabilIndiceVO(ObjetoVO).DiarioAPartirDe := EditDiarioAPartirDe.Date;

      // Valores
      TContabilIndiceVO(ObjetoVO).ListaContabilIndiceValorVO := TObjectList<TContabilIndiceValorVO>.Create;
      CDSContabilIndiceValor.DisableControls;
      CDSContabilIndiceValor.First;
      while not CDSContabilIndiceValor.Eof do
      begin
        ContabilIndiceValor := TContabilIndiceValorVO.Create;
        ContabilIndiceValor.Id := CDSContabilIndiceValorID.AsInteger;
        ContabilIndiceValor.IdContabilIndice := TContabilIndiceVO(ObjetoVO).Id;
        ContabilIndiceValor.DataIndice := CDSContabilIndiceValorDATA_INDICE.AsDateTime;
        ContabilIndiceValor.Valor := CDSContabilIndiceValorVALOR.AsFloat;
        TContabilIndiceVO(ObjetoVO).ListaContabilIndiceValorVO.Add(ContabilIndiceValor);
        CDSContabilIndiceValor.Next;
      end;
      CDSContabilIndiceValor.EnableControls;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('ContabilIndiceController.TContabilIndiceController', 'Insere', [TContabilIndiceVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TContabilIndiceVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('ContabilIndiceController.TContabilIndiceController', 'Altera', [TContabilIndiceVO(ObjetoVO)], 'POST', 'Boolean');
        end
        else
          Application.MessageBox('Nenhum dado foi alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
      end;
    except
      Result := False;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFContabilIndice.GridDblClick(Sender: TObject);
begin
  inherited;
  ConfigurarLayoutTela;
end;

procedure TFContabilIndice.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TContabilIndiceVO(TController.BuscarObjeto('ContabilIndiceController.TContabilIndiceController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdIndiceEconomico.AsInteger := TContabilIndiceVO(ObjetoVO).IdIndiceEconomico;
    EditIndiceEconomico.Text := TContabilIndiceVO(ObjetoVO).IndiceEconomicoSigla;
    ComboBoxPeriodicidade.ItemIndex := StrToInt(IfThen(TContabilIndiceVO(ObjetoVO).Periodicidade = 'D', '0', '1'));
    EditMensalMesAno.Text := TContabilIndiceVO(ObjetoVO).MensalMesAno;
    EditDiarioAPartirDe.Date := TContabilIndiceVO(ObjetoVO).DiarioAPartirDe;

    // Preenche as grids internas com os dados das Listas que vieram no objeto
    TController.TratarRetorno<TContabilIndiceValorVO>(TContabilIndiceVO(ObjetoVO).ListaContabilIndiceValorVO, True, True, CDSContabilIndiceValor);

    // Limpa as listas para comparar posteriormente se houve inclusões/alterações e subir apenas o necessário para o servidor
    TContabilIndiceVO(ObjetoVO).ListaContabilIndiceValorVO.Clear;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;

  ConfigurarLayoutTela;
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFContabilIndice.EditIdIndiceEconomicoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdIndiceEconomico.Value <> 0 then
      Filtro := 'ID = ' + EditIdIndiceEconomico.Text
    else
      Filtro := 'ID=0';

    try
      EditIdIndiceEconomico.Clear;
      EditIndiceEconomico.Clear;
      if not PopulaCamposTransientes(Filtro, TIndiceEconomicoVO, TIndiceEconomicoController) then
        PopulaCamposTransientesLookup(TIndiceEconomicoVO, TIndiceEconomicoController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdIndiceEconomico.Text := CDSTransiente.FieldByName('ID').AsString;
        EditIndiceEconomico.Text := CDSTransiente.FieldByName('SIGLA').AsString;
      end
      else
      begin
        Exit;
        ComboBoxPeriodicidade.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;
{$ENDREGION}

end.
