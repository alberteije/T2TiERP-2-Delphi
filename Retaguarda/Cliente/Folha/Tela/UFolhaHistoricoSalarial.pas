{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Histórico Salarial para o módulo Folha de Pagamento

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

unit UFolhaHistoricoSalarial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, FolhaHistoricoSalarialVO, 
  FolhaHistoricoSalarialController, Atributos, Constantes, LabeledCtrls, Mask, 
  JvExMask, JvToolEdit, JvBaseEdits, StrUtils, Biblioteca, Controller;

type
  [TFormDescription(TConstantes.MODULO_FOLHA_PAGAMENTO, 'Histórico Salarial')]

  TFFolhaHistoricoSalarial = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditIdColaborador: TLabeledCalcEdit;
    EditColaborador: TLabeledEdit;
    EditCompetencia: TLabeledMaskEdit;
    EditSalarioAtual: TLabeledCalcEdit;
    EditPercentualAumento: TLabeledCalcEdit;
    EditSalarioNovo: TLabeledCalcEdit;
    EditValidoAPartir: TLabeledMaskEdit;
    EditMotivo: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure EditPercentualAumentoExit(Sender: TObject);
    procedure EditIdColaboradorKeyUp(Sender: TObject; var Key: Word;
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
  FFolhaHistoricoSalarial: TFFolhaHistoricoSalarial;

implementation

uses ViewPessoaColaboradorVO, ViewPessoaColaboradorController;

{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFFolhaHistoricoSalarial.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TFolhaHistoricoSalarialVO;
  ObjetoController := TFolhaHistoricoSalarialController.Create;

  inherited;
end;

procedure TFFolhaHistoricoSalarial.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFFolhaHistoricoSalarial.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFFolhaHistoricoSalarial.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditIdColaborador.SetFocus;
  end;
end;

function TFFolhaHistoricoSalarial.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditIdColaborador.SetFocus;
  end;
end;

function TFFolhaHistoricoSalarial.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('FolhaHistoricoSalarialController.TFolhaHistoricoSalarialController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('FolhaHistoricoSalarialController.TFolhaHistoricoSalarialController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFFolhaHistoricoSalarial.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TFolhaHistoricoSalarialVO.Create;

      TFolhaHistoricoSalarialVO(ObjetoVO).IdColaborador := EditIdColaborador.AsInteger;
      TFolhaHistoricoSalarialVO(ObjetoVO).ColaboradorNome := EditColaborador.Text;
      TFolhaHistoricoSalarialVO(ObjetoVO).Competencia := EditCompetencia.Text;
      TFolhaHistoricoSalarialVO(ObjetoVO).SalarioAtual := EditSalarioAtual.Value;
      TFolhaHistoricoSalarialVO(ObjetoVO).PercentualAumento := EditPercentualAumento.Value;
      TFolhaHistoricoSalarialVO(ObjetoVO).SalarioNovo := EditSalarioNovo.Value;
      TFolhaHistoricoSalarialVO(ObjetoVO).ValidoAPartir := EditValidoAPartir.Text;
      TFolhaHistoricoSalarialVO(ObjetoVO).Motivo := EditMotivo.Text;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('FolhaHistoricoSalarialController.TFolhaHistoricoSalarialController', 'Insere', [TFolhaHistoricoSalarialVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TFolhaHistoricoSalarialVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('FolhaHistoricoSalarialController.TFolhaHistoricoSalarialController', 'Altera', [TFolhaHistoricoSalarialVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFFolhaHistoricoSalarial.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TFolhaHistoricoSalarialVO(TController.BuscarObjeto('FolhaHistoricoSalarialController.TFolhaHistoricoSalarialController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdColaborador.AsInteger := TFolhaHistoricoSalarialVO(ObjetoVO).IdColaborador;
    EditColaborador.Text := TFolhaHistoricoSalarialVO(ObjetoVO).ColaboradorNome;
    EditCompetencia.Text := TFolhaHistoricoSalarialVO(ObjetoVO).Competencia;
    EditSalarioAtual.Value := TFolhaHistoricoSalarialVO(ObjetoVO).SalarioAtual;
    EditPercentualAumento.Value := TFolhaHistoricoSalarialVO(ObjetoVO).PercentualAumento;
    EditSalarioNovo.Value := TFolhaHistoricoSalarialVO(ObjetoVO).SalarioNovo;
    EditValidoAPartir.Text := TFolhaHistoricoSalarialVO(ObjetoVO).ValidoAPartir;
    EditMotivo.Text := TFolhaHistoricoSalarialVO(ObjetoVO).Motivo;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFFolhaHistoricoSalarial.EditIdColaboradorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
        EditMotivo.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;

{$ENDREGION}

{$REGION 'Actions'}
procedure TFFolhaHistoricoSalarial.EditPercentualAumentoExit(Sender: TObject);
begin
  EditSalarioNovo.Value := ArredondaTruncaValor('A', EditSalarioAtual.Value * (1 + (EditPercentualAumento.Value / 100)), 2);
end;
{$ENDREGION}

end.
