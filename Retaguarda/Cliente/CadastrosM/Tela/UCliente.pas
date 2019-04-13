{ *******************************************************************************
  Title: T2Ti ERP
  Description:  VO  relacionado à tabela [CLIENTE]

  The MIT License

  Copyright: Copyright (C) 2015 T2Ti.COM

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

  @author Albert Eije
  @version 2.0
  ******************************************************************************* }
unit UCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, Mask, JvExMask, JvToolEdit,
  JvCombobox, LabeledCtrls, DBCtrls, LabeledDBCtrls, DB, DBClient, StrUtils,
  Math, JSonVO, Generics.Collections,
  Atributos, Constantes, CheckLst, JvExCheckLst, JvCheckListBox, JvBaseEdits,
  ULookup, PessoaVO, PessoaController;

type
  [TFormDescription(TConstantes.MODULO_CADASTROS, 'Cliente')]

  TFCliente = class(TFTelaCadastro)
    ScrollBox: TScrollBox;
    BevelEdits: TBevel;
    EditDataDesde: TLabeledDateEdit;
    EditIdContabilConta: TLabeledCalcEdit;
    EditContabilConta: TLabeledEdit;
    EditAtividadeForCli: TLabeledEdit;
    EditOperacaoFiscal: TLabeledEdit;
    EditSituacaoForCli: TLabeledEdit;
    EditNomePessoa: TLabeledEdit;
    EditIdPessoa: TLabeledCalcEdit;
    EditIdOperacaoFiscal: TLabeledCalcEdit;
    EditIdAtividadeForCli: TLabeledCalcEdit;
    EditIdSituacaoForCli: TLabeledCalcEdit;
    MemoObservacao: TLabeledMemo;
    ComboBoxGeraFinanceiro: TLabeledComboBox;
    ComboBoxIndicadorPreco: TLabeledComboBox;
    ComboBoxTipoFrete: TLabeledComboBox;
    EditContaTomador: TLabeledEdit;
    ComboBoxFormaDesconto: TLabeledComboBox;
    EditDesconto: TLabeledCalcEdit;
    EditLimiteCredito: TLabeledCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure EditIdPessoaExit(Sender: TObject);
    procedure EditIdPessoaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdPessoaKeyPress(Sender: TObject; var Key: Char);
    procedure EditIdSituacaoForCliExit(Sender: TObject);
    procedure EditIdSituacaoForCliKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdSituacaoForCliKeyPress(Sender: TObject; var Key: Char);
    procedure EditIdAtividadeForCliExit(Sender: TObject);
    procedure EditIdAtividadeForCliKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdAtividadeForCliKeyPress(Sender: TObject; var Key: Char);
    procedure EditIdContabilContaExit(Sender: TObject);
    procedure EditIdContabilContaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdContabilContaKeyPress(Sender: TObject; var Key: Char);
    procedure EditIdOperacaoFiscalExit(Sender: TObject);
    procedure EditIdOperacaoFiscalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdOperacaoFiscalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;
  end;

var
  FCliente: TFCliente;

implementation

uses Biblioteca, ClienteVO, ClienteController, UDataModule, SituacaoForCliVO,
SituacaoForCliController, AtividadeForCliVO, AtividadeForCliController,
ContabilContaVO, ContabilContaController, TributOperacaoFiscalVO, TributOperacaoFiscalController;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFCliente.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TClienteVO;
  ObjetoController := TClienteController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFCliente.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditDataDesde.Date := Date();
    EditIdPessoa.SetFocus;
  end;
end;

function TFCliente.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditIdPessoa.SetFocus;
  end;
end;

function TFCliente.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      Result := TPessoaController(ObjetoController).Exclui(IdRegistroSelecionado);
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TClienteController(ObjetoController).Consulta(Filtro, Pagina);
end;

