{ *******************************************************************************
Title: T2TiPDV
Description: Janela para inclusão dos dados de notas fiscais emitidas manualmente

The MIT License

Copyright: Copyright (C) 2014 T2Ti.COM

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

@author Albert Eije
@version 2.0
******************************************************************************* }
unit UNotaFiscal;

interface

uses
  SysUtils, Types, Windows, Classes, Forms, ACBrBase, StdCtrls, UBase,
  Controls, ComCtrls, ExtCtrls, ACBrEnterTab, Mask, Graphics, Generics.Collections,
  JvExStdCtrls, Dialogs, JvEdit, JvValidateEdit, Buttons,
  JvExButtons, JvBitBtn, ACBrValidador, JvExMask, System.Variants,
  JvToolEdit, JvExControls, JvLabel, JvGradient, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, DB, NotaFiscalDetalheVO,
  NotaFiscalCabecalhoVO, Messages, pngimage, JvBaseEdits,
  JvMaskEdit, Vcl.DBCtrls, LabeledDBCtrls, Datasnap.DBClient, EcfProdutoVO,
  Biblioteca, Constantes, Controller;

type
  TFNotaFiscal = class(TFBase)
    ACBrEnterTab1: TACBrEnterTab;
    ACBrValidador1: TACBrValidador;
    GroupBox1: TGroupBox;
    editCodigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PanelBotoes: TPanel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    GroupBox6: TGroupBox;
    Label4: TLabel;
    EditNome: TLabeledEdit;
    editCpfCnpj: TLabeledEdit;
    GroupBox3: TGroupBox;
    labelDescricaoProduto: TJvLabel;
    GroupBox5: TGroupBox;
    Bevel4: TBevel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Label7: TLabel;
    lblSubTotal: TLabel;
    LabelDescontoAcrescimo: TLabel;
    Label6: TLabel;
    lblValorTotal: TLabel;
    Label5: TLabel;
    Image1: TImage;
    panelF8: TPanel;
    labelF9: TLabel;
    imageF9: TImage;
    panelF12: TPanel;
    labelF12: TLabel;
    imageF12: TImage;
    PanelEsc: TPanel;
    Label8: TLabel;
    Image2: TImage;
    panelF1: TPanel;
    labelF1: TLabel;
    imageF1: TImage;
    PanelF6: TPanel;
    LabelF6: TLabel;
    ImageF6: TImage;
    lblDescAcrescDescricao: TLabel;
    editCodigoCliente: TJvCalcEdit;
    Label11: TLabel;
    EditNumeroNF: TJvCalcEdit;
    Label12: TLabel;
    EditDataEmissao: TJvDateEdit;
    Label13: TLabel;
    EditHoraEmissao: TJvMaskEdit;
    editQuantidade: TJvCalcEdit;
    editUnitario: TJvCalcEdit;
    editTotalItem: TJvCalcEdit;
    CDSFuncionario: TClientDataSet;
    DSFuncionario: TDataSource;
    ComboboxFuncionario: TLabeledDBLookupComboBox;
    CDSNF: TClientDataSet;
    DSNF: TDataSource;
    JvDBUltimGrid1: TJvDBUltimGrid;
    procedure Soma;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure panelF1Click(Sender: TObject);
    procedure panelF6Click(Sender: TObject);
    procedure panelF8Click(Sender: TObject);
    procedure panelF12Click(Sender: TObject);
    procedure PanelEscClick(Sender: TObject);
    procedure panelF1MouseEnter(Sender: TObject);
    procedure panelF1MouseLeave(Sender: TObject);
    procedure panelF6MouseEnter(Sender: TObject);
    procedure panelF6MouseLeave(Sender: TObject);
    procedure panelF8MouseEnter(Sender: TObject);
    procedure panelF8MouseLeave(Sender: TObject);
    procedure panelF12MouseEnter(Sender: TObject);
    procedure panelF12MouseLeave(Sender: TObject);
    procedure PanelEscMouseEnter(Sender: TObject);
    procedure PanelEscMouseLeave(Sender: TObject);
    procedure CarregaVendedor;
    procedure CDSNFBeforePost(DataSet: TDataSet);

  private
    { Private declarations }
    procedure ShowHint(Sender: TObject);
    procedure LimpaCampos;
    procedure ConfiguraCDSGrid;
    procedure IdentificaCliente;
    procedure Confirma;
    procedure AtualizaTotais;
    procedure LocalizaProduto;
    procedure ExcluirItem;
    procedure TelaPadrao;
  public
  end;

