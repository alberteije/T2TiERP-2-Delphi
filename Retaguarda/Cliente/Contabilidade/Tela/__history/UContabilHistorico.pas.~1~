{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela Históricos para o módulo Contabilidade

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
unit UContabilHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, ContabilHistoricoVO,
  ContabilHistoricoController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, StrUtils;

type
  [TFormDescription(TConstantes.MODULO_CONTABILIDADE, 'Históricos')]

  TFContabilHistorico = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditDescricao: TLabeledEdit;
    ComboBoxPedeComplemento: TLabeledComboBox;
    MemoHistorico: TLabeledMemo;
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
  FContabilHistorico: TFContabilHistorico;

implementation

{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFContabilHistorico.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContabilHistoricoVO;
  ObjetoController := TContabilHistoricoController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFContabilHistorico.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditDescricao.SetFocus;
  end;
end;

function TFContabilHistorico.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditDescricao.SetFocus;
  end;
end;

function TFContabilHistorico.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      Result := TContabilHistoricoController(ObjetoController).Exclui(IdRegistroSelecionado);
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TContabilHistoricoController(ObjetoController).Consulta(Filtro, Pagina);
end;

function TFContabilHistorico.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TContabilHistoricoVO.Create;

      TContabilHistoricoVO(ObjetoVO).IdEmpresa := Sessao.IdEmpresa;
      TContabilHistoricoVO(ObjetoVO).Descricao := EditDescricao.Text;
      TContabilHistoricoVO(ObjetoVO).Historico := MemoHistorico.Text;
      TContabilHistoricoVO(ObjetoVO).PedeComplemento := Copy(ComboBoxPedeComplemento.Text, 1, 1);

      if StatusTela = stInserindo then
        Result := TContabilHistoricoController(ObjetoController).Insere(TContabilHistoricoVO(ObjetoVO))
      else if StatusTela = stEditando then
      begin
        if TContabilHistoricoVO(ObjetoVO).ToJSONString <> TContabilHistoricoVO(ObjetoOldVO).ToJSONString then
        begin
          TContabilHistoricoVO(ObjetoVO).Id := IdRegistroSelecionado;
          Result := TContabilHistoricoController(ObjetoController).Altera(TContabilHistoricoVO(ObjetoVO), TContabilHistoricoVO(ObjetoOldVO));
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
procedure TFContabilHistorico.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TContabilHistoricoVO>(IdRegistroSelecionado);
    if StatusTela = stEditando then
      ObjetoOldVO := ObjetoController.VO<TContabilHistoricoVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin
    EditDescricao.Text := TContabilHistoricoVO(ObjetoVO).Descricao;
    MemoHistorico.Text := TContabilHistoricoVO(ObjetoVO).Historico;
    ComboBoxPedeComplemento.ItemIndex := AnsiIndexStr(TContabilHistoricoVO(ObjetoVO).PedeComplemento, ['S', 'N']);
  end;
end;
{$ENDREGION}

end.
