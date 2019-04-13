{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Cadastro de UF

The MIT License

Copyright: Copyright (C) 2015 T2Ti.COM

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
@version 2.0
******************************************************************************* }
unit UUf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTelaCadastro, Menus, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, Tipos, Atributos, Constantes,
  UfVO, UfController, LabeledCtrls, Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Controller;

type
  [TFormDescription(TConstantes.MODULO_CADASTROS, 'UF')]
  TFUf = class(TFTelaCadastro)
    EditNome: TLabeledEdit;
    EditSigla: TLabeledEdit;
    BevelEdits: TBevel;
    EditCodigoIbge: TLabeledCalcEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure ControlaBotoes; override;
  end;

var
  FUf: TFUf;

implementation

uses ULookup, PaisController, PaisVO, Biblioteca, UDataModule;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFUf.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TUfVO;
  ObjetoController := TUfController.Create;

  inherited;
end;

procedure TFUf.ControlaBotoes;
begin
  inherited;

  BotaoInserir.Visible := False;
  BotaoAlterar.Visible := False;
  BotaoExcluir.Visible := False;
  BotaoSalvar.Visible := False;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFUf.GridParaEdits;
begin
  inherited;

  if not CDSGrid.IsEmpty then
  begin
    ObjetoVO := TUfVO(TController.BuscarObjeto('UfController.TUfController', 'ConsultaObjeto', ['ID=' + IdRegistroSelecionado.ToString], 'GET'));
  end;

  if Assigned(ObjetoVO) then
  begin
    EditNome.Text            := TUfVO(ObjetoVO).Nome;
    EditSigla.Text           := TUfVO(ObjetoVO).Sigla;
    EditCodigoIBGE.AsInteger := TUfVO(ObjetoVO).CodigoIBGE;
  end;
end;
{$ENDREGION}

end.
