{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_TOTAL_PAGAMENTO_DATA] 
                                                                                
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
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 1.0                                                                    
*******************************************************************************}
unit ViewTotalPagamentoDataVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_TOTAL_PAGAMENTO_DATA')]
  TViewTotalPagamentoDataVO = class(TVO)
  private
    FID: Integer;
    FID_TIPO_PAGAMENTO: Integer;
    FDATA_VENDA: TDateTime;
    FDESCRICAO: String;
    FVALOR_APURADO: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_TIPO_PAGAMENTO', 'Id Tipo Pagamento', 80, [], False)]
    property IdTipoPagamento: Integer  read FID_TIPO_PAGAMENTO write FID_TIPO_PAGAMENTO;
    [TColumn('DATA_VENDA', 'Data Venda', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataVenda: TDateTime  read FDATA_VENDA write FDATA_VENDA;
    [TColumn('DESCRICAO', 'Descricao', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('VALOR_APURADO', 'Valor Apurado', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorApurado: Extended  read FVALOR_APURADO write FVALOR_APURADO;

  end;

implementation

initialization
  Classes.RegisterClass(TViewTotalPagamentoDataVO);

finalization
  Classes.UnRegisterClass(TViewTotalPagamentoDataVO);


end.
