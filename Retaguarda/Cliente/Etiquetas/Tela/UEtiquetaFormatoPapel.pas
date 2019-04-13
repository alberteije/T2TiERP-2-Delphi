{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Formatos de Papel

The MIT License

Copyright: Copyright (C) 2017 T2Ti.COM

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
@version 2.0
******************************************************************************* }
unit UEtiquetaFormatoPapel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, EtiquetaFormatoPapelVO,
  EtiquetaFormatoPapelController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, ActnList, ToolWin, ActnMan, ActnCtrls,
  PlatformDefaultStyleActnCtrls, Biblioteca, StrUtils, Controller;

type
  TFEtiquetaFormatoPapel = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditAltura: TLabeledCalcEdit;
    EditLargura: TLabeledCalcEdit;
    EditNome: TLabeledEdit;
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
  FEtiquetaFormatoPapel: TFEtiquetaFormatoPapel;

implementation

uses UDataModule;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFEtiquetaFormatoPapel.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TEtiquetaFormatoPapelVO;
  ObjetoController := TEtiquetaFormatoPapelController.Create;

  inherited;
end;

procedure TFEtiquetaFormatoPapel.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFEtiquetaFormatoPapel.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFEtiquetaFormatoPapel.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditNome.SetFocus;
  end;
end;

function TFEtiquetaFormatoPapel.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditNome.SetFocus;
  end;
end;

function TFEtiquetaFormatoPapel.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('EtiquetaFormatoPapelController.TEtiquetaFormatoPapelController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('EtiquetaFormatoPapelController.TEtiquetaFormatoPapelController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFEtiquetaFormatoPapel.DoSalvar: Boolean;
var
  i: Integer;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TEtiquetaFormatoPapelVO.Create;

      TEtiquetaFormatoPapelVO(ObjetoVO).Nome := EditNome.Text;
      TEtiquetaFormatoPapelVO(ObjetoVO).Altura := EditAltura.AsInteger;
      TEtiquetaFormatoPapelVO(ObjetoVO).Largura := EditLargura.AsInteger;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('EtiquetaFormatoPapelController.TEtiquetaFormatoPapelController', 'Insere', [TEtiquetaFormatoPapelVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TEtiquetaFormatoPapelVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('EtiquetaFormatoPapelController.TEtiquetaFormatoPapelController', 'Altera', [TEtiquetaFormatoPapelVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFEtiquetaFormatoPapel.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TEtiquetaFormatoPapelVO(TController.BuscarObjeto('EtiquetaFormatoPapelController.TEtiquetaFormatoPapelController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditNome.Text := TEtiquetaFormatoPapelVO(ObjetoVO).Nome;
    EditAltura.AsInteger := TEtiquetaFormatoPapelVO(ObjetoVO).Altura;
    EditLargura.AsInteger := TEtiquetaFormatoPapelVO(ObjetoVO).Largura;
    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.