function TFCliente.DoSalvar: Boolean;
begin
  if EditIdPessoa.Text = '' then
  begin
    Application.MessageBox('Informe o Código da Pessoa.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditIdPessoa.SetFocus;
    Exit(False);
  end
  else if EditIdAtividadeForCli.Text = '' then
  begin
    Application.MessageBox('Informe o Código de Atividade do Cliente.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditIdAtividadeForCli.SetFocus;
    Exit(False);
  end
  else if EditIdSituacaoForCli.Text = '' then
  begin
    Application.MessageBox('Informe o Código da Situação do Cliente.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditIdSituacaoForCli.SetFocus;
    Exit(False);
  end;

  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TClienteVO.Create;

      TClienteVO(ObjetoVO).DataCadastro := Date();
      TClienteVO(ObjetoVO).IdPessoa := EditIdPessoa.AsInteger;
      TClienteVO(ObjetoVO).PessoaNome := EditNomePessoa.Text;
      TClienteVO(ObjetoVO).IdSituacaoForCli := EditIdSituacaoForCli.AsInteger;
      TClienteVO(ObjetoVO).SituacaoForCliNome := EditSituacaoForCli.Text;
      TClienteVO(ObjetoVO).IdAtividadeForCli := EditIdAtividadeForCli.AsInteger;
      TClienteVO(ObjetoVO).AtividadeForCliNome := EditAtividadeForCli.Text;
      TClienteVO(ObjetoVO).IdContabilConta := EditIdContabilConta.AsInteger;
      TClienteVO(ObjetoVO).ContabilContaClassificacao := EditContabilConta.Text;
      TClienteVO(ObjetoVO).IdTributOperacaoFiscal := EditIdOperacaoFiscal.AsInteger;
      TClienteVO(ObjetoVO).TributOperacaoFiscalDescricao := EditOperacaoFiscal.Text;
      TClienteVO(ObjetoVO).ContaTomador := EditContaTomador.Text;
      TClienteVO(ObjetoVO).PorcentoDesconto := EditDesconto.Value;
      TClienteVO(ObjetoVO).LimiteCredito := EditLimiteCredito.Value;
      TClienteVO(ObjetoVO).Desde := EditDataDesde.Date;
      TClienteVO(ObjetoVO).GeraFinanceiro := Copy(ComboBoxGeraFinanceiro.Text, 1, 1);
      TClienteVO(ObjetoVO).IndicadorPreco := Copy(ComboBoxIndicadorPreco.Text, 1, 1);
      TClienteVO(ObjetoVO).TipoFrete := Copy(ComboBoxTipoFrete.Text, 1, 1);
      TClienteVO(ObjetoVO).FormaDesconto := Copy(ComboBoxFormaDesconto.Text, 1, 1);
      TClienteVO(ObjetoVO).Observacao := MemoObservacao.Text;

      if StatusTela = stInserindo then
        Result := TClienteController(ObjetoController).Insere(TClienteVO(ObjetoVO))
      else if StatusTela = stEditando then
      begin
        if TClienteVO(ObjetoVO).ToJSONString <> TClienteVO(ObjetoOldVO).ToJSONString then
        begin
          TClienteVO(ObjetoVO).Id := IdRegistroSelecionado;
          Result := TClienteController(ObjetoController).Altera(TClienteVO(ObjetoVO), TClienteVO(ObjetoOldVO));
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
procedure TFCliente.EditIdAtividadeForCliExit(Sender: TObject);
var
  Filtro: String;
begin
  if EditIdAtividadeForCli.Value <> 0 then
  begin
    try
      Filtro := 'ID = ' + EditIdAtividadeForCli.Text;
      EditIdAtividadeForCli.Clear;
      EditAtividadeForCli.Clear;
      if not PopulaCamposTransientes(Filtro, TAtividadeForCliVO, TAtividadeForCliController) then
        PopulaCamposTransientesLookup(TAtividadeForCliVO, TAtividadeForCliController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdAtividadeForCli.Text := CDSTransiente.FieldByName('ID').AsString;
        EditAtividadeForCli.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditIdAtividadeForCli.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end
  else
  begin
    EditAtividadeForCli.Clear;
  end;
end;

procedure TFCliente.EditIdAtividadeForCliKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    EditIdAtividadeForCli.Value := -1;
    EditIdContabilConta.SetFocus;
  end;
end;

procedure TFCliente.EditIdAtividadeForCliKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    EditIdContabilConta.SetFocus;
  end;
end;

procedure TFCliente.EditIdContabilContaExit(Sender: TObject);
var
  Filtro: String;
begin
  if EditIdContabilConta.Value <> 0 then
  begin
    try
      Filtro := 'ID = ' + EditIdContabilConta.Text;
      EditIdContabilConta.Clear;
      EditContabilConta.Clear;
      if not PopulaCamposTransientes(Filtro, TContabilContaVO, TContabilContaController) then
        PopulaCamposTransientesLookup(TContabilContaVO, TContabilContaController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdContabilConta.Text := CDSTransiente.FieldByName('ID').AsString;
        EditContabilConta.Text := CDSTransiente.FieldByName('CLASSIFICACAO').AsString;
      end
      else
      begin
        Exit;
        EditIdContabilConta.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end
  else
  begin
    EditContabilConta.Clear;
  end;
end;

procedure TFCliente.EditIdContabilContaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    EditIdContabilConta.Value := -1;
    EditIdOperacaoFiscal.SetFocus;
  end;
end;

procedure TFCliente.EditIdContabilContaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    EditIdOperacaoFiscal.SetFocus;
  end;
end;

procedure TFCliente.EditIdOperacaoFiscalExit(Sender: TObject);
var
  Filtro: String;
begin
  if EditIdOperacaoFiscal.Value <> 0 then
  begin
    try
      Filtro := 'ID = ' + EditIdOperacaoFiscal.Text;
      EditIdOperacaoFiscal.Clear;
      EditOperacaoFiscal.Clear;
      if not PopulaCamposTransientes(Filtro, TTributOperacaoFiscalVO, TTributOperacaoFiscalController) then
        PopulaCamposTransientesLookup(TTributOperacaoFiscalVO, TTributOperacaoFiscalController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdOperacaoFiscal.Text := CDSTransiente.FieldByName('ID').AsString;
        EditOperacaoFiscal.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
      end
      else
      begin
        Exit;
        EditIdOperacaoFiscal.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end
  else
  begin
    EditOperacaoFiscal.Clear;
  end;
end;

procedure TFCliente.EditIdOperacaoFiscalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    EditIdOperacaoFiscal.Value := -1;
    EditDataDesde.SetFocus;
  end;
end;

procedure TFCliente.EditIdOperacaoFiscalKeyPress(Sender: TObject;  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    EditDataDesde.SetFocus;
  end;
end;

procedure TFCliente.EditIdPessoaExit(Sender: TObject);
var
  Filtro: String;
begin
  if EditIdPessoa.Value <> 0 then
  begin
    try
      Filtro := 'ID = ' + EditIdPessoa.Text;
      EditIdPessoa.Clear;
      EditNomePessoa.Clear;
      if not PopulaCamposTransientes(Filtro, TPessoaVO, TPessoaController) then
        PopulaCamposTransientesLookup(TPessoaVO, TPessoaController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdPessoa.Text := CDSTransiente.FieldByName('ID').AsString;
        EditNomePessoa.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditIdPessoa.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end
  else
  begin
    EditNomePessoa.Clear;
  end;
end;

procedure TFCliente.EditIdPessoaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    EditIdPessoa.Value := -1;
    EditIdSituacaoForCli.SetFocus;
  end;
end;

procedure TFCliente.EditIdPessoaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    EditIdSituacaoForCli.SetFocus;
  end;
end;

procedure TFCliente.EditIdSituacaoForCliExit(Sender: TObject);
var
  Filtro: String;
begin
  if EditIdSituacaoForCli.Value <> 0 then
  begin
    try
      Filtro := 'ID = ' + EditIdSituacaoForCli.Text;
      EditIdSituacaoForCli.Clear;
      EditSituacaoForCli.Clear;
      if not PopulaCamposTransientes(Filtro, TSituacaoForCliVO, TSituacaoForCliController) then
        PopulaCamposTransientesLookup(TSituacaoForCliVO, TSituacaoForCliController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdSituacaoForCli.Text := CDSTransiente.FieldByName('ID').AsString;
        EditSituacaoForCli.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditIdSituacaoForCli.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end
  else
  begin
    EditSituacaoForCli.Clear;
  end;
end;

procedure TFCliente.EditIdSituacaoForCliKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    EditIdSituacaoForCli.Value := -1;
    EditAtividadeForCli.SetFocus;
  end;
end;

procedure TFCliente.EditIdSituacaoForCliKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    EditAtividadeForCli.SetFocus;
  end;
end;

{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFCliente.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TClienteVO>(IdRegistroSelecionado);
    if StatusTela = stEditando then
      ObjetoOldVO := ObjetoVO.Clone;
  end;

  if Assigned(ObjetoVO) then
  begin
    // Cliente
    EditDataDesde.Date := TClienteVO(ObjetoVO).Desde;
    EditIdPessoa.AsInteger := TClienteVO(ObjetoVO).IdPessoa;
    EditNomePessoa.Text := TClienteVO(ObjetoVO).PessoaNome;
    EditIdSituacaoForCli.AsInteger := TClienteVO(ObjetoVO).IdSituacaoForCli;
    EditSituacaoForCli.Text := TClienteVO(ObjetoVO).SituacaoForCliNome;
    EditIdAtividadeForCli.AsInteger := TClienteVO(ObjetoVO).IdAtividadeForCli;
    EditAtividadeForCli.Text := TClienteVO(ObjetoVO).AtividadeForCliNome;
    EditIdContabilConta.AsInteger := TClienteVO(ObjetoVO).IdContabilConta;
    EditContabilConta.Text := TClienteVO(ObjetoVO).ContabilContaClassificacao;
    EditIdOperacaoFiscal.AsInteger := TClienteVO(ObjetoVO).IdTributOperacaoFiscal;
    EditOperacaoFiscal.Text := TClienteVO(ObjetoVO).TributOperacaoFiscalDescricao;
    EditContaTomador.Text := TClienteVO(ObjetoVO).ContaTomador;
    EditDesconto.Value := TClienteVO(ObjetoVO).PorcentoDesconto;
    EditLimiteCredito.Value := TClienteVO(ObjetoVO).LimiteCredito;
    ComboBoxGeraFinanceiro.ItemIndex := AnsiIndexStr(TClienteVO(ObjetoVO).GeraFinanceiro, ['S', 'N']);
    ComboBoxIndicadorPreco.ItemIndex := AnsiIndexStr(TClienteVO(ObjetoVO).IndicadorPreco, ['T', 'P']);
    ComboBoxTipoFrete.ItemIndex := AnsiIndexStr(TClienteVO(ObjetoVO).TipoFrete, ['E', 'D', 'S', 'T']);
    ComboBoxFormaDesconto.ItemIndex := AnsiIndexStr(TClienteVO(ObjetoVO).FormaDesconto, ['P', 'F']);
    MemoObservacao.Text := TClienteVO(ObjetoVO).Observacao;
  end;
end;
{$ENDREGION}

end.
