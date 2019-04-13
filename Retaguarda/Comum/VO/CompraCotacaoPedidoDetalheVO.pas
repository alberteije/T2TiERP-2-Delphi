{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COMPRA_COTACAO_PEDIDO_DETALHE] 
                                                                                
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
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit CompraCotacaoPedidoDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('COMPRA_COTACAO_PEDIDO_DETALHE')]
  TCompraCotacaoPedidoDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_COMPRA_PEDIDO: Integer;
    FID_COMPRA_COTACAO_DETALHE: Integer;
    FQUANTIDADE_PEDIDA: Extended;

    //Transientes



  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_COMPRA_PEDIDO', 'Id Compra Pedido', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCompraPedido: Integer  read FID_COMPRA_PEDIDO write FID_COMPRA_PEDIDO;
    [TColumn('ID_COMPRA_COTACAO_DETALHE', 'Id Compra Cotacao Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCompraCotacaoDetalhe: Integer  read FID_COMPRA_COTACAO_DETALHE write FID_COMPRA_COTACAO_DETALHE;
    [TColumn('QUANTIDADE_PEDIDA', 'Quantidade Pedida', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadePedida: Extended  read FQUANTIDADE_PEDIDA write FQUANTIDADE_PEDIDA;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TCompraCotacaoPedidoDetalheVO);

finalization
  Classes.UnRegisterClass(TCompraCotacaoPedidoDetalheVO);

end.
