{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela de Cadastro dos Tipos de Nota Fiscal

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
  t2ti.com@gmail.com

  @author Albert Eije
  @version 1.0
  ******************************************************************************* }
unit UTipoNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, LabeledCtrls, Atributos, Constantes,
  Mask, JvExMask, JvToolEdit, JvBaseEdits;

type
  [TFormDescription(TConstantes.MODULO_VENDAS, 'Tipo de Nota Fiscal')]

  TFTipoNotaFiscal = class(TFTelaCadastro)
    EditModelo: TLabeledEdit;
    EditNome: TLabeledEdit;
    MemoDescricao: TLabeledMemo;
    BevelEdits: TBevel;
    EditSerie: TLabeledEdit;
    MemoTemplate: TLabeledMemo;
    EditNumeroItens: TLabeledCalcEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    { Public declarations }
    procedure GridParaEdits; override;

    // Controles CRUD
    function DoInserir: Boolean; override;
    function DoEditar: Boolean; override;
    function DoExcluir: Boolean; override;
    function DoSalvar: Boolean; override;
  end;

var
  FTipoNotaFiscal: TFTipoNotaFiscal;

implementation

uses TipoNotaFiscalController, TipoNotaFiscalVo, NotificationService;
{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFTipoNotaFiscal.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TTipoNotaFiscalVO;
  ObjetoController := TTipoNotaFiscalController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFTipoNotaFiscal.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditModelo.SetFocus;
  end;
end;

function TFTipoNotaFiscal.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditModelo.SetFocus;
  end;
end;

function TFTipoNotaFiscal.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      Result := TTipoNotaFiscalController(ObjetoController).Exclui(IdRegistroSelecionado);
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TTipoNotaFiscalController(ObjetoController).Consulta(Filtro, Pagina);
end;

function TFTipoNotaFiscal.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TTipoNotaFiscalVO.Create;

      TTipoNotaFiscalVO(ObjetoVO).IdEmpresa := Sessao.IdEmpresa;
      TTipoNotaFiscalVO(ObjetoVO).Modelo := EditModelo.Text;
      TTipoNotaFiscalVO(ObjetoVO).Serie := EditSerie.Text;
      TTipoNotaFiscalVO(ObjetoVO).NumeroItens := EditNumeroItens.AsInteger;
      TTipoNotaFiscalVO(ObjetoVO).Nome := EditNome.Text;
      TTipoNotaFiscalVO(ObjetoVO).Descricao := MemoDescricao.Text;
      TTipoNotaFiscalVO(ObjetoVO).Template := MemoTemplate.Text;

      if StatusTela = stInserindo then
        Result := TTipoNotaFiscalController(ObjetoController).Insere(TTipoNotaFiscalVO(ObjetoVO))
      else if StatusTela = stEditando then
      begin
        if TTipoNotaFiscalVO(ObjetoVO).ToJSONString <> TTipoNotaFiscalVO(ObjetoOldVO).ToJSONString then
        begin
          TTipoNotaFiscalVO(ObjetoVO).Id := IdRegistroSelecionado;
          Result := TTipoNotaFiscalController(ObjetoController).Altera(TTipoNotaFiscalVO(ObjetoVO), TTipoNotaFiscalVO(ObjetoOldVO));
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
procedure TFTipoNotaFiscal.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TTipoNotaFiscalVO>(IdRegistroSelecionado);
    if StatusTela = stEditando then
      ObjetoOldVO := ObjetoController.VO<TTipoNotaFiscalVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin
    EditModelo.Text := TTipoNotaFiscalVO(ObjetoVO).Modelo;
    EditSerie.Text := TTipoNotaFiscalVO(ObjetoVO).Serie;
    EditNumeroItens.AsInteger := TTipoNotaFiscalVO(ObjetoVO).NumeroItens;
    EditNome.Text := TTipoNotaFiscalVO(ObjetoVO).Nome;
    MemoDescricao.Text := TTipoNotaFiscalVO(ObjetoVO).Descricao;
    MemoTemplate.Text := TTipoNotaFiscalVO(ObjetoVO).Template;
  end;
end;
{$ENDREGION}

end.
