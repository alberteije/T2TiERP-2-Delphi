{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela de Cadastro das Seguradoras - Módulo Patrimônio

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
unit USeguradora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, LabeledCtrls, Atributos, Constantes,
  Mask, JvExMask, JvToolEdit, JvBaseEdits;

type
  [TFormDescription(TConstantes.MODULO_PATRIMONIO, 'Cadastro Seguradora')]

  TFSeguradora = class(TFTelaCadastro)
    EditNome: TLabeledEdit;
    BevelEdits: TBevel;
    EditTelefone: TLabeledMaskEdit;
    EditContato: TLabeledEdit;
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
  FSeguradora: TFSeguradora;

implementation

uses SeguradoraController, SeguradoraVo, NotificationService;
{$R *.dfm}

{$REGION 'infra'}
procedure TFSeguradora.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TSeguradoraVO;
  ObjetoController := TSeguradoraController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFSeguradora.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditNome.SetFocus;
  end;
end;

function TFSeguradora.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditNome.SetFocus;
  end;
end;

function TFSeguradora.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      Result := TSeguradoraController(ObjetoController).Exclui(IdRegistroSelecionado);
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TSeguradoraController(ObjetoController).Consulta(Filtro, Pagina);
end;

function TFSeguradora.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TSeguradoraVO.Create;

      TSeguradoraVO(ObjetoVO).IdEmpresa := Sessao.IdEmpresa;
      TSeguradoraVO(ObjetoVO).Nome := EditNome.Text;
      TSeguradoraVO(ObjetoVO).Contato := EditContato.Text;
      TSeguradoraVO(ObjetoVO).Telefone := EditTelefone.Text;

      if StatusTela = stInserindo then
        Result := TSeguradoraController(ObjetoController).Insere(TSeguradoraVO(ObjetoVO))
      else if StatusTela = stEditando then
        if TSeguradoraVO(ObjetoVO).ToJSONString <> TSeguradoraVO(ObjetoOldVO).ToJSONString then
        begin
          TSeguradoraVO(ObjetoVO).Id := IdRegistroSelecionado;
          Result := TSeguradoraController(ObjetoController).Altera(TSeguradoraVO(ObjetoVO), TSeguradoraVO(ObjetoOldVO));
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
procedure TFSeguradora.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TSeguradoraVO>(IdRegistroSelecionado);
    if StatusTela = stEditando then
      ObjetoOldVO := ObjetoController.VO<TSeguradoraVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin
    EditNome.Text := TSeguradoraVO(ObjetoVO).Nome;
    EditContato.Text := TSeguradoraVO(ObjetoVO).Contato;
    EditTelefone.Text := TSeguradoraVO(ObjetoVO).Telefone;
  end;
end;
{$ENDREGION}

end.
