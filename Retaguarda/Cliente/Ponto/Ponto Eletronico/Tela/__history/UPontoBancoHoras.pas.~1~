{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela Consulta do Banco de Horas para o Ponto Eletrônico

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

  @author Albert Eije
  @version 1.0
  ******************************************************************************* }

unit UPontoBancoHoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, PontoBancoHorasVO, PontoBancoHorasController,
  Atributos, Constantes, LabeledCtrls, Mask, JvExMask, JvToolEdit, JvBaseEdits,
  StrUtils, DB, DBClient, Generics.Collections;

type
  [TFormDescription(TConstantes.MODULO_PONTO_ELETRONICO, 'Banco de Horas')]

  TFPontoBancoHoras = class(TFTelaCadastro)
    BevelEdits: TBevel;
    EditIdColaborador: TLabeledCalcEdit;
    EditColaborador: TLabeledEdit;
    EditDataTrabalho: TLabeledDateEdit;
    EditQuantidade: TLabeledMaskEdit;
    ComboboxSituacao: TLabeledComboBox;
    PageControlItens: TPageControl;
    tsItens: TTabSheet;
    PanelItens: TPanel;
    GridParcelas: TJvDBUltimGrid;
    DSPontoBancoHorasUtilizacao: TDataSource;
    CDSPontoBancoHorasUtilizacao: TClientDataSet;
    CDSPontoBancoHorasUtilizacaoID: TIntegerField;
    CDSPontoBancoHorasUtilizacaoID_PONTO_BANCO_HORAS: TIntegerField;
    CDSPontoBancoHorasUtilizacaoDATA_UTILIZACAO: TDateField;
    CDSPontoBancoHorasUtilizacaoQUANTIDADE_UTILIZADA: TStringField;
    CDSPontoBancoHorasUtilizacaoOBSERVACAO: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;

    procedure ControlaBotoes; override;
  end;

var
  FPontoBancoHoras: TFPontoBancoHoras;

implementation

uses PontoBancoHorasUtilizacaoVO;

{$R *.dfm}

{$REGION 'Infra'}
procedure TFPontoBancoHoras.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPontoBancoHorasVO;
  ObjetoController := TPontoBancoHorasController.Create;

  inherited;
end;

procedure TFPontoBancoHoras.ControlaBotoes;
begin
  inherited;

  BotaoInserir.Visible := False;
  BotaoAlterar.Visible := False;
  BotaoExcluir.Visible := False;
  BotaoSalvar.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFPontoBancoHoras.GridParaEdits;
var
  PontoBancoHorasUtilizacaoEnumerator: TEnumerator<TPontoBancoHorasUtilizacaoVO>;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TPontoBancoHorasVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin
    EditIdColaborador.AsInteger := TPontoBancoHorasVO(ObjetoVO).IdColaborador;
    EditColaborador.Text := TPontoBancoHorasVO(ObjetoVO).ColaboradorNome;
    EditDataTrabalho.Date := TPontoBancoHorasVO(ObjetoVO).DataTrabalho;
    EditQuantidade.Text := TPontoBancoHorasVO(ObjetoVO).Quantidade;

    case AnsiIndexStr(TPontoBancoHorasVO(ObjetoVO).Situacao, ['N', 'U', 'P']) of
      0:
        ComboboxSituacao.ItemIndex := 0;
      1:
        ComboboxSituacao.ItemIndex := 1;
      2:
        ComboboxSituacao.ItemIndex := 2;
    end;

    // Utilização
    PontoBancoHorasUtilizacaoEnumerator := TPontoBancoHorasVO(ObjetoVO).ListaPontoBancoHorasUtilizacaoVO.GetEnumerator;
    try
      with PontoBancoHorasUtilizacaoEnumerator do
      begin
        while MoveNext do
        begin
          CDSPontoBancoHorasUtilizacao.Append;

          CDSPontoBancoHorasUtilizacaoID.AsInteger := Current.id;
          CDSPontoBancoHorasUtilizacaoID_PONTO_BANCO_HORAS.AsInteger := Current.IdPontoBancoHoras;
          CDSPontoBancoHorasUtilizacaoDATA_UTILIZACAO.AsDateTime := Current.DataUtilizacao;
          CDSPontoBancoHorasUtilizacaoQUANTIDADE_UTILIZADA.AsString := Current.QuantidadeUtilizada;
          CDSPontoBancoHorasUtilizacaoOBSERVACAO.AsString := Current.Observacao;

          CDSPontoBancoHorasUtilizacao.Post;
        end;
      end;
    finally
      PontoBancoHorasUtilizacaoEnumerator.Free;
    end;
  end;
end;
{$ENDREGION}

end.
