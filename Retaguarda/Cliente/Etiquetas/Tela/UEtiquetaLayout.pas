{*******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Layout

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

@author T2Ti
@version 2.0
*******************************************************************************}
unit UEtiquetaLayout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, EtiquetaLayoutVO,
  EtiquetaLayoutController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, Controller, Biblioteca;

type
  TFEtiquetaLayout = class(TFTelaCadastro)
    EditFormatoPapel: TLabeledEdit;
    EditCodigoFabricante: TLabeledEdit;
    EditIdFormatoPapel: TLabeledCalcEdit;
    EditQuantidade: TLabeledCalcEdit;
    EditQuantidadeHorizontal: TLabeledCalcEdit;
    EditMargemSuperior: TLabeledCalcEdit;
    EditQuantidadeVertical: TLabeledCalcEdit;
    EditMargemInferior: TLabeledCalcEdit;
    EditMargemEsquerda: TLabeledCalcEdit;
    EditMargemDireita: TLabeledCalcEdit;
    EditEspacamentoHorizontal: TLabeledCalcEdit;
    EditEspacamentoVertical: TLabeledCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure EditIdFormatoPapelKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  FEtiquetaLayout: TFEtiquetaLayout;

implementation

uses ULookup, EtiquetaFormatoPapelController, EtiquetaFormatoPapelVO;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFEtiquetaLayout.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TEtiquetaLayoutVO;
  ObjetoController := TEtiquetaLayoutController.Create;
  inherited;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFEtiquetaLayout.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditIdFormatoPapel.SetFocus;
  end;
end;

function TFEtiquetaLayout.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditIdFormatoPapel.SetFocus;
  end;
end;

function TFEtiquetaLayout.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('EtiquetaLayoutController.TEtiquetaLayoutController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('EtiquetaLayoutController.TEtiquetaLayoutController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFEtiquetaLayout.DoSalvar: Boolean;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TEtiquetaLayoutVO.Create;

      TEtiquetaLayoutVO(ObjetoVO).IdFormatoPapel := EditIdFormatoPapel.AsInteger;
      TEtiquetaLayoutVO(ObjetoVO).CodigoFabricante := EditCodigoFabricante.Text;
      TEtiquetaLayoutVO(ObjetoVO).Quantidade := EditQuantidade.AsInteger;
      TEtiquetaLayoutVO(ObjetoVO).QuantidadeHorizontal := EditQuantidadeHorizontal.AsInteger;
      TEtiquetaLayoutVO(ObjetoVO).QuantidadeVertical := EditQuantidadeVertical.AsInteger;
      TEtiquetaLayoutVO(ObjetoVO).MargemSuperior := EditMargemSuperior.AsInteger;
      TEtiquetaLayoutVO(ObjetoVO).MargemInferior := EditMargemInferior.AsInteger;
      TEtiquetaLayoutVO(ObjetoVO).MargemEsquerda := EditMargemEsquerda.AsInteger;
      TEtiquetaLayoutVO(ObjetoVO).MargemDireita := EditMargemDireita.AsInteger;
      TEtiquetaLayoutVO(ObjetoVO).EspacamentoHorizontal := EditEspacamentoHorizontal.AsInteger;
      TEtiquetaLayoutVO(ObjetoVO).EspacamentoVertical := EditEspacamentoVertical.AsInteger;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('EtiquetaLayoutController.TEtiquetaLayoutController', 'Insere', [TEtiquetaLayoutVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TEtiquetaLayoutVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('EtiquetaLayoutController.TEtiquetaLayoutController', 'Altera', [TEtiquetaLayoutVO(ObjetoVO)], 'POST', 'Boolean');
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

{$REGION 'Controles de Grid'}
procedure TFEtiquetaLayout.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TEtiquetaLayoutVO(TController.BuscarObjeto('EtiquetaLayoutController.TEtiquetaLayoutController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdFormatoPapel.AsInteger := TEtiquetaLayoutVO(ObjetoVO).IdFormatoPapel;
    EditCodigoFabricante.Text := TEtiquetaLayoutVO(ObjetoVO).CodigoFabricante;
    EditQuantidade.AsInteger := TEtiquetaLayoutVO(ObjetoVO).Quantidade;
    EditQuantidadeHorizontal.AsInteger := TEtiquetaLayoutVO(ObjetoVO).QuantidadeHorizontal;
    EditQuantidadeVertical.AsInteger := TEtiquetaLayoutVO(ObjetoVO).QuantidadeVertical;
    EditMargemSuperior.AsInteger := TEtiquetaLayoutVO(ObjetoVO).MargemSuperior;
    EditMargemInferior.AsInteger := TEtiquetaLayoutVO(ObjetoVO).MargemInferior;
    EditMargemEsquerda.AsInteger := TEtiquetaLayoutVO(ObjetoVO).MargemEsquerda;
    EditMargemDireita.AsInteger := TEtiquetaLayoutVO(ObjetoVO).MargemDireita;
    EditEspacamentoHorizontal.AsInteger := TEtiquetaLayoutVO(ObjetoVO).EspacamentoHorizontal;
    EditEspacamentoVertical.AsInteger := TEtiquetaLayoutVO(ObjetoVO).EspacamentoVertical;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFEtiquetaLayout.EditIdFormatoPapelKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Filtro: String;
begin
  if Key = VK_F1 then
  begin
    if EditIdFormatoPapel.Value <> 0 then
      Filtro := 'ID = ' + EditIdFormatoPapel.Text
    else
      Filtro := 'ID=0';

    try
      EditIdFormatoPapel.Clear;
      EditFormatoPapel.Clear;
      if not PopulaCamposTransientes(Filtro, TEtiquetaFormatoPapelVO, TEtiquetaFormatoPapelController) then
        PopulaCamposTransientesLookup(TEtiquetaFormatoPapelVO, TEtiquetaFormatoPapelController);
      if CDSTransiente.RecordCount > 0 then
      begin
        EditIdFormatoPapel.Text := CDSTransiente.FieldByName('ID').AsString;
        EditFormatoPapel.Text := CDSTransiente.FieldByName('NOME').AsString;
      end
      else
      begin
        Exit;
        EditCodigoFabricante.SetFocus;
      end;
    finally
      CDSTransiente.Close;
    end;
  end;
end;
{$ENDREGION}

end.