var
  FNotaFiscal: TFNotaFiscal;

  SeqItem: Integer;
  SubTotal, TotalGeral, Desconto, Acrescimo: Extended;
  ObjetoVO: TNotaFiscalCabecalhoVO;

implementation

uses UImportaProduto, UImportaCliente, EcfFuncionarioVO, EcfFuncionarioController;

{$R *.dfm}

procedure TFNotaFiscal.FormCreate(Sender: TObject);
begin
  ConfiguraCDSGrid;
  CarregaVendedor;
  Application.OnHint := ShowHint;
  ObjetoVO := TNotaFiscalCabecalhoVO.Create;
end;

procedure TFNotaFiscal.FormActivate(Sender: TObject);
begin
  TelaPadrao;
  EditNumeroNF.SetFocus;
end;

procedure TFNotaFiscal.ShowHint(Sender: TObject);
begin
  labelDescricaoProduto.Caption := Application.Hint;
end;

procedure TFNotaFiscal.Soma;
begin
  SubTotal := SubTotal + CDSNF.FieldByName('VALOR_TOTAL').AsFloat;
  TotalGeral := SubTotal + (Acrescimo - Desconto);
end;

procedure TFNotaFiscal.CarregaVendedor;
begin
  ConfiguraCDSFromVO(CDSFuncionario, TEcfFuncionarioVO);

  TEcfFuncionarioController.SetDataSet(CDSFuncionario);
  TController.ExecutarMetodo('EcfFuncionarioController.TEcfFuncionarioController', 'Consulta', ['ID>0', '0', False], 'GET', 'Lista');

  ComboboxFuncionario.ListField := 'NOME';
  ComboboxFuncionario.KeyField := 'ID';
end;

procedure TFNotaFiscal.CDSNFBeforePost(DataSet: TDataSet);
begin
  CDSNF.FieldByName('VALOR_TOTAL').AsFloat := CDSNF.FieldByName('VALOR_UNITARIO').AsFloat * CDSNF.FieldByName('QUANTIDADE').AsFloat;
  FNotaFiscal.Soma;
end;

procedure TFNotaFiscal.ConfiguraCDSGrid;
begin
  ConfiguraCDSFromVO(CDSNF, TNotaFiscalDetalheVO);
  ConfiguraGridFromVO(JvDBUltimGrid1, TNotaFiscalDetalheVO);

  // Esconde a coluna ID
  JvDBUltimGrid1.Columns.Items[0].Visible := False;

  CDSNF.Open;
end;

procedure TFNotaFiscal.IdentificaCliente;
begin
  Application.CreateForm(TFImportaCliente, FImportaCliente);
  FImportaCliente.QuemChamou := 'NF';
  FImportaCliente.ShowModal;
  if editCodigoCliente.AsInteger > 0 then
  begin
    editCodigoCliente.SetFocus;
    keybd_event(VK_Return, 0, 0, 0);
  end;
end;

procedure TFNotaFiscal.Confirma;
var
  NotaFiscalDetalhe: TNotaFiscalDetalheVO;
