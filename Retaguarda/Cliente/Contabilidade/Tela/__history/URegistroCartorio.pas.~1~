{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela Registro Cartório para o módulo Escrita Fiscal

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
unit URegistroCartorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, RegistroCartorioVO,
  RegistroCartorioController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, StrUtils;

type
  [TFormDescription(TConstantes.MODULO_ESCRITA_FISCAL, 'Registro Cartório')]

  TFRegistroCartorio = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditNomeCartorio: TLabeledEdit;
    EditDataRegistro: TLabeledDateEdit;
    EditNumero: TLabeledCalcEdit;
    EditFolha: TLabeledCalcEdit;
    EditLivro: TLabeledCalcEdit;
    EditNire: TLabeledEdit;
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
  FRegistroCartorio: TFRegistroCartorio;

implementation

{$R *.dfm}

{$REGION 'Controles Infra'}
procedure TFRegistroCartorio.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TRegistroCartorioVO;
  ObjetoController := TRegistroCartorioController.Create;

  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFRegistroCartorio.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditNomeCartorio.SetFocus;
  end;
end;

function TFRegistroCartorio.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditNomeCartorio.SetFocus;
  end;
end;

function TFRegistroCartorio.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      Result := TRegistroCartorioController(ObjetoController).Exclui(IdRegistroSelecionado);
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;

  if Result then
    TRegistroCartorioController(ObjetoController).Consulta(Filtro, Pagina);
end;

function TFRegistroCartorio.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TRegistroCartorioVO.Create;

      TRegistroCartorioVO(ObjetoVO).IdEmpresa := Sessao.IdEmpresa;
      TRegistroCartorioVO(ObjetoVO).NomeCartorio := EditNomeCartorio.Text;
      TRegistroCartorioVO(ObjetoVO).DataRegistro := EditDataRegistro.Date;
      TRegistroCartorioVO(ObjetoVO).Numero := EditNumero.AsInteger;
      TRegistroCartorioVO(ObjetoVO).Folha := EditFolha.AsInteger;
      TRegistroCartorioVO(ObjetoVO).Livro := EditLivro.AsInteger;
      TRegistroCartorioVO(ObjetoVO).Nire := EditNire.Text;

      if StatusTela = stInserindo then
        Result := TRegistroCartorioController(ObjetoController).Insere(TRegistroCartorioVO(ObjetoVO))
      else if StatusTela = stEditando then
        if TRegistroCartorioVO(ObjetoVO).ToJSONString <> TRegistroCartorioVO(ObjetoOldVO).ToJSONString then
        begin
          TRegistroCartorioVO(ObjetoVO).Id := IdRegistroSelecionado;
          Result := TRegistroCartorioController(ObjetoController).Altera(TRegistroCartorioVO(ObjetoVO), TRegistroCartorioVO(ObjetoOldVO));
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
procedure TFRegistroCartorio.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TRegistroCartorioVO>(IdRegistroSelecionado);
    if StatusTela = stEditando then
      ObjetoOldVO := ObjetoController.VO<TRegistroCartorioVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin
    EditNomeCartorio.Text := TRegistroCartorioVO(ObjetoVO).NomeCartorio;
    EditDataRegistro.Date := TRegistroCartorioVO(ObjetoVO).DataRegistro;
    EditNumero.AsInteger := TRegistroCartorioVO(ObjetoVO).Numero;
    EditFolha.AsInteger := TRegistroCartorioVO(ObjetoVO).Folha;
    EditLivro.AsInteger := TRegistroCartorioVO(ObjetoVO).Livro;
    EditNire.Text := TRegistroCartorioVO(ObjetoVO).Nire;
  end;
end;
{$ENDREGION}

end.
