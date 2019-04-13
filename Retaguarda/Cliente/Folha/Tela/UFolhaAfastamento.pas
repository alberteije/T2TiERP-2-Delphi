{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Afastamentos para o módulo Folha de Pagamento

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

unit UFolhaAfastamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, FolhaAfastamentoVO, FolhaAfastamentoController,
  Atributos, Constantes, LabeledCtrls, Mask, JvExMask, JvToolEdit, JvBaseEdits,
  StrUtils, Controller;

type
  [TFormDescription(TConstantes.MODULO_FOLHA_PAGAMENTO, 'Afastamentos')]

  TFFolhaAfastamento = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditIdColaborador: TLabeledCalcEdit;
    EditColaborador: TLabeledEdit;
    EditDataInicio: TLabeledDateEdit;
    EditIdTipoAfastamento: TLabeledCalcEdit;
    EditTipoAfastamento: TLabeledEdit;
    EditDataFim: TLabeledDateEdit;
    EditDiasAfastado: TLabeledCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure EditIdColaboradorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditIdTipoAfastamentoKeyUp(Sender: TObject; var Key: Word;
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
  FFolhaAfastamento: TFFolhaAfastamento;

implementation

uses ViewPessoaColaboradorVO, ViewPessoaColaboradorController, FolhaTipoAfastamentoVO, FolhaTipoAfastamentoController;

{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFFolhaAfastamento.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TFolhaAfastamentoVO;
  ObjetoController := TFolhaAfastamentoController.Create;

  inherited;
end;

procedure TFFolhaAfastamento.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFFolhaAfastamento.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFFolhaAfastamento.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditIdColaborador.SetFocus;
  end;
end;

function TFFolhaAfastamento.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditIdColaborador.SetFocus;
  end;
end;

function TFFolhaAfastamento.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('FolhaAfastamentoController.TFolhaAfastamentoController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('FolhaAfastamentoController.TFolhaAfastamentoController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFFolhaAfastamento.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TFolhaAfastamentoVO.Create;

      TFolhaAfastamentoVO(ObjetoVO).IdColaborador := EditIdColaborador.AsInteger;
      TFolhaAfastamentoVO(ObjetoVO).ColaboradorNome := EditColaborador.Text;
      TFolhaAfastamentoVO(ObjetoVO).IdFolhaTipoAfastamento := EditIdTipoAfastamento.AsInteger;
      TFolhaAfastamentoVO(ObjetoVO).TipoAfastamentoNome := EditTipoAfastamento.Text;
      TFolhaAfastamentoVO(ObjetoVO).DataInicio := EditDataInicio.Date;
      TFolhaAfastamentoVO(ObjetoVO).DataFim := EditDataFim.Date;
      TFolhaAfastamentoVO(ObjetoVO).DiasAfastado := EditDiasAfastado.AsInteger;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('FolhaAfastamentoController.TFolhaAfastamentoController', 'Insere', [TFolhaAfastamentoVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TFolhaAfastamentoVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('FolhaAfastamentoController.TFolhaAfastamentoController', 'Altera', [TFolhaAfastamentoVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFFolhaAfastamento.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TFolhaAfastamentoVO(TController.BuscarObjeto('FolhaAfastamentoController.TFolhaAfastamentoController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdColaborador.AsInteger := TFolhaAfastamentoVO(ObjetoVO).IdColaborador;
    EditColaborador.Text := TFolhaAfastamentoVO(ObjetoVO).ColaboradorNome;
    EditIdTipoAfastamento.AsInteger := TFolhaAfastamentoVO(ObjetoVO).IdFolhaTipoAfastamento;
    EditTipoAfastamento.Text := TFolhaAfastamentoVO(ObjetoVO).TipoAfastamentoNome;
    EditDataInicio.Date := TFolhaAfastamentoVO(ObjetoVO).DataInicio;
    EditDataFim.Date := TFolhaAfastamentoVO(ObjetoVO).DataFim;
    EditDiasAfastado.AsInteger := TFolhaAfastamentoVO(ObjetoVO).DiasAfastado;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFFolhaAfastamento.EditIdColaboradorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
        EditIdTipoAfastamento.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFFolhaAfastamento.EditIdTipoAfastamentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdTipoAfastamento.Value <> 0 then
      Filtro := 'ID = ' + EditIdTipoAfastamento.Text
    else
      Filtro := 'ID=0';

    try
      EditIdTipoAfastamento.Clear;
      EditTipoAfastamento.Clear;
      if not PopulaCamposTransientes(Filtro, TFolhaTipoAfastamentoVO, TFolhaTipoAfastamentoController) then
        PopulaCamposTransientesLookup(TFolhaTipoAfastamentoVO, TFolhaTipoAfastamentoController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdTipoAfastamento.Text := CDSTransiente.FieldByName('ID').AsString;
        EditTipoAfastamento.Text := CDSTransiente.FieldByName('NOME').AsString;
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

{$ENDREGION}

end.