begin
  if (EditNome.Text <> '') and (editCpfCnpj.Text <> '') then
  begin
    if ComboboxFuncionario.KeyValue = Null then
    begin
      ShowMessage('Escolha um Vendedor');
      ComboboxFuncionario.SetFocus;
      abort;
    end;

    ObjetoVO.IdCliente := editCodigoCliente.AsInteger;
    ObjetoVO.CpfCnpjCliente := editCpfCnpj.Text;

    ObjetoVO.Cfop := Sessao.Configuracao.CFOPNF2;

    ObjetoVO.Numero := EditNumeroNF.Text;
    ObjetoVO.Cfop := 5102;
    ObjetoVO.Serie := 'D';
    ObjetoVO.Subserie := '';
    ObjetoVO.Cancelada := 'N';
    ObjetoVO.TipoNota := '2';
    ObjetoVO.IdEcfFuncionario := ComboboxFuncionario.KeyValue;
    ObjetoVO.DataEmissao := EditDataEmissao.Date;
    ObjetoVO.HoraEmissao := EditHoraEmissao.Text;

    CDSNF.DisableControls;
    CDSNF.First;
    while not CDSNF.Eof do
    begin
      NotaFiscalDetalhe := TNotaFiscalDetalheVO.Create;
      NotaFiscalDetalhe.IdProduto := CDSNF.FieldByName('ID_PRODUTO').AsInteger;
      NotaFiscalDetalhe.Item := CDSNF.FieldByName('ITEM').AsInteger;
      NotaFiscalDetalhe.Quantidade := CDSNF.FieldByName('QUANTIDADE').AsFloat;
      NotaFiscalDetalhe.ValorUnitario := CDSNF.FieldByName('VALOR_UNITARIO').AsFloat;
      NotaFiscalDetalhe.ValorTotal := CDSNF.FieldByName('VALOR_TOTAL').AsFloat;
      NotaFiscalDetalhe.Cfop := CDSNF.FieldByName('CFOP').AsInteger;
      NotaFiscalDetalhe.BaseIcms := CDSNF.FieldByName('BASE_ICMS').AsFloat;
      NotaFiscalDetalhe.TaxaIcms := CDSNF.FieldByName('TAXA_ICMS').AsFloat;
      NotaFiscalDetalhe.Icms := CDSNF.FieldByName('ICMS').AsFloat;
      NotaFiscalDetalhe.IcmsOutras := CDSNF.FieldByName('ICMS_OUTRAS').AsFloat;
      NotaFiscalDetalhe.IcmsIsento := CDSNF.FieldByName('ICMS_ISENTO').AsFloat;
      NotaFiscalDetalhe.TaxaDesconto := CDSNF.FieldByName('TAXA_DESCONTO').AsFloat;
      NotaFiscalDetalhe.Desconto := CDSNF.FieldByName('DESCONTO').AsFloat;
      NotaFiscalDetalhe.TaxaIssqn := CDSNF.FieldByName('TAXA_ISSQN').AsFloat;
      NotaFiscalDetalhe.Issqn := CDSNF.FieldByName('ISSQN').AsFloat;
      NotaFiscalDetalhe.TaxaPis := CDSNF.FieldByName('TAXA_PIS').AsFloat;
      NotaFiscalDetalhe.Pis := CDSNF.FieldByName('PIS').AsFloat;
      NotaFiscalDetalhe.TaxaCofins := CDSNF.FieldByName('TAXA_COFINS').AsFloat;
      NotaFiscalDetalhe.Cofins := CDSNF.FieldByName('COFINS').AsFloat;
      NotaFiscalDetalhe.TaxaAcrescimo := CDSNF.FieldByName('TAXA_ACRESCIMO').AsFloat;
      NotaFiscalDetalhe.Acrescimo := CDSNF.FieldByName('ACRESCIMO').AsFloat;
      NotaFiscalDetalhe.TaxaIpi := CDSNF.FieldByName('TAXA_IPI').AsFloat;
      NotaFiscalDetalhe.Ipi := CDSNF.FieldByName('IPI').AsFloat;
      NotaFiscalDetalhe.Cancelado := CDSNF.FieldByName('CANCELADO').AsString;
      NotaFiscalDetalhe.Cst := CDSNF.FieldByName('CST').AsString;
      NotaFiscalDetalhe.MovimentaEstoque := CDSNF.FieldByName('MOVIMENTA_ESTOQUE').AsString;
      NotaFiscalDetalhe.EcfIcmsSt := CDSNF.FieldByName('ECF_ICMS_ST').AsString;

      ObjetoVO.ListaNotaFiscalDetalheVO.Add(NotaFiscalDetalhe);
      CDSNF.Next;
    end;

    // InsereObjeto - Objeto inserido retorna para a variável ObjetoConsultado do Controller
    TController.ExecutarMetodo('NotaFiscalCabecalhoController.TNotaFiscalCabecalhoController', 'InsereObjeto', [ObjetoVO], 'PUT', 'Lista');
    ExecutarIntegracao('EXPORTA_NF');

    ShowMessage('Nota Fiscal inserida com sucesso. ');

    TelaPadrao;
    AtualizaTotais;
    CDSNF.EnableControls;

    editCodigo.SetFocus;
  end
  else
  begin
    Application.MessageBox('Nome do Cliente ou CPF/CNPJ não Identificado.', 'Informação do sistema', MB_OK + MB_ICONINFORMATION);
    editCodigoCliente.SetFocus;
  end;
end;

