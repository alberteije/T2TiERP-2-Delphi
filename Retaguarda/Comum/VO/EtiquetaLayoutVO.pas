{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ETIQUETA_LAYOUT] 
                                                                                
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
unit EtiquetaLayoutVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('ETIQUETA_LAYOUT')]
  TEtiquetaLayoutVO = class(TVO)
  private
    FID: Integer;
    FID_FORMATO_PAPEL: Integer;
    FCODIGO_FABRICANTE: String;
    FQUANTIDADE: Integer;
    FQUANTIDADE_HORIZONTAL: Integer;
    FQUANTIDADE_VERTICAL: Integer;
    FMARGEM_SUPERIOR: Integer;
    FMARGEM_INFERIOR: Integer;
    FMARGEM_ESQUERDA: Integer;
    FMARGEM_DIREITA: Integer;
    FESPACAMENTO_HORIZONTAL: Integer;
    FESPACAMENTO_VERTICAL: Integer;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_FORMATO_PAPEL', 'Id Formato Papel', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFormatoPapel: Integer  read FID_FORMATO_PAPEL write FID_FORMATO_PAPEL;
    [TColumn('CODIGO_FABRICANTE', 'Codigo Fabricante', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoFabricante: String  read FCODIGO_FABRICANTE write FCODIGO_FABRICANTE;
    [TColumn('QUANTIDADE', 'Quantidade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Quantidade: Integer  read FQUANTIDADE write FQUANTIDADE;
    [TColumn('QUANTIDADE_HORIZONTAL', 'Quantidade Horizontal', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeHorizontal: Integer  read FQUANTIDADE_HORIZONTAL write FQUANTIDADE_HORIZONTAL;
    [TColumn('QUANTIDADE_VERTICAL', 'Quantidade Vertical', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeVertical: Integer  read FQUANTIDADE_VERTICAL write FQUANTIDADE_VERTICAL;
    [TColumn('MARGEM_SUPERIOR', 'Margem Superior', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MargemSuperior: Integer  read FMARGEM_SUPERIOR write FMARGEM_SUPERIOR;
    [TColumn('MARGEM_INFERIOR', 'Margem Inferior', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MargemInferior: Integer  read FMARGEM_INFERIOR write FMARGEM_INFERIOR;
    [TColumn('MARGEM_ESQUERDA', 'Margem Esquerda', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MargemEsquerda: Integer  read FMARGEM_ESQUERDA write FMARGEM_ESQUERDA;
    [TColumn('MARGEM_DIREITA', 'Margem Direita', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MargemDireita: Integer  read FMARGEM_DIREITA write FMARGEM_DIREITA;
    [TColumn('ESPACAMENTO_HORIZONTAL', 'Espacamento Horizontal', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property EspacamentoHorizontal: Integer  read FESPACAMENTO_HORIZONTAL write FESPACAMENTO_HORIZONTAL;
    [TColumn('ESPACAMENTO_VERTICAL', 'Espacamento Vertical', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property EspacamentoVertical: Integer  read FESPACAMENTO_VERTICAL write FESPACAMENTO_VERTICAL;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TEtiquetaLayoutVO);

finalization
  Classes.UnRegisterClass(TEtiquetaLayoutVO);

end.
