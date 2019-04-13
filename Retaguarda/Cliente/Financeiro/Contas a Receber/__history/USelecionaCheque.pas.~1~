{ *******************************************************************************
  Title: T2Ti ERP
  Description: Janela para selecionar o cheque para pagamento

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
unit USelecionaCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls, ActnList,
  RibbonSilverStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, LabeledCtrls, ComCtrls,
  rpgraphicex, JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvBaseEdits, Mask,
  JvExMask, JvToolEdit, UFinParcelaRecebimento, Biblioteca, PessoaVO, ContaCaixaVO;

type
  TFSelecionaCheque = class(TForm)
    PanelCabecalho: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    ActionToolBarPrincipal: TActionToolBar;
    ActionManagerLocal: TActionManager;
    ActionCancelar: TAction;
    PageControlItens: TPageControl;
    tsDados: TTabSheet;
    PanelDados: TPanel;
    EditBomPara: TLabeledDateEdit;
    EditValorCheque: TLabeledCalcEdit;
    MemoHistorico: TLabeledMemo;
    Bevel2: TBevel;
    ActionConfirmar: TAction;
    EditIdPessoa: TLabeledCalcEdit;
    EditPessoa: TLabeledEdit;
    EditCodigoBanco: TLabeledEdit;
    EditCodigoAgencia: TLabeledEdit;
    EditNumeroConta: TLabeledEdit;
    EditDataEmissao: TLabeledDateEdit;
    EditNumeroCheque: TLabeledCalcEdit;
    EditCpfCnpj: TLabeledEdit;
    EditIdContaCaixa: TLabeledCalcEdit;
    EditContaCaixa: TLabeledEdit;
    procedure ActionCancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionConfirmarExecute(Sender: TObject);
    procedure EditIdPessoaExit(Sender: TObject);
    procedure EditIdPessoaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CarregaDadosPessoa;
    procedure CarregaDadosContaCaixa;
    procedure EditIdPessoaKeyPress(Sender: TObject; var Key: Char);
    procedure EditIdContaCaixaExit(Sender: TObject);
    procedure EditIdContaCaixaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIdContaCaixaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Confirmou: Boolean;
  end;

var
  FSelecionaCheque: TFSelecionaCheque;
  PessoaVO: TPessoaVO;
  ContaCaixaVO: TContaCaixaVO;

implementation

uses
  PessoaController, ULookup, ContaCaixaController;
{$R *.dfm}

{$REGION 'Infra'}
procedure TFSelecionaCheque.FormCreate(Sender: TObject);
begin
  PessoaVO := TPessoaVO.Create;
end;

procedure TFSelecionaCheque.FormShow(Sender: TObject);
begin
  Confirmou := False;
  EditIdPessoa.SetFocus;
end;
{$ENDREGION}

{$REGION 'Campos Transientes'}
procedure TFSelecionaCheque.EditIdContaCaixaExit(Sender: TObject);
begin
  ContaCaixaVO := TContaCaixaVO.Create;
  if EditIdContaCaixa.Value <> 0 then
  begin
    ContaCaixaVO := TContaCaixaController.VO<TContaCaixaVO>('ID', QuotedStr(EditIdContaCaixa.Text));
    CarregaDadosContaCaixa;
  end;
end;

procedure TFSelecionaCheque.EditIdContaCaixaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
  begin
    ContaCaixaVO := TContaCaixaVO.Create;
    Application.CreateForm(TFLookup, FLookup);
    ULookup.FLookup.ObjetoVO := ContaCaixaVO;
    ULookup.FLookup.ObjetoController := TContaCaixaController.Create;
    FLookup.ShowModal;
    CarregaDadosContaCaixa;
    EditCpfCnpj.SetFocus;
  end;
end;

procedure TFSelecionaCheque.EditIdContaCaixaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    EditCpfCnpj.SetFocus;
  end;
end;

procedure TFSelecionaCheque.EditIdPessoaExit(Sender: TObject);
begin
  if EditIdPessoa.Value <> 0 then
  begin
    PessoaVO := TPessoaController.VO<TPessoaVO>('ID', QuotedStr(EditIdPessoa.Text));
    CarregaDadosPessoa;
  end;
end;

procedure TFSelecionaCheque.EditIdPessoaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
  begin
    PessoaVO := TPessoaVO.Create;
    Application.CreateForm(TFLookup, FLookup);
    ULookup.FLookup.ObjetoVO := PessoaVO;
    ULookup.FLookup.ObjetoController := TPessoaController.Create;
    FLookup.ShowModal;
    CarregaDadosPessoa;
    EditIdContaCaixa.SetFocus;
  end;
end;

procedure TFSelecionaCheque.EditIdPessoaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    EditIdContaCaixa.SetFocus;
  end;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFSelecionaCheque.ActionCancelarExecute(Sender: TObject);
begin
  Close;
  PessoaVO := Nil;
end;

procedure TFSelecionaCheque.ActionConfirmarExecute(Sender: TObject);
begin
  if Trim(RetiraMascara(EditBomPara.Text)) = '' then
  begin
    Application.MessageBox('É necessário informar a data do cheque.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditBomPara.SetFocus;
    Exit;
  end;
  if EditValorCheque.Value <= 0 then
  begin
    Application.MessageBox('É necessário informar o valor do cheque.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditValorCheque.SetFocus;
    Exit;
  end;
  if EditNumeroCheque.AsInteger <= 0 then
  begin
    Application.MessageBox('É necessário informar o número do cheque.', 'Mensagem do Sistema', MB_OK + MB_ICONINFORMATION);
    EditNumeroCheque.SetFocus;
    Exit;
  end;
  Confirmou := True;
  Close;
end;

procedure TFSelecionaCheque.CarregaDadosPessoa;
begin
  if not Assigned(PessoaVO) then
    PessoaVO := TPessoaVO.Create;

  EditIdPessoa.Clear;
  EditPessoa.Clear;

  if PessoaVO.Id > 0 then
  begin
    EditIdPessoa.AsInteger := PessoaVO.Id;
    EditPessoa.Text := PessoaVO.Nome;
    if PessoaVO.Tipo = 'F' then
      EditCpfCnpj.Text := PessoaVO.PessoaFisicaVO.Cpf
    else
      EditCpfCnpj.Text := PessoaVO.PessoaJuridicaVO.Cnpj;
  end
end;

procedure TFSelecionaCheque.CarregaDadosContaCaixa;
begin
  if not Assigned(ContaCaixaVO) then
    ContaCaixaVO := TContaCaixaVO.Create;

  EditIdContaCaixa.Clear;
  EditContaCaixa.Clear;

  if ContaCaixaVO.Id > 0 then
  begin
    EditIdContaCaixa.AsInteger := ContaCaixaVO.Id;
    EditContaCaixa.Text := ContaCaixaVO.Nome;
  end
end;

{$ENDREGION}

end.
