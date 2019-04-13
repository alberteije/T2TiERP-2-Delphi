{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COMISSAO_OBJETIVO] 
                                                                                
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
unit ComissaoObjetivoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('COMISSAO_OBJETIVO')]
  TComissaoObjetivoVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_COMISSAO_PERFIL: Integer;
    FCODIGO: String;
    FNOME: String;
    FDESCRICAO: String;
    FFORMA_PAGAMENTO: String;
    FTAXA_PAGAMENTO: Extended;
    FVALOR_PAGAMENTO: Extended;
    FVALOR_META: Extended;
    FQUANTIDADE: Extended;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PRODUTO', 'Id Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    [TColumn('ID_COMISSAO_PERFIL', 'Id Comissao Perfil', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdComissaoPerfil: Integer  read FID_COMISSAO_PERFIL write FID_COMISSAO_PERFIL;
    [TColumn('CODIGO', 'Codigo', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('FORMA_PAGAMENTO', 'Forma Pagamento', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FormaPagamento: String  read FFORMA_PAGAMENTO write FFORMA_PAGAMENTO;
    [TColumn('TAXA_PAGAMENTO', 'Taxa Pagamento', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaPagamento: Extended  read FTAXA_PAGAMENTO write FTAXA_PAGAMENTO;
    [TColumn('VALOR_PAGAMENTO', 'Valor Pagamento', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPagamento: Extended  read FVALOR_PAGAMENTO write FVALOR_PAGAMENTO;
    [TColumn('VALOR_META', 'Valor Meta', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorMeta: Extended  read FVALOR_META write FVALOR_META;
    [TColumn('QUANTIDADE', 'Quantidade', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TComissaoObjetivoVO);

finalization
  Classes.UnRegisterClass(TComissaoObjetivoVO);

end.
