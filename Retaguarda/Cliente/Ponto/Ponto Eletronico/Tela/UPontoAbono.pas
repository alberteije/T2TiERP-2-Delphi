{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Abonos para o Ponto Eletrônico

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

@author Albert Eije (alberteije@gmail.com)
@version 2.0
******************************************************************************* }
unit UPontoAbono;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, PontoAbonoVO,
  PontoAbonoController, Tipos, Atributos, Constantes, LabeledCtrls, JvToolEdit,
  Mask, JvExMask, JvBaseEdits, Math, StrUtils, ActnList, Generics.Collections,
  RibbonSilverStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, Controller;

type
  [TFormDescription(TConstantes.MODULO_PONTO_ELETRONICO, 'Abonos')]

  TFPontoAbono = class(TFTelaCadastro)
    DSPontoAbonoUtilizacao: TDataSource;
    CDSPontoAbonoUtilizacao: TClientDataSet;
    CDSPontoAbonoUtilizacaoID: TIntegerField;
    CDSPontoAbonoUtilizacaoID_PONTO_ABONO: TIntegerField;
    CDSPontoAbonoUtilizacaoDATA_UTILIZACAO: TDateField;
    CDSPontoAbonoUtilizacaoOBSERVACAO: TStringField;
    PanelMestre: TPanel;
    EditIdColaborador: TLabeledCalcEdit;
    EditColaborador: TLabeledEdit;
    EditInicioUtilizacao: TLabeledDateEdit;
    EditQuantidade: TLabeledCalcEdit;
    EditDataCadastro: TLabeledDateEdit;
    EditUtilizado: TLabeledCalcEdit;
    EditSaldo: TLabeledCalcEdit;
    MemoObservacao: TLabeledMemo;
    PageControlItens: TPageControl;
    tsItens: TTabSheet;
    PanelItens: TPanel;
    GridParcelas: TJvDBUltimGrid;
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure EditIdColaboradorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure LimparCampos; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;

    procedure ConfigurarLayoutTela;
  end;

var
  FPontoAbono: TFPontoAbono;

implementation

uses ULookup, Biblioteca, UDataModule, PontoAbonoUtilizacaoVO,
ViewPessoaColaboradorVO, ViewPessoaColaboradorController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFPontoAbono.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPontoAbonoVO;
  ObjetoController := TPontoAbonoController.Create;

  inherited;
end;

procedure TFPontoAbono.LimparCampos;
begin
  inherited;
  CDSPontoAbonoUtilizacao.EmptyDataSet;
end;

procedure TFPontoAbono.ConfigurarLayoutTela;
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
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFPontoAbono.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditIdColaborador.SetFocus;
  end;
end;

function TFPontoAbono.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  ConfigurarLayoutTela;
  if Result then
  begin
    EditIdColaborador.SetFocus;
  end;
end;

function TFPontoAbono.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('PontoAbonoController.TPontoAbonoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('PontoAbonoController.TPontoAbonoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFPontoAbono.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TPontoAbonoVO.Create;

      TPontoAbonoVO(ObjetoVO).IdColaborador := EditIdColaborador.AsInteger;
      TPontoAbonoVO(ObjetoVO).Quantidade := EditQuantidade.AsInteger;
      TPontoAbonoVO(ObjetoVO).Utilizado := EditUtilizado.AsInteger;
      TPontoAbonoVO(ObjetoVO).Saldo := EditSaldo.AsInteger;
      TPontoAbonoVO(ObjetoVO).DataCadastro := EditDataCadastro.Date;
      TPontoAbonoVO(ObjetoVO).InicioUtilizacao := EditInicioUtilizacao.Date;
      TPontoAbonoVO(ObjetoVO).Observacao := MemoObservacao.Text;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('PontoAbonoController.TPontoAbonoController', 'Insere', [TPontoAbonoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TPontoAbonoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('PontoAbonoController.TPontoAbonoController', 'Altera', [TPontoAbonoVO(ObjetoVO)], 'POST', 'Boolean');
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

{$REGION 'Campos Transientes'}
procedure TFPontoAbono.EditIdColaboradorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdColaborador.Value <> 0 then
      Filtro := 'ID = ' + EditIdColaborador.Text
    else
      Filtro := 'ID=0';

    try
      EditIdColaborador.Clear;
      EditColaborador.Clear;
      if not PopulaCamposTransientes(Filtro, TViewPessoaColaboradorVO, TViewPessoaColaboradorController) then
        PopulaCamposTransientesLookup(TViewPessoaColaboradorVO, TViewPessoaColaboradorController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdColaborador.Text := CDSTransiente.FieldByName('ID').AsString;
        EditColaborador.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditQuantidade.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFPontoAbono.GridDblClick(Sender: TObject);
begin
  inherited;
  ConfigurarLayoutTela;
end;

procedure TFPontoAbono.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TPontoAbonoVO(TController.BuscarObjeto('PontoAbonoController.TPontoAbonoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdColaborador.AsInteger := TPontoAbonoVO(ObjetoVO).IdColaborador;
    EditColaborador.Text := TPontoAbonoVO(ObjetoVO).ColaboradorNome;
    EditQuantidade.AsInteger := TPontoAbonoVO(ObjetoVO).Quantidade;
    EditUtilizado.AsInteger := TPontoAbonoVO(ObjetoVO).Utilizado;
    EditSaldo.AsInteger := TPontoAbonoVO(ObjetoVO).Saldo;
    EditDataCadastro.Date := TPontoAbonoVO(ObjetoVO).DataCadastro;
    EditInicioUtilizacao.Date := TPontoAbonoVO(ObjetoVO).InicioUtilizacao;
    MemoObservacao.Text := TPontoAbonoVO(ObjetoVO).Observacao;

    // Preenche as grids internas com os dados das Listas que vieram no objeto
    TController.TratarRetorno<TPontoAbonoUtilizacaoVO>(TPontoAbonoVO(ObjetoVO).ListaPontoAbonoUtilizacaoVO, True, True, CDSPontoAbonoUtilizacao);

    // Limpa as listas para comparar posteriormente se houve inclusões/alterações e subir apenas o necessário para o servidor
    TPontoAbonoVO(ObjetoVO).ListaPontoAbonoUtilizacaoVO.Clear;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
  ConfigurarLayoutTela;
end;
{$ENDREGION}

end.
