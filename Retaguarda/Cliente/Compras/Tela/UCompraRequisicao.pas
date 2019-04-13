{ *******************************************************************************
Title: T2Ti ERP
Description: Janela de Requisição de Compra

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
t2ti.com@gmail.com

@author Albert Eije
@version 2.0
******************************************************************************* }
unit UCompraRequisicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, LabeledCtrls, Atributos, Constantes,
  Mask, JvExMask, JvToolEdit, JvBaseEdits, DB, DBClient, Generics.Collections,
  WideStrings, DBXMySql, FMTBcd, Provider, SqlExpr, StrUtils, System.Actions,
  Vcl.ActnList, Vcl.RibbonSilverStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin,
  Vcl.ActnCtrls, Controller, Biblioteca;

type
  [TFormDescription(TConstantes.MODULO_COMPRAS, 'Requisição')]

  TFCompraRequisicao = class(TFTelaCadastro)
    GroupBoxCompraRequisicaoDetalhe: TGroupBox;
    GridCompraRequisicaoDetalhe: TJvDBUltimGrid;
    CDSCompraRequisicaoDetalhe: TClientDataSet;
    DSCompraRequisicaoDetalhe: TDataSource;
    BevelEdits: TBevel;
    EditIdCompraTipoRequisicao: TLabeledCalcEdit;
    EditIdColaborador: TLabeledCalcEdit;
    EditColaborador: TLabeledEdit;
    EditCompraTipoRequisicao: TLabeledEdit;
    EditDataRequisicao: TLabeledDateEdit;
    ActionToolBar1: TActionToolBar;
    ActionManager: TActionManager;
    ActionIncluirItem: TAction;
    ActionExcluirItem: TAction;
    ActionAtualizarTotais: TAction;
    procedure FormCreate(Sender: TObject);
    procedure CDSCompraRequisicaoDetalheAfterEdit(DataSet: TDataSet);
    procedure GridCompraRequisicaoDetalheKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdCompraTipoRequisicaoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdColaboradorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionIncluirItemExecute(Sender: TObject);
    procedure ActionExcluirItemExecute(Sender: TObject);
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
  end;

var
  FCompraRequisicao: TFCompraRequisicao;

implementation

uses CompraRequisicaoController, CompraRequisicaoVO, CompraTipoRequisicaoController,
  CompraTipoRequisicaoVO, CompraRequisicaoDetalheVO, ULookup, 
  ViewPessoaColaboradorVO, ViewPessoaColaboradorController, 
  ProdutoVO, ProdutoController, CompraRequisicaoDetalheController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFCompraRequisicao.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TCompraRequisicaoVO;
  ObjetoController := TCompraRequisicaoController.Create;

  inherited;

  // Configura a Grid dos itens
  ConfiguraCDSFromVO(CDSCompraRequisicaoDetalhe, TCompraRequisicaoDetalheVO);
  ConfiguraGridFromVO(GridCompraRequisicaoDetalhe, TCompraRequisicaoDetalheVO);
end;

procedure TFCompraRequisicao.LimparCampos;
begin
  inherited;
  CDSCompraRequisicaoDetalhe.EmptyDataSet;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFCompraRequisicao.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditDataRequisicao.SetFocus;
  end;
end;

function TFCompraRequisicao.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditDataRequisicao.SetFocus;
  end;
end;

