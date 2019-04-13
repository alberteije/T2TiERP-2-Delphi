{ *******************************************************************************
  Title: T2TiPDV
  Description: Gera Parcelas para o Contas a Receber.

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
  alberteije@gmail.com

  @author Albert Eije
  @version 2.0
  ******************************************************************************* }
unit UParcelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, UBase,
  Dialogs, StdCtrls, ExtCtrls, pngimage, JvExStdCtrls,
  Buttons, JvExButtons, JvBitBtn, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvEdit,
  JvValidateEdit, JvToolEdit, Mask, JvExMask, JvSpin, JvBaseEdits, DB, DBClient,
  JvComponentBase, JvEnterTab, JvDBControls, Generics.Collections, JvExControls,
  JvSpeedButton, Vcl.Imaging.jpeg;

type
  TFParcelamento = class(TFBase)
    botaoConfirma: TJvBitBtn;
    Image1: TImage;
    GroupBox1: TGroupBox;
    editNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    editCPF: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    JvDBGrid1: TJvDBGrid;
    qtdParcelas: TJvSpinEdit;
    editVencimento: TJvDateEdit;
    editValorVenda: TJvCalcEdit;
    editValorRecebido: TJvCalcEdit;
    editValorParcelar: TJvCalcEdit;
    Panel1: TPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    CDSParcela: TClientDataSet;
    DSParcela: TDataSource;
    CDSParcelaParcela: TIntegerField;
    CDSParcelaVencimento: TDateField;
    CDSParcelaValor: TCurrencyField;
    jvDBDateEdit1: TJvDBDateEdit;
    botaoLocalizaCliente: TSpeedButton;
    editDesconto: TJvCalcEdit;
    lblDesconto: TLabel;
    botaoCancela: TJvSpeedButton;
    Image2: TImage;
    procedure JvDBGrid1ColExit(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure botaoConfirmaClick(Sender: TObject);
    procedure JvDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure botaoLocalizaClienteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CalculaParcelas;
    procedure qtdParcelasChange(Sender: TObject);
    procedure editVencimentoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FParcelamento: TFParcelamento;
  confirmou: Boolean;

implementation

uses UCaixa, FinParcelaReceberVO, FinLancamentoReceberVO, Controller,
  Biblioteca, UIdentificaCliente, VendaController;
{$R *.dfm}

procedure TFParcelamento.botaoConfirmaClick(Sender: TObject);
var
  Total, ValoraParcelar: Currency;
  ParcelaCabecalho: TFinLancamentoReceberVO;
  ParcelaDetalhe: TFinParcelaReceberVO;
  Identificacao: String;
begin
  (*
    Exercício - Identifique devidamente o cliente para parcelamento

    if Sessao.VendaAtual.IdCliente < 1 then
    begin
    Application.MessageBox('Escolha um cliente para Parcelar!', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
    Abort;
    end;
  *)
  Identificacao := 'E' + IntToStr(Sessao.Configuracao.IdEmpresa) + 'X' + IntToStr(Sessao.Configuracao.IdNfceCaixa) + 'V' + DevolveInteiro(FCaixa.edtNVenda.Caption) + 'C' + DevolveInteiro(FCaixa.edtNumeroNota.Caption);

  Total := 0;
  ValoraParcelar := StrToFloat(editValorParcelar.Text);

  CDSParcela.DisableControls;
  CDSParcela.First;

  while not CDSParcela.Eof do
  begin
    Total := Total + CDSParcelaValor.AsFloat;
    CDSParcela.Next;
  end;
  CDSParcela.EnableControls;

  if (Total = ValoraParcelar) then
  begin
    try
      ParcelaCabecalho := TFinLancamentoReceberVO.Create;
      ParcelaCabecalho.IdFinDocumentoOrigem := 1;
      ParcelaCabecalho.IdCliente := 1;
      ParcelaCabecalho.QuantidadeParcela := qtdParcelas.AsInteger;
      ParcelaCabecalho.ValorTotal := Total;
      ParcelaCabecalho.ValorAReceber := Total;
      ParcelaCabecalho.DataLancamento := Date;
      ParcelaCabecalho.NumeroDocumento := Identificacao + 'Q' + qtdParcelas.Text;
      ParcelaCabecalho.PrimeiroVencimento := editVencimento.Date;
      ParcelaCabecalho.CodigoModuloLcto := 'NFC';

      CDSParcela.DisableControls;
      CDSParcela.First;
      while not CDSParcela.Eof do
      begin
        ParcelaDetalhe := TFinParcelaReceberVO.Create;
        ParcelaDetalhe.IdContaCaixa := 1;
        ParcelaDetalhe.IdFinStatusParcela := 1;
        ParcelaDetalhe.NumeroParcela := CDSParcelaParcela.AsInteger;
        ParcelaDetalhe.DataEmissao := Date;
        ParcelaDetalhe.DataVencimento := CDSParcelaVencimento.AsDateTime;
        ParcelaDetalhe.Valor := CDSParcelaValor.AsExtended;
        ParcelaCabecalho.ListaParcelaReceberVO.Add(ParcelaDetalhe);
        CDSParcela.Next;
      end;
      CDSParcela.EnableControls;

      TController.ExecutarMetodo('FinLancamentoReceberController.TFinLancamentoReceberController', 'Insere', [ParcelaCabecalho], 'PUT', 'Lista');

      confirmou := True;
    finally
      ParcelaCabecalho.Free;
    end;
    Close;
  end
  else
    Application.MessageBox('A soma das Parcelas difere do valor a parcelar!', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
end;

procedure TFParcelamento.CalculaParcelas;
var
  x, QtdPar: Integer;
  Vencimento: TDateTime;
  ValorTotal, ValorParcela, Resto: Real;
begin
  if CDSParcela.Active then
    CDSParcela.EmptyDataSet
  else
    CDSParcela.CreateDataSet;

  QtdPar := StrToInt(qtdParcelas.Text);
  ValorTotal := StrToFloat(editValorParcelar.Text);
  ValorParcela := Round(ValorTotal / QtdPar);
  Resto := (ValorTotal - (ValorParcela * QtdPar));

  Vencimento := editVencimento.Date;

  for x := 1 To QtdPar do
  begin
    CDSParcela.Append;
    CDSParcelaParcela.AsInteger := x;
    CDSParcelaVencimento.AsDateTime := Vencimento;
    if x = 1 then
      CDSParcelaValor.AsFloat := ValorParcela + Resto
    else
      CDSParcelaValor.AsFloat := ValorParcela;
    CDSParcela.Post;
    Vencimento := IncMonth(Vencimento);
  end;
  CDSParcela.Edit;
end;

procedure TFParcelamento.editVencimentoChange(Sender: TObject);
begin
  CalculaParcelas;
end;

procedure TFParcelamento.FormActivate(Sender: TObject);
begin
  Color := StringToColor(Sessao.Configuracao.CorJanelasInternas);
  editVencimento.Date := Date + 30;
  qtdParcelas.SetFocus;
end;

procedure TFParcelamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if confirmou then
    ModalResult := MROK;
end;

procedure TFParcelamento.FormCreate(Sender: TObject);
begin
  confirmou := False;
  qtdParcelas.MaxValue := Sessao.Configuracao.QuantidadeMaximaParcela;
end;

procedure TFParcelamento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then
    botaoCancela.Click;
  if (Key = 112) then
    botaoLocalizaCliente.Click;
end;

procedure TFParcelamento.JvDBGrid1ColExit(Sender: TObject);
begin
  if JvDBGrid1.SelectedField.FieldName = 'Vencimento' then
    jvDBDateEdit1.Visible := False;
end;

procedure TFParcelamento.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = 'Vencimento') then
    begin
      with jvDBDateEdit1 do
      begin
        Left := Rect.Left + JvDBGrid1.Left + 1;
        Top := Rect.Top + JvDBGrid1.Top + 1;
        Width := Rect.Right - Rect.Left + 2;
        Width := Rect.Right - Rect.Left + 2;
        Height := Rect.Bottom - Rect.Top + 2;
        Visible := True;
      end;
    end;
  end;
end;

procedure TFParcelamento.JvDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  qt, Total, valorant, prest, Resto: Real;
  Bookmark: TBookmark;
begin
  if (Key = vk_return) then
  begin
    Total := 0;
    prest := 0;
    qt := 0;
    valorant := 0;

    CDSParcela.Post;

    CDSParcela.DisableControls;

    // quantas parcelas ainda faltam
    Bookmark := CDSParcela.GetBookmark;
    while not CDSParcela.Eof do
    begin
      qt := qt + 1;
      CDSParcela.Next;
    end;
    qt := qt - 1;
    CDSParcela.GotoBookmark(Bookmark);

    // pega o saldo das parcelas anteriores
    Bookmark := CDSParcela.GetBookmark;
    while not CDSParcela.bof do
    begin
      valorant := valorant + CDSParcela.Fieldbyname('Valor').AsFloat;
      CDSParcela.prior;
    end;

    CDSParcela.GotoBookmark(Bookmark);
    Bookmark := CDSParcela.GetBookmark;
    Total := editValorParcelar.Value - valorant;

    If (Total >= 0) then
    begin
      if (Total > 0) and (qt > 0) then
      begin
        prest := Round(Total / qt);
        Resto := (Total - (prest * qt));
        CDSParcela.Edit;
        CDSParcela.Fieldbyname('VALOR').AsFloat := CDSParcela.Fieldbyname('VALOR').AsFloat + Resto;
        CDSParcela.Post;
      end;

      CDSParcela.Next;

      while not CDSParcela.Eof do
      begin
        CDSParcela.Edit;
        CDSParcela.Fieldbyname('VALOR').AsFloat := prest;
        CDSParcela.Post;
        CDSParcela.Next;
      end;
      CDSParcela.GotoBookmark(Bookmark);
    end
    else
    begin
      Application.MessageBox('O Valor Informado é Inválido!', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
    end;
    CDSParcela.EnableControls;
    CDSParcela.Edit;
  end;
end;

procedure TFParcelamento.JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(9)) then
    Exit;

  if (JvDBGrid1.SelectedField.FieldName = 'Vencimento') then
  begin
    jvDBDateEdit1.SetFocus;
    SendMessage(jvDBDateEdit1.Handle, WM_Char, Word(Key), 0);
  end
end;

procedure TFParcelamento.qtdParcelasChange(Sender: TObject);
begin
  CalculaParcelas;
end;

procedure TFParcelamento.botaoLocalizaClienteClick(Sender: TObject);
begin
  Application.CreateForm(TFIdentificaCliente, FIdentificaCliente);
  FIdentificaCliente.ShowModal;
end;

end.
