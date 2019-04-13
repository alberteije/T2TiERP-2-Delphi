{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [SIMPLES_NACIONAL_DETALHE] 
                                                                                
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
unit SimplesNacionalDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('SIMPLES_NACIONAL_DETALHE')]
  TSimplesNacionalDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_SIMPLES_NACIONAL_CABECALHO: Integer;
    FFAIXA: Integer;
    FVALOR_INICIAL: Extended;
    FVALOR_FINAL: Extended;
    FALIQUOTA: Extended;
    FIRPJ: Extended;
    FCSLL: Extended;
    FCOFINS: Extended;
    FPIS_PASEP: Extended;
    FCPP: Extended;
    FICMS: Extended;
    FIPI: Extended;
    FISS: Extended;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_SIMPLES_NACIONAL_CABECALHO', 'Id Simples Nacional Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSimplesNacionalCabecalho: Integer  read FID_SIMPLES_NACIONAL_CABECALHO write FID_SIMPLES_NACIONAL_CABECALHO;
    [TColumn('FAIXA', 'Faixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Faixa: Integer  read FFAIXA write FFAIXA;
    [TColumn('VALOR_INICIAL', 'Valor Inicial', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorInicial: Extended  read FVALOR_INICIAL write FVALOR_INICIAL;
    [TColumn('VALOR_FINAL', 'Valor Final', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFinal: Extended  read FVALOR_FINAL write FVALOR_FINAL;
    [TColumn('ALIQUOTA', 'Aliquota', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Aliquota: Extended  read FALIQUOTA write FALIQUOTA;
    [TColumn('IRPJ', 'Irpj', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Irpj: Extended  read FIRPJ write FIRPJ;
    [TColumn('CSLL', 'Csll', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Csll: Extended  read FCSLL write FCSLL;
    [TColumn('COFINS', 'Cofins', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Cofins: Extended  read FCOFINS write FCOFINS;
    [TColumn('PIS_PASEP', 'Pis Pasep', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PisPasep: Extended  read FPIS_PASEP write FPIS_PASEP;
    [TColumn('CPP', 'Cpp', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Cpp: Extended  read FCPP write FCPP;
    [TColumn('ICMS', 'Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Icms: Extended  read FICMS write FICMS;
    [TColumn('IPI', 'Ipi', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Ipi: Extended  read FIPI write FIPI;
    [TColumn('ISS', 'Iss', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Iss: Extended  read FISS write FISS;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TSimplesNacionalDetalheVO);

finalization
  Classes.UnRegisterClass(TSimplesNacionalDetalheVO);

end.
