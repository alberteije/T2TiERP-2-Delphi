{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela de Cadastro dos Tipos de Serviço - Módulo Gestão de Contratos

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

  @author Albert Eije (alberteije@gmail.com)
  @version 1.0
  ******************************************************************************* }
unit UContratoTipoServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, LabeledCtrls, Atributos, Constantes,
  Mask, JvExMask, JvToolEdit, JvBaseEdits;

type
  [TFormDescription(TConstantes.MODULO_CONTRATOS, 'Tipo de Serviço')]

  TFContratoTipoServico = class(TFTelaCadastro)
    EditNome: TLabeledEdit;
    MemoDescricao: TLabeledMemo;
    BevelEdits: TBevel;
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
  FContratoTipoServico: TFContratoTipoServico;

implementation

uses ContratoTipoServicoController, ContratoTipoServicoVo, NotificationService;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFContratoTipoServico.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContratoTipoServicoVO;
  ObjetoController := TContratoTipoServicoController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFContratoTipoServico.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditNome.SetFocus;
  end;
end;

function TFContratoTipoServico.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditNome.SetFocus;
  end;
end;

function TFContratoTipoServico.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      Result := TContratoTipoServicoController(ObjetoController).Exclui(IdRegistroSelecionado);
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TContratoTipoServicoController(ObjetoController).Consulta(Filtro, Pagina);
end;

function TFContratoTipoServico.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      ObjetoVO := TContratoTipoServicoVO.Create;

      TContratoTipoServicoVO(ObjetoVO).IdEmpresa := Sessao.IdEmpresa;
      TContratoTipoServicoVO(ObjetoVO).Nome := EditNome.Text;
      TContratoTipoServicoVO(ObjetoVO).Descricao := MemoDescricao.Text;

      if StatusTela = stInserindo then
        Result := TContratoTipoServicoController(ObjetoController).Insere(TContratoTipoServicoVO(ObjetoVO))
      else if StatusTela = stEditando then
        if TContratoTipoServicoVO(ObjetoVO).ToJSONString <> TContratoTipoServicoVO(ObjetoOldVO).ToJSONString then
        begin
          TContratoTipoServicoVO(ObjetoVO).Id := IdRegistroSelecionado;
          Result := TContratoTipoServicoController(ObjetoController).Altera(TContratoTipoServicoVO(ObjetoVO), TContratoTipoServicoVO(ObjetoOldVO));
        end
        else
          Application.MessageBox('Nenhum dado foi alterado.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    except
      Result := False;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFContratoTipoServico.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TContratoTipoServicoVO>(IdRegistroSelecionado);
    if StatusTela = stEditando then
      ObjetoOldVO := ObjetoController.VO<TContratoTipoServicoVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin
    EditNome.Text := TContratoTipoServicoVO(ObjetoVO).Nome;
    MemoDescricao.Text := TContratoTipoServicoVO(ObjetoVO).Descricao;
  end;
end;
{$ENDREGION}

end.
