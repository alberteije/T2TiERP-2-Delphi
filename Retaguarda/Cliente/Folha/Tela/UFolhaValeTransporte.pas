{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Vale Transporte para o m�dulo Folha de Pagamento

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

unit UFolhaValeTransporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, FolhaValeTransporteVO,
  FolhaValeTransporteController, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, StrUtils, Controller;

type
  [TFormDescription(TConstantes.MODULO_FOLHA_PAGAMENTO, 'Vale Transporte')]

  TFFolhaValeTransporte = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditIdColaborador: TLabeledCalcEdit;
    EditColaborador: TLabeledEdit;
    EditIdItinerario: TLabeledCalcEdit;
    EditItinerario: TLabeledEdit;
    EditQuantidade: TLabeledCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure EditIdColaboradorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditIdItinerarioKeyUp(Sender: TObject; var Key: Word;
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
  FFolhaValeTransporte: TFFolhaValeTransporte;

implementation

uses ViewPessoaColaboradorVO, ViewPessoaColaboradorController, EmpresaTransporteItinerarioVO,
EmpresaTransporteItinerarioController;

{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFFolhaValeTransporte.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TFolhaValeTransporteVO;
  ObjetoController := TFolhaValeTransporteController.Create;

  inherited;
end;

procedure TFFolhaValeTransporte.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFFolhaValeTransporte.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFFolhaValeTransporte.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditIdColaborador.SetFocus;
  end;
end;

function TFFolhaValeTransporte.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditIdColaborador.SetFocus;
  end;
end;

function TFFolhaValeTransporte.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('FolhaValeTransporteController.TFolhaValeTransporteController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('FolhaValeTransporteController.TFolhaValeTransporteController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFFolhaValeTransporte.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TFolhaValeTransporteVO.Create;

      TFolhaValeTransporteVO(ObjetoVO).IdColaborador := EditIdColaborador.AsInteger;
      TFolhaValeTransporteVO(ObjetoVO).ColaboradorNome := EditColaborador.Text;
      TFolhaValeTransporteVO(ObjetoVO).IdEmpresaTranspItin := EditIdItinerario.AsInteger;
      TFolhaValeTransporteVO(ObjetoVO).EmpresaTransporteItinerarioNome := EditItinerario.Text;
      TFolhaValeTransporteVO(ObjetoVO).Quantidade := EditQuantidade.AsInteger;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('FolhaValeTransporteController.TFolhaValeTransporteController', 'Insere', [TFolhaValeTransporteVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TFolhaValeTransporteVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('FolhaValeTransporteController.TFolhaValeTransporteController', 'Altera', [TFolhaValeTransporteVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFFolhaValeTransporte.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TFolhaValeTransporteVO(TController.BuscarObjeto('FolhaValeTransporteController.TFolhaValeTransporteController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdColaborador.AsInteger := TFolhaValeTransporteVO(ObjetoVO).IdColaborador;
    EditColaborador.Text := TFolhaValeTransporteVO(ObjetoVO).ColaboradorNome;
    EditIdItinerario.AsInteger := TFolhaValeTransporteVO(ObjetoVO).IdEmpresaTranspItin;
    EditItinerario.Text := TFolhaValeTransporteVO(ObjetoVO).EmpresaTransporteItinerarioNome;
    EditQuantidade.AsInteger := TFolhaValeTransporteVO(ObjetoVO).Quantidade;

    // Serializa o objeto para consultar posteriormente se houve altera��es
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFFolhaValeTransporte.EditIdColaboradorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
        EditIdItinerario.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

procedure TFFolhaValeTransporte.EditIdItinerarioKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdItinerario.Value <> 0 then
      Filtro := 'ID = ' + EditIdItinerario.Text
    else
      Filtro := 'ID=0';

    try
      EditIdItinerario.Clear;
      EditItinerario.Clear;
      if not PopulaCamposTransientes(Filtro, TEmpresaTransporteItinerarioVO, TEmpresaTransporteItinerarioController) then
        PopulaCamposTransientesLookup(TEmpresaTransporteItinerarioVO, TEmpresaTransporteItinerarioController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdItinerario.Text := CDSTransiente.FieldByName('ID').AsString;
        EditItinerario.Text := CDSTransiente.FieldByName('NOME').AsString;
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

end.