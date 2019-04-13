{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DET_ESPECIFICO_MEDICAMENTO] 
                                                                                
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
unit NfeDetEspecificoMedicamentoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DET_ESPECIFICO_MEDICAMENTO')]
  TNfeDetEspecificoMedicamentoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FNUMERO_LOTE: String;
    FQUANTIDADE_LOTE: Extended;
    FDATA_FABRICACAO: TDateTime;
    FDATA_VALIDADE: TDateTime;
    FPRECO_MAXIMO_CONSUMIDOR: Extended;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('NUMERO_LOTE', 'Numero Lote', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroLote: String  read FNUMERO_LOTE write FNUMERO_LOTE;
    [TColumn('QUANTIDADE_LOTE', 'Quantidade Lote', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeLote: Extended  read FQUANTIDADE_LOTE write FQUANTIDADE_LOTE;
    [TColumn('DATA_FABRICACAO', 'Data Fabricacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFabricacao: TDateTime  read FDATA_FABRICACAO write FDATA_FABRICACAO;
    [TColumn('DATA_VALIDADE', 'Data Validade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataValidade: TDateTime  read FDATA_VALIDADE write FDATA_VALIDADE;
    [TColumn('PRECO_MAXIMO_CONSUMIDOR', 'Preco Maximo Consumidor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoMaximoConsumidor: Extended  read FPRECO_MAXIMO_CONSUMIDOR write FPRECO_MAXIMO_CONSUMIDOR;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetEspecificoMedicamentoVO);

finalization
  Classes.UnRegisterClass(TNfeDetEspecificoMedicamentoVO);

end.
