unit ULocaliza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, UBase,
  Dialogs, JvExControls, JvSpeedButton, Tipos;

type
  TFLocaliza = class(TFBase)
    btnProdutos: TJvSpeedButton;
    btnClientes: TJvSpeedButton;
    btnVendedor: TJvSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnClientesClick(Sender: TObject);
    procedure btnVendedorClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLocaliza: TFLocaliza;

implementation

uses UCaixa, UIdentificaCliente, ClienteVO, EcfFuncionarioVO, UImportaNumero,
  Controller, UImportaProduto;

{$R *.dfm}

procedure TFLocaliza.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  FLocaliza:= nil;
end;

procedure TFLocaliza.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 123 then
    Close;
  if (Key = 97) or (Key = 49) then
    btnProdutos.Click;
  if (Key = 98) or (Key = 50) then
    btnClientes.Click;
  if (Key = 99) or (Key = 51) then
    btnVendedor.Click;
end;

procedure TFLocaliza.btnProdutosClick(Sender: TObject);
begin
  Application.CreateForm(TFImportaProduto, FImportaProduto);
  FImportaProduto.ShowModal;
  if (Sessao.StatusCaixa = scVendaEmAndamento) and (trim(FCaixa.editCodigo.Text)<>'') then
  begin
    FCaixa.editCodigo.SetFocus;
    FCaixa.IniciaVendaDeItens;
  end;
  FLocaliza.Close;
end;

procedure TFLocaliza.btnClientesClick(Sender: TObject);
begin
  if Sessao.StatusCaixa <> scSomenteConsulta then
  begin
    if Sessao.Movimento.Id <> 0 then
    begin
      if Sessao.StatusCaixa = scAberto then
      begin
        Application.CreateForm(TFIdentificaCliente, FIdentificaCliente);
        FIdentificaCliente.ShowModal;
        if Sessao.VendaAtual.CpfCnpjCliente <> '' then
          FCaixa.IniciaVenda
      end
      else
        Application.MessageBox('Já existe venda em andamento. Cancele o cupom e inicie nova venda.', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
    end
    else
      Application.MessageBox('Não existe um movimento aberto.', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION)
  end
  else
    Application.MessageBox('Terminal em Estado Somente Consulta.', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
  Close;
end;

procedure TFLocaliza.btnVendedorClick(Sender: TObject);
var
  Vendedor: TEcfFuncionarioVO;
  Filtro: String;
begin
  if Sessao.StatusCaixa <> scSomenteConsulta then
  begin
    if Sessao.StatusCaixa = scVendaEmAndamento then
    begin
      Application.CreateForm(TFImportaNumero, FImportaNumero);
      FImportaNumero.Caption := 'Identifica Vendedor';
      FImportaNumero.LabelEntrada.Caption := 'Informe o código do vendedor';
      try
        try
          if (FImportaNumero.ShowModal = MROK) then
          begin
            Filtro := 'ID = ' + FImportaNumero.EditEntrada.Text;
            Vendedor := TEcfFuncionarioVO(TController.BuscarObjeto('EcfFuncionarioController.TEcfFuncionarioController', 'ConsultaObjeto', [Filtro], 'GET'));
            if Assigned(Vendedor) then
              Sessao.VendaAtual.IdEcfFuncionario := Vendedor.Id
            else
              Application.MessageBox('Vendedor: código inválido ou inexistente.', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
          end;
        except
        end;
      finally
        FreeAndNil(Vendedor);
      end;
    end
    else
      Application.MessageBox('Não existe venda em andamento.', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
  end
  else
    Application.MessageBox('Terminal em Estado Somente Consulta.', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
  Close;
end;

end.