function TFCompraRequisicao.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('CompraRequisicaoController.TCompraRequisicaoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('CompraRequisicaoController.TCompraRequisicaoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFCompraRequisicao.DoSalvar: Boolean;
var
  CompraRequisicaoDetalhe: TCompraRequisicaoDetalheVO;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TCompraRequisicaoVO.Create;

      TCompraRequisicaoVO(ObjetoVO).IdCompraTipoRequisicao := EditIdCompraTipoRequisicao.AsInteger;
      TCompraRequisicaoVO(ObjetoVO).CompraTipoRequisicaoNome := EditCompraTipoRequisicao.Text;
      TCompraRequisicaoVO(ObjetoVO).IdColaborador := EditIdColaborador.AsInteger;
      TCompraRequisicaoVO(ObjetoVO).ColaboradorPessoaNome := EditColaborador.Text;
      TCompraRequisicaoVO(ObjetoVO).DataRequisicao := EditDataRequisicao.Date;

      /// EXERCICIO: Implemente o campo OBSERVACAO

      // Itens da requisição
      TController.PreencherObjectListFromCDS<TCompraRequisicaoDetalheVO>(TCompraRequisicaoVO(ObjetoVO).ListaCompraRequisicaoDetalheVO, CDSCompraRequisicaoDetalhe);

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('CompraRequisicaoController.TCompraRequisicaoController', 'Insere', [TCompraRequisicaoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TCompraRequisicaoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('CompraRequisicaoController.TCompraRequisicaoController', 'Altera', [TCompraRequisicaoVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFCompraRequisicao.GridCompraRequisicaoDetalheKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    ActionIncluirItem.Execute;
  end;
  If Key = VK_RETURN then
    EditDataRequisicao.SetFocus;
end;

procedure TFCompraRequisicao.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TCompraRequisicaoVO(TController.BuscarObjeto('CompraRequisicaoController.TCompraRequisicaoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdCompraTipoRequisicao.AsInteger := TCompraRequisicaoVO(ObjetoVO).IdCompraTipoRequisicao;
    EditCompraTipoRequisicao.Text := TCompraRequisicaoVO(ObjetoVO).CompraTipoRequisicaoVO.Nome;
    EditIdColaborador.AsInteger := TCompraRequisicaoVO(ObjetoVO).IdColaborador;
    EditColaborador.Text := TCompraRequisicaoVO(ObjetoVO).ColaboradorVO.Nome;
    EditDataRequisicao.Date := TCompraRequisicaoVO(ObjetoVO).DataRequisicao;

    // Preenche as grids internas com os dados das Listas que vieram no objeto
    TController.TratarRetorno<TCompraRequisicaoDetalheVO>(TCompraRequisicaoVO(ObjetoVO).ListaCompraRequisicaoDetalheVO, True, True, CDSCompraRequisicaoDetalhe);

    // Limpa as listas para comparar posteriormente se houve inclusões/alterações e subir apenas o necessário para o servidor
    TCompraRequisicaoVO(ObjetoVO).ListaCompraRequisicaoDetalheVO.Clear;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;

procedure TFCompraRequisicao.CDSCompraRequisicaoDetalheAfterEdit(DataSet: TDataSet);
begin
  if CDSCompraRequisicaoDetalhe.FieldByName('ITEM_COTADO').AsString = 'S' then
  begin
    Application.MessageBox('Não é possível alterar esse item. Item já foi cotado.', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
    CDSCompraRequisicaoDetalhe.Cancel;
  end
  else
    CDSCompraRequisicaoDetalhe.FieldByName('PERSISTE').AsString := 'S';
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFCompraRequisicao.EditIdCompraTipoRequisicaoKeyUp(Sender: TObject;  var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdCompraTipoRequisicao.Value <> 0 then
      Filtro := 'ID = ' + EditIdCompraTipoRequisicao.Text
    else
      Filtro := 'ID=0';

    try
      EditIdCompraTipoRequisicao.Clear;
      EditCompraTipoRequisicao.Clear;
      if not PopulaCamposTransientes(Filtro, TCompraTipoRequisicaoVO, TCompraTipoRequisicaoController) then
        PopulaCamposTransientesLookup(TCompraTipoRequisicaoVO, TCompraTipoRequisicaoController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdCompraTipoRequisicao.Text := CDSTransiente.FieldByName('ID').AsString;
        EditCompraTipoRequisicao.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditIdColaborador.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFCompraRequisicao.EditIdColaboradorKeyUp(Sender: TObject;  var Key: Word; Shift: TShiftState);
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
        EditDataRequisicao.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFCompraRequisicao.ActionExcluirItemExecute(Sender: TObject);
begin
  if CDSCompraRequisicaoDetalhe.IsEmpty then
    Application.MessageBox('Não existe registro selecionado.', 'Erro', MB_OK + MB_ICONERROR)
  else
  begin
    if Application.MessageBox('Deseja realmente excluir o registro selecionado?', 'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      if StatusTela = stInserindo then
        CDSCompraRequisicaoDetalhe.Delete
      else if StatusTela = stEditando then
      begin
        if TCompraRequisicaoDetalheController.Exclui(CDSCompraRequisicaoDetalhe.FieldByName('ID').AsInteger) then
          CDSCompraRequisicaoDetalhe.Delete;
      end;
    end;
  end;
end;

procedure TFCompraRequisicao.ActionIncluirItemExecute(Sender: TObject);
begin
  try
    PopulaCamposTransientesLookup(TProdutoVO, TProdutoController);
    if CDSTransiente.RecordCount > 0 then
    begin
      CDSCompraRequisicaoDetalhe.Append;
      CDSCompraRequisicaoDetalhe.FieldByName('ID_PRODUTO').AsInteger := CDSTransiente.FieldByName('ID').AsInteger;
      CDSCompraRequisicaoDetalhe.FieldByName('PRODUTO.NOME').AsString := CDSTransiente.FieldByName('NOME').AsString;
    end;
  finally
    CDSTransiente.Close;
  end;
end;
{$ENDREGION}

end.
