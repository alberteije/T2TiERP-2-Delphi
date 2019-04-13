{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Tipo de Pagamento

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

@author Albert Eije
@version 2.0
******************************************************************************* }
unit UFinTipoPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, FinTipoPagamentoVO,
  FinTipoPagamentoController, Tipos, Atributos, Constantes, LabeledCtrls, StrUtils,
  Controller;

type
  [TFormDescription(TConstantes.MODULO_FINANCEIRO, 'Tipo Pagamento')]

  TFFinTipoPagamento = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditTipo: TLabeledEdit;
    EditDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
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
  FFinTipoPagamento: TFFinTipoPagamento;

implementation

{$R *.dfm}

{$REGION 'Infra'}
procedure TFFinTipoPagamento.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TFinTipoPagamentoVO;
  ObjetoController := TFinTipoPagamentoController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFFinTipoPagamento.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditTipo.SetFocus;
  end;
end;

function TFFinTipoPagamento.DoEditar: Boolean;
begin
  if AnsiIndexStr(CDSGrid.FieldByName('TIPO').AsString, ['01', '02', '03']) <> -1 then
  begin
    Application.MessageBox('Esse registro não pode ser alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    Exit(False);
  end;

  Result := inherited DoEditar;

  if Result then
  begin
    EditTipo.SetFocus;
  end;
end;

function TFFinTipoPagamento.DoExcluir: Boolean;
begin
  if AnsiIndexStr(CDSGrid.FieldByName('TIPO').AsString, ['01', '02', '03']) <> -1 then
  begin
    Application.MessageBox('Esse registro não pode ser excluído.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    Exit(False);
  end;

  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('FinTipoPagamentoController.TFinTipoPagamentoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('FinTipoPagamentoController.TFinTipoPagamentoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFFinTipoPagamento.DoSalvar: Boolean;
begin
  if AnsiIndexStr(EditTipo.Text, ['01', '02', '03']) <> -1 then
  begin
    Application.MessageBox('O código informado para o tipo não pode ser cadastrado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditTipo.SetFocus;
    Exit(False);
  end;

  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TFinTipoPagamentoVO.Create;

      TFinTipoPagamentoVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TFinTipoPagamentoVO(ObjetoVO).Tipo := EditTipo.Text;
      TFinTipoPagamentoVO(ObjetoVO).Descricao := EditDescricao.Text;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('FinTipoPagamentoController.TFinTipoPagamentoController', 'Insere', [TFinTipoPagamentoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TFinTipoPagamentoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('FinTipoPagamentoController.TFinTipoPagamentoController', 'Altera', [TFinTipoPagamentoVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFFinTipoPagamento.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TFinTipoPagamentoVO(TController.BuscarObjeto('FinTipoPagamentoController.TFinTipoPagamentoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditTipo.Text := TFinTipoPagamentoVO(ObjetoVO).Tipo;
    EditDescricao.Text := TFinTipoPagamentoVO(ObjetoVO).Descricao;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.
