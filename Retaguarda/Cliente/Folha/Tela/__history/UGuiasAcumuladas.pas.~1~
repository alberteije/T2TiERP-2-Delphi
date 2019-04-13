{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela Cadastro de Guias Acumuladas para a Folha de Pagamento

  The MIT License

  Copyright: Copyright (C) 2010 T2Ti.COM

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
  @version 1.0
  ******************************************************************************* }
unit UGuiasAcumuladas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, GuiasAcumuladasVO,
  GuiasAcumuladasController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, StrUtils;

type
  [TFormDescription(TConstantes.MODULO_FOLHA_PAGAMENTO, 'Guias Acumuladas')]

  TFGuiasAcumuladas = class(TFTelaCadastro)
    BevelEdits: TBevel;
    GroupBox1: TGroupBox;
    ComboBoxGpsTipo: TLabeledComboBox;
    EditGpsValorInss: TLabeledCalcEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    EditGpsCompetencia: TLabeledMaskEdit;
    EditGpsValorOutrasEntidades: TLabeledCalcEdit;
    EditGpsDataPagamento: TLabeledDateEdit;
    EditIrrfCompetencia: TLabeledMaskEdit;
    EditIrrfCodigoRecolhimento: TLabeledCalcEdit;
    EditIrrfValorAcumulado: TLabeledCalcEdit;
    EditIrrfDataPagamento: TLabeledDateEdit;
    EditPisCompetencia: TLabeledMaskEdit;
    EditPisValorAcumulado: TLabeledCalcEdit;
    EditPisDataPagamento: TLabeledDateEdit;
    procedure FormCreate(Sender: TObject);
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
  FGuiasAcumuladas: TFGuiasAcumuladas;

implementation

{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFGuiasAcumuladas.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TGuiasAcumuladasVO;
  ObjetoController := TGuiasAcumuladasController.Create;

  inherited;
end;

procedure TFGuiasAcumuladas.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFGuiasAcumuladas.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFGuiasAcumuladas.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    ComboBoxGpsTipo.SetFocus;
  end;
end;

function TFGuiasAcumuladas.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    ComboBoxGpsTipo.SetFocus;
  end;
end;

function TFGuiasAcumuladas.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      Result := TGuiasAcumuladasController(ObjetoController).Exclui(IdRegistroSelecionado);
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TGuiasAcumuladasController(ObjetoController).Consulta(Filtro, Pagina);
end;

function TFGuiasAcumuladas.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      DecimalSeparator := '.';
      if not Assigned(ObjetoVO) then
        ObjetoVO := TGuiasAcumuladasVO.Create;

      TGuiasAcumuladasVO(ObjetoVO).IdEmpresa := Sessao.IdEmpresa;
      TGuiasAcumuladasVO(ObjetoVO).GpsTipo := IntToStr(ComboBoxGpsTipo.ItemIndex + 1);
      TGuiasAcumuladasVO(ObjetoVO).GpsCompetencia := EditGpsCompetencia.Text;
      TGuiasAcumuladasVO(ObjetoVO).GpsValorInss := EditGpsValorInss.Value;
      TGuiasAcumuladasVO(ObjetoVO).GpsValorOutrasEnt := EditGpsValorOutrasEntidades.Value;
      TGuiasAcumuladasVO(ObjetoVO).GpsDataPagamento := EditGpsDataPagamento.Date;
      TGuiasAcumuladasVO(ObjetoVO).IrrfCompetencia := EditIrrfCompetencia.Text;
      TGuiasAcumuladasVO(ObjetoVO).IrrfCodigoRecolhimento := EditIrrfCodigoRecolhimento.AsInteger;
      TGuiasAcumuladasVO(ObjetoVO).IrrfValorAcumulado := EditIrrfValorAcumulado.Value;
      TGuiasAcumuladasVO(ObjetoVO).IrrfDataPagamento := EditIrrfDataPagamento.Date;
      TGuiasAcumuladasVO(ObjetoVO).PisCompetencia := EditPisCompetencia.Text;
      TGuiasAcumuladasVO(ObjetoVO).PisValorAcumulado := EditPisValorAcumulado.Value;
      TGuiasAcumuladasVO(ObjetoVO).PisDataPagamento := EditPisDataPagamento.Date;

      if StatusTela = stInserindo then
        Result := TGuiasAcumuladasController(ObjetoController).Insere(TGuiasAcumuladasVO(ObjetoVO))
      else if StatusTela = stEditando then
      begin
        if TGuiasAcumuladasVO(ObjetoVO).ToJSONString <> TGuiasAcumuladasVO(ObjetoOldVO).ToJSONString then
        begin
          TGuiasAcumuladasVO(ObjetoVO).Id := IdRegistroSelecionado;
          Result := TGuiasAcumuladasController(ObjetoController).Altera(TGuiasAcumuladasVO(ObjetoVO), TGuiasAcumuladasVO(ObjetoOldVO));
        end
        else
          Application.MessageBox('Nenhum dado foi alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
      end;
      DecimalSeparator := ',';
    except
      Result := False;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFGuiasAcumuladas.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TGuiasAcumuladasVO>(IdRegistroSelecionado);
    if StatusTela = stEditando then
      ObjetoOldVO := ObjetoController.VO<TGuiasAcumuladasVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin

    ComboBoxGpsTipo.ItemIndex := StrToInt(TGuiasAcumuladasVO(ObjetoVO).GpsTipo) - 1;
    EditGpsCompetencia.Text := TGuiasAcumuladasVO(ObjetoVO).GpsCompetencia;
    EditGpsValorInss.Value := TGuiasAcumuladasVO(ObjetoVO).GpsValorInss;
    EditGpsValorOutrasEntidades.Value := TGuiasAcumuladasVO(ObjetoVO).GpsValorOutrasEnt;
    EditGpsDataPagamento.Date := TGuiasAcumuladasVO(ObjetoVO).GpsDataPagamento;
    EditIrrfCompetencia.Text := TGuiasAcumuladasVO(ObjetoVO).IrrfCompetencia;
    EditIrrfCodigoRecolhimento.AsInteger := TGuiasAcumuladasVO(ObjetoVO).IrrfCodigoRecolhimento;
    EditIrrfValorAcumulado.Value := TGuiasAcumuladasVO(ObjetoVO).IrrfValorAcumulado;
    EditIrrfDataPagamento.Date := TGuiasAcumuladasVO(ObjetoVO).IrrfDataPagamento;
    EditPisCompetencia.Text := TGuiasAcumuladasVO(ObjetoVO).PisCompetencia;
    EditPisValorAcumulado.Value := TGuiasAcumuladasVO(ObjetoVO).PisValorAcumulado;
    EditPisDataPagamento.Date := TGuiasAcumuladasVO(ObjetoVO).PisDataPagamento;
  end;
end;
{$ENDREGION}

end.
