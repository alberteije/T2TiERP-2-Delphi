{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COMPRA_REQ_COTACAO_DETALHE] 
                                                                                
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
unit CompraReqCotacaoDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('COMPRA_REQ_COTACAO_DETALHE')]
  TCompraReqCotacaoDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_COMPRA_COTACAO: Integer;
    FID_COMPRA_REQUISICAO_DETALHE: Integer;
    FQUANTIDADE_COTADA: Extended;

    //Transientes



  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_COMPRA_COTACAO', 'Id Compra Cotacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCompraCotacao: Integer  read FID_COMPRA_COTACAO write FID_COMPRA_COTACAO;
    [TColumn('ID_COMPRA_REQUISICAO_DETALHE', 'Id Compra Requisicao Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCompraRequisicaoDetalhe: Integer  read FID_COMPRA_REQUISICAO_DETALHE write FID_COMPRA_REQUISICAO_DETALHE;
    [TColumn('QUANTIDADE_COTADA', 'Quantidade Cotada', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeCotada: Extended  read FQUANTIDADE_COTADA write FQUANTIDADE_COTADA;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TCompraReqCotacaoDetalheVO);

finalization
  Classes.UnRegisterClass(TCompraReqCotacaoDetalheVO);

end.
