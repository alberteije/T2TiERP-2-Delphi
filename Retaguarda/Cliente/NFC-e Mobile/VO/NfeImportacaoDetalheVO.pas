{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_IMPORTACAO_DETALHE] 
                                                                                
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
unit NfeImportacaoDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_IMPORTACAO_DETALHE')]
  TNfeImportacaoDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DECLARACAO_IMPORTACAO: Integer;
    FNUMERO_ADICAO: Integer;
    FNUMERO_SEQUENCIAL: Integer;
    FCODIGO_FABRICANTE_ESTRANGEIRO: String;
    FVALOR_DESCONTO: Extended;
    FDRAWBACK: Integer;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DECLARACAO_IMPORTACAO', 'Id Nfe Declaracao Importacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDeclaracaoImportacao: Integer  read FID_NFE_DECLARACAO_IMPORTACAO write FID_NFE_DECLARACAO_IMPORTACAO;
    [TColumn('NUMERO_ADICAO', 'Numero Adicao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroAdicao: Integer  read FNUMERO_ADICAO write FNUMERO_ADICAO;
    [TColumn('NUMERO_SEQUENCIAL', 'Numero Sequencial', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroSequencial: Integer  read FNUMERO_SEQUENCIAL write FNUMERO_SEQUENCIAL;
    [TColumn('CODIGO_FABRICANTE_ESTRANGEIRO', 'Codigo Fabricante Estrangeiro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoFabricanteEstrangeiro: String  read FCODIGO_FABRICANTE_ESTRANGEIRO write FCODIGO_FABRICANTE_ESTRANGEIRO;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('DRAWBACK', 'Drawback', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Drawback: Integer  read FDRAWBACK write FDRAWBACK;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeImportacaoDetalheVO);

finalization
  Classes.UnRegisterClass(TNfeImportacaoDetalheVO);

end.
