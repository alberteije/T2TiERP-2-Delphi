{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de Lançamento Padrão do Módulo Contabilidade

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
unit UContabilLancamentoPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, ContabilLancamentoPadraoVO,
  ContabilLancamentoPadraoController, Tipos, Atributos, Constantes, LabeledCtrls, Mask, JvExMask,
  JvToolEdit, JvMaskEdit, JvExStdCtrls, JvEdit, JvValidateEdit, JvBaseEdits, Controller;

type
  [TFormDescription(TConstantes.MODULO_CONTABILIDADE, 'Lançamento Padrão')]

  TFContabilLancamentoPadrao = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditDescricao: TLabeledEdit;
    MemoHistorico: TLabeledMemo;
    EditContaDebito: TLabeledEdit;
    EditIdContaDebito: TLabeledCalcEdit;
    EditContaCredito: TLabeledEdit;
    EditIdContaCredito: TLabeledCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure EditIdContaDebitoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditIdContaCreditoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure ControlaBotoes; override;
    procedure ControlaPopupMenu; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;
  end;

var
  FContabilLancamentoPadrao: TFContabilLancamentoPadrao;

implementation

uses ULookup, Biblioteca, UDataModule, ContabilContaVO, ContabilContaController;
{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFContabilLancamentoPadrao.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContabilLancamentoPadraoVO;
  ObjetoController := TContabilLancamentoPadraoController.Create;
  inherited;
end;

procedure TFContabilLancamentoPadrao.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFContabilLancamentoPadrao.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFContabilLancamentoPadrao.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditDescricao.SetFocus;
  end;
end;

function TFContabilLancamentoPadrao.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditDescricao.SetFocus;
  end;
end;

function TFContabilLancamentoPadrao.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('ContabilLancamentoPadraoController.TContabilLancamentoPadraoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('ContabilLancamentoPadraoController.TContabilLancamentoPadraoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFContabilLancamentoPadrao.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TContabilLancamentoPadraoVO.Create;

      TContabilLancamentoPadraoVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TContabilLancamentoPadraoVO(ObjetoVO).Descricao := EditDescricao.Text;
      TContabilLancamentoPadraoVO(ObjetoVO).Historico := MemoHistorico.Text;
      TContabilLancamentoPadraoVO(ObjetoVO).IdContaDebito := EditIdContaDebito.AsInteger;
      TContabilLancamentoPadraoVO(ObjetoVO).IdContaCredito := EditIdContaCredito.AsInteger;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('ContabilLancamentoPadraoController.TContabilLancamentoPadraoController', 'Insere', [TContabilLancamentoPadraoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TContabilLancamentoPadraoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('ContabilLancamentoPadraoController.TContabilLancamentoPadraoController', 'Altera', [TContabilLancamentoPadraoVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFContabilLancamentoPadrao.GridParaEdits;
var
  ContabilContaVO: TContabilContaVO;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TContabilLancamentoPadraoVO(TController.BuscarObjeto('ContabilLancamentoPadraoController.TContabilLancamentoPadraoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditDescricao.Text := TContabilLancamentoPadraoVO(ObjetoVO).Descricao;
    MemoHistorico.Text := TContabilLancamentoPadraoVO(ObjetoVO).Historico;

    EditIdContaDebito.AsInteger := TContabilLancamentoPadraoVO(ObjetoVO).IdContaDebito;
    if EditIdContaDebito.AsInteger > 0 then
    begin
      ContabilContaVO := TContabilContaVO(TController.BuscarObjeto('ContabilContaController.TContabilContaController', 'ConsultaObjeto', ['ID=' + EditIdContaDebito.ToString], 'GET'));
      if Assigned(ContabilContaVO) then
        EditContaDebito.Text := ContabilContaVO.Descricao;
    end;

    EditIdContaCredito.AsInteger := TContabilLancamentoPadraoVO(ObjetoVO).IdContaCredito;
    if EditIdContaCredito.AsInteger > 0 then
    begin
      ContabilContaVO := TContabilContaVO(TController.BuscarObjeto('ContabilContaController.TContabilContaController', 'ConsultaObjeto', ['ID=' + EditIdContaCredito.ToString], 'GET'));
      if Assigned(ContabilContaVO) then
        EditContaCredito.Text := ContabilContaVO.Descricao;
    end;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFContabilLancamentoPadrao.EditIdContaCreditoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdContaCredito.Value <> 0 then
      Filtro := 'ID = ' + EditIdContaCredito.Text
    else
      Filtro := 'ID=0';

    try
      EditIdContaCredito.Clear;
      EditContaCredito.Clear;
      if not PopulaCamposTransientes(Filtro, TContabilContaVO, TContabilContaController) then
        PopulaCamposTransientesLookup(TContabilContaVO, TContabilContaController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdContaCredito.Text := CDSTransiente.FieldByName('ID').AsString;
        EditContaCredito.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
      end
      else
      begin
        Exit;
        EditDescricao.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFContabilLancamentoPadrao.EditIdContaDebitoKeyUp(Sender: TObject;  var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdContaDebito.Value <> 0 then
      Filtro := 'ID = ' + EditIdContaDebito.Text
    else
      Filtro := 'ID=0';

    try
      EditIdContaDebito.Clear;
      EditContaDebito.Clear;
      if not PopulaCamposTransientes(Filtro, TContabilContaVO, TContabilContaController) then
        PopulaCamposTransientesLookup(TContabilContaVO, TContabilContaController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdContaDebito.Text := CDSTransiente.FieldByName('ID').AsString;
        EditContaDebito.Text := CDSTransiente.FieldByName('DESCRICAO').AsString;
      end
      else
      begin
        Exit;
        EditIdContaCredito.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;
{$ENDREGION}

end.
