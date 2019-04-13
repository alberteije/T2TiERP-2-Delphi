{ *******************************************************************************
  Title: T2Ti ERP
  Description:  VO  relacionado à tabela [Transportadora]

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
unit UTransportadora;

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
  [TFormDescription(TConstantes.MODULO_CADASTROS, 'Transportadora')]

  TFTransportadora = class(TFTelaCadastro)
    ScrollBox: TScrollBox;
    BevelEdits: TBevel;
    EditIdContabilConta: TLabeledCalcEdit;
    EditContabilConta: TLabeledEdit;
    EditNomePessoa: TLabeledEdit;
    EditIdPessoa: TLabeledCalcEdit;
    MemoObservacao: TLabeledMemo;
    procedure FormCreate(Sender: TObject);
    procedure EditIdPessoaExit(Sender: TObject);
    procedure EditIdPessoaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdPessoaKeyPress(Sender: TObject; var Key: Char);
    procedure EditIdContabilContaExit(Sender: TObject);
    procedure EditIdContabilContaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdContabilContaKeyPress(Sender: TObject; var Key: Char);
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
  FTransportadora: TFTransportadora;

implementation

uses Biblioteca, TransportadoraVO, TransportadoraController, UDataModule,
ContabilContaVO, ContabilContaController;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFTransportadora.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TTransportadoraVO;
  ObjetoController := TTransportadoraController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFTransportadora.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditIdPessoa.SetFocus;
  end;
end;

function TFTransportadora.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditIdPessoa.SetFocus;
  end;
end;

function TFTransportadora.DoExcluir: Boolean;
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
    TTransportadoraController(ObjetoController).Consulta(Filtro, Pagina);
end;

function TFTransportadora.DoSalvar: Boolean;
begin
  if EditIdPessoa.Text = '' then
  begin
    Application.MessageBox('Informe o Código da Pessoa.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditIdPessoa.SetFocus;
    Exit(False);
  end;

  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TTransportadoraVO.Create;

      TTransportadoraVO(ObjetoVO).DataCadastro := Date();
      TTransportadoraVO(ObjetoVO).IdPessoa := EditIdPessoa.AsInteger;
      TTransportadoraVO(ObjetoVO).PessoaNome := EditNomePessoa.Text;
      TTransportadoraVO(ObjetoVO).IdContabilConta := EditIdContabilConta.AsInteger;
      TTransportadoraVO(ObjetoVO).ContabilContaClassificacao := EditContabilConta.Text;
      TTransportadoraVO(ObjetoVO).Observacao := MemoObservacao.Text;

      if StatusTela = stInserindo then
        Result := TTransportadoraController(ObjetoController).Insere(TTransportadoraVO(ObjetoVO))
      else if StatusTela = stEditando then
      begin
        if TTransportadoraVO(ObjetoVO).ToJSONString <> TTransportadoraVO(ObjetoOldVO).ToJSONString then
        begin
          TTransportadoraVO(ObjetoVO).Id := IdRegistroSelecionado;
          Result := TTransportadoraController(ObjetoController).Altera(TTransportadoraVO(ObjetoVO), TTransportadoraVO(ObjetoOldVO));
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
procedure TFTransportadora.EditIdContabilContaExit(Sender: TObject);
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

procedure TFTransportadora.EditIdContabilContaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    EditIdContabilConta.Value := -1;
    MemoObservacao.SetFocus;
  end;
end;

procedure TFTransportadora.EditIdContabilContaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    MemoObservacao.SetFocus;
  end;
end;

procedure TFTransportadora.EditIdPessoaExit(Sender: TObject);
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

procedure TFTransportadora.EditIdPessoaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    EditIdPessoa.Value := -1;
    EditIdContabilConta.SetFocus;
  end;
end;

procedure TFTransportadora.EditIdPessoaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    EditIdContabilConta.SetFocus;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFTransportadora.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TTransportadoraVO>(IdRegistroSelecionado);
    if StatusTela = stEditando then
      ObjetoOldVO := ObjetoVO.Clone;
  end;

  if Assigned(ObjetoVO) then
  begin
    // Transportadora
    EditIdPessoa.AsInteger := TTransportadoraVO(ObjetoVO).IdPessoa;
    EditNomePessoa.Text := TTransportadoraVO(ObjetoVO).PessoaNome;
    EditIdContabilConta.AsInteger := TTransportadoraVO(ObjetoVO).IdContabilConta;
    EditContabilConta.Text := TTransportadoraVO(ObjetoVO).ContabilContaClassificacao;
    MemoObservacao.Text := TTransportadoraVO(ObjetoVO).Observacao;
  end;
end;
{$ENDREGION}

end.
