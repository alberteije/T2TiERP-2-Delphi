{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de Parâmetros

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

@author Albert Eije (alberteije@gmail.com)
@version 2.0
******************************************************************************* }
unit UWmsParametro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, DB, DBClient, Menus, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, WmsParametroVO,
  WmsParametroController, Tipos, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, ActnList, ToolWin, ActnMan, ActnCtrls,
  PlatformDefaultStyleActnCtrls, Biblioteca, StrUtils, Controller;

type
  TFWmsParametro = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditHoraPorVolume: TLabeledCalcEdit;
    EditPessoaPorVolume: TLabeledCalcEdit;
    EditHoraPorPeso: TLabeledCalcEdit;
    EditPessoaPorPeso: TLabeledCalcEdit;
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
  FWmsParametro: TFWmsParametro;

implementation

uses UDataModule;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFWmsParametro.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TWmsParametroVO;
  ObjetoController := TWmsParametroController.Create;

  inherited;
end;

procedure TFWmsParametro.ControlaBotoes;
begin
  inherited;

  BotaoImprimir.Visible := False;
end;

procedure TFWmsParametro.ControlaPopupMenu;
begin
  inherited;

  MenuImprimir.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
function TFWmsParametro.DoInserir: Boolean;
begin
  Result := inherited DoInserir;

  if Result then
  begin
    EditHoraPorVolume.SetFocus;
  end;
end;

function TFWmsParametro.DoEditar: Boolean;
begin
  Result := inherited DoEditar;

  if Result then
  begin
    EditHoraPorVolume.SetFocus;
  end;
end;

function TFWmsParametro.DoExcluir: Boolean;
begin
  if inherited DoExcluir then
  begin
    try
      TController.ExecutarMetodo('WmsParametroController.TWmsParametroController', 'Exclui', [IdRegistroSelecionado], 'DELETE', 'Boolean');
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
    TController.ExecutarMetodo('WmsParametroController.TWmsParametroController', 'Consulta', [Trim(Filtro), Pagina.ToString, False], 'GET', 'Lista');
end;

function TFWmsParametro.DoSalvar: Boolean;
var
  i: Integer;
begin
  Result := inherited DoSalvar;

  if Result then
  begin
    try
      if not Assigned(ObjetoVO) then
        ObjetoVO := TWmsParametroVO.Create;

      TWmsParametroVO(ObjetoVO).IdEmpresa := Sessao.Empresa.Id;
      TWmsParametroVO(ObjetoVO).HoraPorVolume := EditHoraPorVolume.AsInteger;
      TWmsParametroVO(ObjetoVO).PessoaPorVolume := EditPessoaPorVolume.AsInteger;
      TWmsParametroVO(ObjetoVO).HoraPorPeso := EditHoraPorPeso.AsInteger;
      TWmsParametroVO(ObjetoVO).PessoaPorPeso := EditPessoaPorPeso.AsInteger;

      if StatusTela = stInserindo then
      begin
        TController.ExecutarMetodo('WmsParametroController.TWmsParametroController', 'Insere', [TWmsParametroVO(ObjetoVO)], 'PUT', 'Lista');
      end
      else if StatusTela = stEditando then
      begin
        if TWmsParametroVO(ObjetoVO).ToJSONString <> StringObjetoOld then
        begin
          TController.ExecutarMetodo('WmsParametroController.TWmsParametroController', 'Altera', [TWmsParametroVO(ObjetoVO)], 'POST', 'Boolean');
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
procedure TFWmsParametro.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TWmsParametroVO(TController.BuscarObjeto('WmsParametroController.TWmsParametroController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditHoraPorVolume.AsInteger := TWmsParametroVO(ObjetoVO).HoraPorVolume;
    EditPessoaPorVolume.AsInteger := TWmsParametroVO(ObjetoVO).PessoaPorVolume;
    EditHoraPorPeso.AsInteger := TWmsParametroVO(ObjetoVO).HoraPorPeso;
    EditPessoaPorPeso.AsInteger := TWmsParametroVO(ObjetoVO).PessoaPorPeso;

    // Serializa o objeto para consultar posteriormente se houve alterações
    FormatSettings.DecimalSeparator := '.';
    StringObjetoOld := ObjetoVO.ToJSONString;
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.
