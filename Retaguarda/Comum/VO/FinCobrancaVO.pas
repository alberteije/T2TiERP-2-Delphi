{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_COBRANCA] 
                                                                                
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
unit FinCobrancaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaClienteVO, FinCobrancaParcelaReceberVO;

type
  [TEntity]
  [TTable('FIN_COBRANCA')]
  TFinCobrancaVO = class(TVO)
  private
    FID: Integer;
    FID_CLIENTE: Integer;
    FDATA_CONTATO: TDateTime;
    FHORA_CONTATO: String;
    FTELEFONE_CONTATO: String;
    FDATA_ACERTO_PAGAMENTO: TDateTime;
    FTOTAL_RECEBER_NA_DATA: Extended;

    //Transientes
    FClienteNome: String;

    FClienteVO: TViewPessoaClienteVO;

    FListaCobrancaParcelaReceberVO: TObjectList<TFinCobrancaParcelaReceberVO>;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_CLIENTE', 'Id Cliente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    [TColumnDisplay('CLIENTE.NOME', 'Nome Cliente', 150, [ldGrid, ldLookup], ftString, 'ViewPessoaClienteVO.TViewPessoaClienteVO', True)]
    property ClienteNome: String read FClienteNome write FClienteNome;

    [TColumn('DATA_CONTATO', 'Data Contato', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataContato: TDateTime  read FDATA_CONTATO write FDATA_CONTATO;
    [TColumn('HORA_CONTATO', 'Hora Contato', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraContato: String  read FHORA_CONTATO write FHORA_CONTATO;
    [TColumn('TELEFONE_CONTATO', 'Telefone Contato', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property TelefoneContato: String  read FTELEFONE_CONTATO write FTELEFONE_CONTATO;
    [TColumn('DATA_ACERTO_PAGAMENTO', 'Data Acerto Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataAcertoPagamento: TDateTime  read FDATA_ACERTO_PAGAMENTO write FDATA_ACERTO_PAGAMENTO;
    [TColumn('TOTAL_RECEBER_NA_DATA', 'Total Receber Na Data', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalReceberNaData: Extended  read FTOTAL_RECEBER_NA_DATA write FTOTAL_RECEBER_NA_DATA;


    //Transientes
    [TAssociation('ID', 'ID_CLIENTE')]
    property ClienteVO: TViewPessoaClienteVO read FClienteVO write FClienteVO;

    [TManyValuedAssociation('ID_FIN_COBRANCA', 'ID')]
    property ListaCobrancaParcelaReceberVO: TObjectList<TFinCobrancaParcelaReceberVO> read FListaCobrancaParcelaReceberVO write FListaCobrancaParcelaReceberVO;


  end;

implementation

constructor TFinCobrancaVO.Create;
begin
  inherited;

  FClienteVO := TViewPessoaClienteVO.Create;

  FListaCobrancaParcelaReceberVO := TObjectList<TFinCobrancaParcelaReceberVO>.Create;
end;

destructor TFinCobrancaVO.Destroy;
begin
  FreeAndNil(FClienteVO);

  FreeAndNil(FListaCobrancaParcelaReceberVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TFinCobrancaVO);

finalization
  Classes.UnRegisterClass(TFinCobrancaVO);

end.
