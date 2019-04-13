{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela de Fechamentos para o módulo Contabilidade

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
unit UContabilFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, ContabilFechamentoVO,
  ContabilFechamentoController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, StrUtils;

type
  [TFormDescription(TConstantes.MODULO_CONTABILIDADE, 'Contábil Fechamento')]

  TFContabilFechamento = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditDataInicio: TLabeledDateEdit;
    EditDataFim: TLabeledDateEdit;
    ComboBoxCriterioLancamento: TLabeledComboBox;
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
  FContabilFechamento: TFContabilFechamento;

implementation

{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFContabilFechamento.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContabilFechamentoVO;
  ObjetoController := TContabilFechamentoController.Create;

  inherited;
end;

procedure TFContabilFechamento.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFContabilFechamento.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFContabilFechamento.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditDataInicio.SetFocus;
  end;
end;

function TFContabilFechamento.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditDataInicio.SetFocus;
  end;
end;

function TFContabilFechamento.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      Result := TContabilFechamentoController(ObjetoController).Exclui(IdRegistroSelecionado);
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TContabilFechamentoController(ObjetoController).Consulta(Filtro, Pagina);
end;

function TFContabilFechamento.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TContabilFechamentoVO.Create;

      TContabilFechamentoVO(ObjetoVO).IdEmpresa := Sessao.IdEmpresa;
      TContabilFechamentoVO(ObjetoVO).DataInicio := EditDataInicio.Date;
      TContabilFechamentoVO(ObjetoVO).DataFim := EditDataFim.Date;
      TContabilFechamentoVO(ObjetoVO).CriterioLancamento := Copy(ComboBoxCriterioLancamento.Text, 1, 1);

      if StatusTela = stInserindo then
        Result := TContabilFechamentoController(ObjetoController).Insere(TContabilFechamentoVO(ObjetoVO))
      else if StatusTela = stEditando then
      begin
        if TContabilFechamentoVO(ObjetoVO).ToJSONString <> TContabilFechamentoVO(ObjetoOldVO).ToJSONString then
        begin
          TContabilFechamentoVO(ObjetoVO).Id := IdRegistroSelecionado;
          Result := TContabilFechamentoController(ObjetoController).Altera(TContabilFechamentoVO(ObjetoVO), TContabilFechamentoVO(ObjetoOldVO));
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
procedure TFContabilFechamento.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TContabilFechamentoVO>(IdRegistroSelecionado);
    if StatusTela = stEditando then
      ObjetoOldVO := ObjetoController.VO<TContabilFechamentoVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin
    EditDataInicio.Date := TContabilFechamentoVO(ObjetoVO).DataInicio;
    EditDataFim.Date := TContabilFechamentoVO(ObjetoVO).DataFim;
    ComboBoxCriterioLancamento.ItemIndex := AnsiIndexStr(TContabilFechamentoVO(ObjetoVO).CriterioLancamento, ['L', 'A', 'N']);
  end;
end;
{$ENDREGION}

end.
