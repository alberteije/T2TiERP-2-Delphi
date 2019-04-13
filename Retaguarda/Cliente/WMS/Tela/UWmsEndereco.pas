{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Endereços do WMS

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
unit UWmsEndereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UTelaCadastro, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, LabeledCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, Vcl.ComCtrls, JvToolEdit, Vcl.Mask, JvExMask,
  JvBaseEdits, System.Actions, Vcl.ActnList, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.PlatformDefaultStyleActnCtrls, Data.DB, Datasnap.DBClient,
  System.Generics.Collections, UDataModule, Biblioteca, Controller;

type
  TFWmsEndereco = class(TFTelaCadastro)
    ScrollBox: TScrollBox;
    EditQuantidadeEstante: TLabeledCalcEdit;
    Bevel1: TBevel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    DSEstantes: TDataSource;
    CDSEstantes: TClientDataSet;
    ActionManager: TActionManager;
    ActionAdicionarEstante: TAction;
    ActionRemoverEstante: TAction;
    ActionAdicionarCaixa: TAction;
    ActionRemoverCaixa: TAction;
    CDSCaixas: TClientDataSet;
    DSCaixas: TDataSource;
    EditCodigo: TLabeledEdit;
    EditNome: TLabeledEdit;
    Panel2: TPanel;
    GridEstantes: TJvDBUltimGrid;
    ActionToolBarServicos: TActionToolBar;
    Panel3: TPanel;
    ActionToolBarItens: TActionToolBar;
    GridCaixas: TJvDBUltimGrid;
    procedure FormCreate(Sender: TObject);
    procedure ActionRemoverEstanteExecute(Sender: TObject);
    procedure ControlaPersistencia(pDataSet: TDataSet);
    procedure ActionAdicionarEstanteExecute(Sender: TObject);
    procedure ActionRemoverCaixaExecute(Sender: TObject);
    procedure ActionAdicionarCaixaExecute(Sender: TObject);
  private
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;

    procedure GridParaEdits; override;
    procedure LimparCampos; override;

  public

  end;

var
  FWmsEndereco: TFWmsEndereco;

implementation

{$R *.dfm}

uses
  WmsEstanteVO, WmsCaixaVO, WmsRuaVO, WmsRuaController, WmsCaixaController;

{$REGION 'Infra'}
procedure TFWmsEndereco.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TWmsRuaVO;
  ObjetoController := TWmsRuaController.Create;

  inherited;

  // Configura as Grids de detalhes
  ConfiguraCDSFromVO(CDSEstantes, TWmsEstanteVO);
  ConfiguraGridFromVO(GridEstantes, TWmsEstanteVO);

  ConfiguraCDSFromVO(CDSCaixas, TWmsCaixaVO);
  ConfiguraGridFromVO(GridCaixas, TWmsCaixaVO);
end;

procedure TFWmsEndereco.LimparCampos;
begin
  inherited;
  CDSEstantes.EmptyDataSet;
  CDSCaixas.EmptyDataSet;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFWmsEndereco.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditCodigo.SetFocus;
  end;
end;

function TFWmsEndereco.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditCodigo.SetFocus;
  end;
end;

function TFWmsEndereco.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('WmsRuaController.TWmsRuaController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('WmsRuaController.TWmsRuaController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFWmsEndereco.DoSalvar: Boolean;
var
  WmsEstante: TWmsEstanteVO;
  WmsCaixa: TWmsCaixaVO;
begin
  Result := inherited DoSalvar;

  if Result then
  begin

    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TWmsRuaVO.Create;

      TWmsRuaVO(ObjetoVO).Codigo := EditCodigo.Text;
      TWmsRuaVO(ObjetoVO).Nome := EditNome.Text;
      TWmsRuaVO(ObjetoVO).QuantidadeEstante := EditQuantidadeEstante.AsInteger;

      /// EXERCICIO - TENTE IMPLEMENTAR OS DADOS DA LISTA DE DETALHES DE ACORDO COM O MODELO PROPOSTO NA INFRA

      // Estantes
      CDSEstantes.DisableControls;
      CDSEstantes.First;
      while not CDSEstantes.Eof do
      begin
        if (CDSEstantes.FieldByName('PERSISTE').AsString = 'S') or (CDSEstantes.FieldByName('ID').AsInteger = 0) then
        begin
          WmsEstante := TWmsEstanteVO.Create;
          WmsEstante.Id := CDSEstantes.FieldByName('ID').AsInteger;
          WmsEstante.IdWmsRua := TWmsRuaVO(ObjetoVO).Id;
          WmsEstante.Codigo := CDSEstantes.FieldByName('CODIGO').AsString;
          WmsEstante.QuantidadeCaixa := CDSEstantes.FieldByName('QUANTIDADE_CAIXA').AsInteger;

          TWmsRuaVO(ObjetoVO).ListaWmsEstanteVO.Add(WmsEstante);
        end;
        CDSEstantes.Next;
      end;
      CDSEstantes.First;
      CDSEstantes.EnableControls;


      // Caixas

      /// EXERCICIO
      ///  As caixas são filhas das estantes. Como implementar esse código?

      CDSCaixas.DisableControls;
      CDSCaixas.First;
      while not CDSCaixas.Eof do
      begin
        if (CDSCaixas.FieldByName('PERSISTE').AsString = 'S') or (CDSCaixas.FieldByName('ID').AsInteger = 0) then
        begin
          WmsCaixa := TWmsCaixaVO.Create;
          WmsCaixa.Id := CDSCaixas.FieldByName('ID').AsInteger;
          WmsCaixa.IdWmsEstante := TWmsRuaVO(ObjetoVO).Id;

          TWmsRuaVO(ObjetoVO).ListaWmsEstanteVO[0].ListaWmsCaixaVO.Add(WmsCaixa);
        end;
        CDSCaixas.Next;
      end;
      CDSCaixas.First;
      CDSCaixas.EnableControls;



      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('WmsRuaController.TWmsRuaController', 'Insere', [TWmsRuaVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TWmsRuaVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('WmsRuaController.TWmsRuaController', 'Altera', [TWmsRuaVO(ObjetoVO)], 'POST', 'Boolean');
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

{$REGION 'Controle de Grid e Edits'}
procedure TFWmsEndereco.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TWmsRuaVO(TController.BuscarObjeto('WmsRuaController.TWmsRuaController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditCodigo.Text := TWmsRuaVO(ObjetoVO).Codigo;
    EditNome.Text := TWmsRuaVO(ObjetoVO).Nome;
    EditQuantidadeEstante.AsInteger := TWmsRuaVO(ObjetoVO).QuantidadeEstante;

    TController.TratarRetorno<TWmsEstanteVO>(TWmsRuaVO(ObjetoVO).ListaWmsEstanteVO, True, True, CDSEstantes);

    /// EXERCICIO
    ///  Como carregar os dados das caixas vinculadas às estantes?
    TWmsCaixaController.SetDataSet(CDSCaixas);
    TController.ExecutarMetodo('WmsCaixaController.TWmsCaixaController', 'Consulta', ['ID>0', '0', False], 'GET', 'Lista');

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFWmsEndereco.ActionAdicionarCaixaExecute(Sender: TObject);
begin
  inherited;
  /// EXERCICIO
  ///  Implemente o procedimento

end;

procedure TFWmsEndereco.ActionAdicionarEstanteExecute(Sender: TObject);
begin
  inherited;
  /// EXERCICIO
  ///  Implemente o procedimento
end;
{$ENDREGION}

{$REGION 'Exclusões Internas'}
procedure TFWmsEndereco.ActionRemoverEstanteExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover a Estante?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      CDSEstantes.Delete
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('WmsRuaController.TWmsRuaController', 'ExcluiItem', [CDSEstantes.FieldByName('ID').AsInteger], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        CDSEstantes.Delete;
    end;
  end;
end;

procedure TFWmsEndereco.ActionRemoverCaixaExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja remover a Caixa?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    if StatusTela = stInserindo then
      CDSCaixas.Delete
    else if StatusTela = stEditando then
    begin
      TController.ExecutarMetodo('WmsRuaController.TWmsRuaController', 'ExcluiServico', [CDSCaixas.FieldByName('ID').AsInteger], 'DELETE', 'Boolean');
      if TController.RetornoBoolean then
        CDSCaixas.Delete;
    end;
  end;
end;

procedure TFWmsEndereco.ControlaPersistencia(pDataSet: TDataSet);
begin
  pDataSet.FieldByName('PERSISTE').AsString := 'S';
end;
{$ENDREGION}

/// EXERCICIO
///  Implemente o mestre/detalhe entre os clientdatasets

end.
