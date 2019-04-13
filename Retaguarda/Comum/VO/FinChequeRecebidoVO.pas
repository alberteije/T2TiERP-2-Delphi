{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_CHEQUE_RECEBIDO] 
                                                                                
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
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit FinChequeRecebidoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB, ContaCaixaVO;

type
  [TEntity]
  [TTable('FIN_CHEQUE_RECEBIDO')]
  TFinChequeRecebidoVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FID_PESSOA: Integer;
    FCPF_CNPJ: String;
    FNOME: String;
    FCODIGO_BANCO: String;
    FCODIGO_AGENCIA: String;
    FCONTA: String;
    FNUMERO: Integer;
    FDATA_EMISSAO: TDateTime;
    FBOM_PARA: TDateTime;
    FDATA_COMPENSACAO: TDateTime;
    FVALOR: Extended;
    FCUSTODIA_DATA: TDateTime;
    FCUSTODIA_TARIFA: Extended;
    FCUSTODIA_COMISSAO: Extended;
    FDESCONTO_DATA: TDateTime;
    FDESCONTO_TARIFA: Extended;
    FDESCONTO_COMISSAO: Extended;
    FVALOR_RECEBIDO: Extended;

    //Transientes
    FContaCaixaNome: String;

    FContaCaixaVO: TContaCaixaVO;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_CONTA_CAIXA', 'Id Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    [TColumnDisplay('CONTA_CAIXA.NOME', 'Conta Caixa Nome', 100, [ldGrid, ldLookup], ftString, 'ContaCaixaVO.TContaCaixaVO', True)]
    property ContaCaixaNome: String read FContaCaixaNome write FContaCaixaNome;

    [TColumn('ID_PESSOA', 'Id Pessoa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('CPF_CNPJ', 'Cpf Cnpj', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property CpfCnpj: String  read FCPF_CNPJ write FCPF_CNPJ;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('CODIGO_BANCO', 'Codigo Banco', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoBanco: String  read FCODIGO_BANCO write FCODIGO_BANCO;
    [TColumn('CODIGO_AGENCIA', 'Codigo Agencia', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoAgencia: String  read FCODIGO_AGENCIA write FCODIGO_AGENCIA;
    [TColumn('CONTA', 'Conta', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Conta: String  read FCONTA write FCONTA;
    [TColumn('NUMERO', 'Numero', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Numero: Integer  read FNUMERO write FNUMERO;
    [TColumn('DATA_EMISSAO', 'Data Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    [TColumn('BOM_PARA', 'Bom Para', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property BomPara: TDateTime  read FBOM_PARA write FBOM_PARA;
    [TColumn('DATA_COMPENSACAO', 'Data Compensacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCompensacao: TDateTime  read FDATA_COMPENSACAO write FDATA_COMPENSACAO;
    [TColumn('VALOR', 'Valor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;
    [TColumn('CUSTODIA_DATA', 'Custodia Data', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property CustodiaData: TDateTime  read FCUSTODIA_DATA write FCUSTODIA_DATA;
    [TColumn('CUSTODIA_TARIFA', 'Custodia Tarifa', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustodiaTarifa: Extended  read FCUSTODIA_TARIFA write FCUSTODIA_TARIFA;
    [TColumn('CUSTODIA_COMISSAO', 'Custodia Comissao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustodiaComissao: Extended  read FCUSTODIA_COMISSAO write FCUSTODIA_COMISSAO;
    [TColumn('DESCONTO_DATA', 'Desconto Data', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DescontoData: TDateTime  read FDESCONTO_DATA write FDESCONTO_DATA;
    [TColumn('DESCONTO_TARIFA', 'Desconto Tarifa', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property DescontoTarifa: Extended  read FDESCONTO_TARIFA write FDESCONTO_TARIFA;
    [TColumn('DESCONTO_COMISSAO', 'Desconto Comissao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property DescontoComissao: Extended  read FDESCONTO_COMISSAO write FDESCONTO_COMISSAO;
    [TColumn('VALOR_RECEBIDO', 'Valor Recebido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRecebido: Extended  read FVALOR_RECEBIDO write FVALOR_RECEBIDO;


    //Transientes
    [TAssociation('ID', 'ID_CONTA_CAIXA')]
    property ContaCaixaVO: TContaCaixaVO read FContaCaixaVO write FContaCaixaVO;


  end;

implementation

constructor TFinChequeRecebidoVO.Create;
begin
  inherited;

  FContaCaixaVO := TContaCaixaVO.Create;
end;

destructor TFinChequeRecebidoVO.Destroy;
begin
  FreeAndNil(FContaCaixaVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TFinChequeRecebidoVO);

finalization
  Classes.UnRegisterClass(TFinChequeRecebidoVO);

end.