procedure TFNotaFiscal.ExcluirItem;
begin
  if CDSNF.RecordCount > 0 then
  begin
    if Application.MessageBox('Deseja realmente excluir o registro selecionado?', 'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      try
        SubTotal := SubTotal - CDSNF.FieldByName('VALOR_TOTAL').AsFloat;
        AtualizaTotais;
        CDSNF.Delete;
        editQuantidade.Text := '1';
        editUnitario.Text := '0,00';
        editTotalItem.Text := '0,00';
        editCodigo.SetFocus;
      except
        Application.MessageBox('Ocorreu um erro. Exclusão não realizada.', 'Erro do sistema', MB_OK + MB_ICONERROR);
      end;
    end;
  end
  else
    Application.MessageBox('Não Existe Produto Disponível Para Exclusão.', 'Não autorizado!', MB_OK + MB_ICONERROR);
end;

procedure TFNotaFiscal.AtualizaTotais;
begin
  ObjetoVO.TotalProdutos := SubTotal;
  ObjetoVO.Desconto := Desconto;
  ObjetoVO.Acrescimo := Acrescimo;
  ObjetoVO.TotalNf := SubTotal + (Acrescimo - Desconto);

  if Desconto > 0 then
  begin
    lblDescAcrescDescricao.Caption := 'Desconto:';
    LabelDescontoAcrescimo.Caption := FormatFloat('0.00', ObjetoVO.Desconto);
    lblDescAcrescDescricao.Font.Color := clRed;
    LabelDescontoAcrescimo.Font.Color := clRed;
  end
  else if Acrescimo > 0 then
  begin
    lblDescAcrescDescricao.Caption := 'Acréscimo:';
    LabelDescontoAcrescimo.Caption := FormatFloat('0.00', ObjetoVO.Acrescimo);
    lblDescAcrescDescricao.Font.Color := clGreen;
    LabelDescontoAcrescimo.Font.Color := clGreen;
  end
  else
  begin
    LabelDescontoAcrescimo.Caption := '';
    lblDescAcrescDescricao.Caption := '';
  end;

  lblSubTotal.Caption := FormatFloat('0.00', ObjetoVO.TotalProdutos);
  lblValorTotal.Caption := FormatFloat('0.00', ObjetoVO.TotalNf);
end;

procedure TFNotaFiscal.TelaPadrao;
begin
  LimpaCampos;
  TotalGeral := 0;
  SubTotal := 0;
  Desconto := 0;
  Acrescimo := 0;
  SeqItem := 0;
end;

procedure TFNotaFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja Realmente Fechar a Tela de Nota Fiscal?', 'Sair do Sistema', MB_YESNO + MB_ICONQUESTION) <> IDYES then
    Action := caNone
  else
  begin
    Action := caFree;
    FNotaFiscal := Nil;
  end;
end;

procedure TFNotaFiscal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 112 then
    LocalizaProduto;
  if Key = 117 then
    IdentificaCliente;
  if Key = 119 then
    ExcluirItem;
  if Key = 123 then
    Confirma;
  if Key = 27 then
    Close;
end;

procedure TFNotaFiscal.LimpaCampos;
begin
  editCpfCnpj.Text := '';
  EditNome.Text := '';
  editQuantidade.Text := '1,000';
  editUnitario.Text := '0,000';
  editTotalItem.Text := '0,000';
  labelDescricaoProduto.Caption := '';
  editCodigoCliente.Text := '';
  editCodigo.Text := '';
  CDSNF.EmptyDataSet;
  EditNumeroNF.Text := '';
  EditDataEmissao.Date := now;
  EditHoraEmissao.Text := FormatDateTime('hh:nn:ss', now);
end;

procedure TFNotaFiscal.LocalizaProduto;
var
  Produto: TEcfProdutoVO;
  Unitario, Quantidade, Total: Extended;
  Filtro: String;
begin
  Application.CreateForm(TFImportaProduto, FImportaProduto);
  FImportaProduto.QuemChamou := 'NF';
  FImportaProduto.ShowModal;
  if (trim(editCodigo.Text) <> '') then
  begin
    Filtro := 'ID = ' + QuotedStr(editCodigo.Text);
    Produto := TEcfProdutoVO(TController.BuscarObjeto('ProdutoController.TProdutoController', 'ConsultaObjeto', [Filtro], 'GET'));
    if Assigned(Produto) then
    begin
      Inc(SeqItem);

      CDSNF.Append;
      CDSNF.FieldByName('ITEM').AsInteger := SeqItem;
      CDSNF.FieldByName('PRODUTO.GTIN').AsAnsiString := Produto.GTIN;
      CDSNF.FieldByName('PRODUTO.DESCRICAO_PDV').AsAnsiString := Produto.DescricaoPDV;
      CDSNF.FieldByName('VALOR_UNITARIO').AsFloat := editUnitario.Value;
      CDSNF.FieldByName('QUANTIDADE').AsFloat := editQuantidade.Value;
      CDSNF.FieldByName('VALOR_TOTAL').AsFloat := editTotalItem.Value;
      CDSNF.FieldByName('ID_PRODUTO').AsInteger := Produto.Id;
      CDSNF.FieldByName('CFOP').AsInteger := Sessao.Configuracao.CFOPNF2;
      CDSNF.FieldByName('CST').AsString := Produto.Cst;
      CDSNF.FieldByName('TAXA_ICMS').AsFloat := Produto.AliquotaICMS;
      CDSNF.FieldByName('TAXA_ISSQN').AsFloat := Produto.AliquotaISSQN;
      CDSNF.FieldByName('TAXA_PIS').AsFloat := Produto.AliquotaPIS;
      CDSNF.FieldByName('TAXA_COFINS').AsFloat := Produto.AliquotaCOFINS;
      CDSNF.FieldByName('COFINS').AsFloat := Produto.AliquotaCOFINS;
      CDSNF.FieldByName('TAXA_IPI').AsFloat := Produto.AliquotaIPI;
      CDSNF.FieldByName('ECF_ICMS_ST').AsString := Produto.EcfIcmsSt;
      if Produto.IPPT = 'T' then
        CDSNF.FieldByName('MOVIMENTA_ESTOQUE').AsString := 'S'
      else
        CDSNF.FieldByName('MOVIMENTA_ESTOQUE').AsString := 'N';
      CDSNF.Post;

      Unitario := editUnitario.Value;
      Quantidade := editQuantidade.Value;
      Total := TruncaValor(Unitario * Quantidade, Constantes.TConstantes.DECIMAIS_VALOR);
      editTotalItem.Value := Total;

      AtualizaTotais;
    end;
  end;
end;

{$Region 'Aparência e controle dos painéis com as funções do programa - F1 a F12'}
procedure TFNotaFiscal.panelF1MouseEnter(Sender: TObject);
begin
  panelF1.BevelOuter := bvRaised;
  panelF1.BevelWidth := 2;
end;

procedure TFNotaFiscal.panelF1MouseLeave(Sender: TObject);
begin
  panelF1.BevelOuter := bvNone;
end;

procedure TFNotaFiscal.panelF1Click(Sender: TObject);
begin
  LocalizaProduto;
end;

procedure TFNotaFiscal.panelF6MouseEnter(Sender: TObject);
begin
  PanelF6.BevelOuter := bvRaised;
  PanelF6.BevelWidth := 2;
end;

procedure TFNotaFiscal.panelF6MouseLeave(Sender: TObject);
begin
  PanelF6.BevelOuter := bvNone;
end;

procedure TFNotaFiscal.panelF6Click(Sender: TObject);
begin
  IdentificaCliente;
end;

procedure TFNotaFiscal.panelF8MouseEnter(Sender: TObject);
begin
  panelF8.BevelOuter := bvRaised;
  panelF8.BevelWidth := 2;
end;

procedure TFNotaFiscal.panelF8MouseLeave(Sender: TObject);
begin
  panelF8.BevelOuter := bvNone;
end;

procedure TFNotaFiscal.panelF8Click(Sender: TObject);
begin
  ExcluirItem;
end;

procedure TFNotaFiscal.panelF12MouseEnter(Sender: TObject);
begin
  panelF12.BevelOuter := bvRaised;
  panelF12.BevelWidth := 2;
end;

procedure TFNotaFiscal.panelF12MouseLeave(Sender: TObject);
begin
  panelF12.BevelOuter := bvNone;
end;

procedure TFNotaFiscal.panelF12Click(Sender: TObject);
begin
  Confirma;
end;

procedure TFNotaFiscal.PanelEscMouseEnter(Sender: TObject);
begin
  PanelEsc.BevelOuter := bvRaised;
  PanelEsc.BevelWidth := 2;
end;

procedure TFNotaFiscal.PanelEscMouseLeave(Sender: TObject);
begin
  PanelEsc.BevelOuter := bvNone;
end;

procedure TFNotaFiscal.PanelEscClick(Sender: TObject);
begin
  Close;
end;
{$EndRegion 'Aparência e controle dos painéis com as funções do programa - F1 a F12'}


end.
