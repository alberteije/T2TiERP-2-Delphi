{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela das Taxas de Depreciação - Patrimônio

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

unit UPatrimTaxaDepreciacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, PatrimTaxaDepreciacaoVO,
  PatrimTaxaDepreciacaoController, Atributos, Constantes, LabeledCtrls, Mask,
  JvExMask, JvToolEdit, JvBaseEdits;

type
  [TFormDescription(TConstantes.MODULO_PATRIMONIO, 'Taxa de Depreciação')]

  TFPatrimTaxaDepreciacao = class(TFTelaCadastro)
    EditNcm: TLabeledEdit;
    BevelEdits: TBevel;
    MemoBem: TLabeledMemo;
    EditVida: TLabeledCalcEdit;
    EditTaxa: TLabeledCalcEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure ControlaBotoes; override;
  end;

var
  FTaxaDepreciacao: TFPatrimTaxaDepreciacao;

implementation

{$R *.dfm}

{$Region 'Infra'}
procedure TFPatrimTaxaDepreciacao.ControlaBotoes;
begin
  inherited;

  BotaoInserir.Visible := False;
  BotaoAlterar.Visible := False;
  BotaoExcluir.Visible := False;
  BotaoSalvar.Visible := False;
end;

procedure TFPatrimTaxaDepreciacao.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPatrimTaxaDepreciacaoVO;
  ObjetoController := TPatrimTaxaDepreciacaoController.Create;

  inherited;
end;
{$EndRegion}

{$Region 'Controle de Grid'}
procedure TFPatrimTaxaDepreciacao.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := ObjetoController.VO<TPatrimTaxaDepreciacaoVO>(IdRegistroSelecionado);
  end;

  if Assigned(ObjetoVO) then
  begin
    EditNcm.Text := TPatrimTaxaDepreciacaoVO(ObjetoVO).Ncm;
    MemoBem.Text := TPatrimTaxaDepreciacaoVO(ObjetoVO).Bem;
    EditVida.Value := TPatrimTaxaDepreciacaoVO(ObjetoVO).Vida;
    EditTaxa.Value := TPatrimTaxaDepreciacaoVO(ObjetoVO).Taxa;
  end;
end;
{$EndRegion}

end.
