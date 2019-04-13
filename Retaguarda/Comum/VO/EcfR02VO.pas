{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_R02] 
                                                                                
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
unit EcfR02VO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('ECF_R02')]
  TEcfR02VO = class(TVO)
  private
    FID: Integer;
    FNOME_CAIXA: String;
    FID_GERADO_CAIXA: Integer;
    FID_EMPRESA: Integer;
    FID_OPERADOR: Integer;
    FID_IMPRESSORA: Integer;
    FID_ECF_CAIXA: Integer;
    FSERIE_ECF: String;
    FCRZ: Integer;
    FCOO: Integer;
    FCRO: Integer;
    FDATA_MOVIMENTO: TDateTime;
    FDATA_EMISSAO: TDateTime;
    FHORA_EMISSAO: String;
    FVENDA_BRUTA: Extended;
    FGRANDE_TOTAL: Extended;
    FLOGSS: String;
    FDATA_SINCRONIZACAO: TDateTime;
    FHORA_SINCRONIZACAO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('NOME_CAIXA', 'Nome Caixa', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeCaixa: String  read FNOME_CAIXA write FNOME_CAIXA;
    [TColumn('ID_GERADO_CAIXA', 'Id Gerado Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdGeradoCaixa: Integer  read FID_GERADO_CAIXA write FID_GERADO_CAIXA;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('ID_OPERADOR', 'Id Operador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdOperador: Integer  read FID_OPERADOR write FID_OPERADOR;
    [TColumn('ID_IMPRESSORA', 'Id Impressora', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdImpressora: Integer  read FID_IMPRESSORA write FID_IMPRESSORA;
    [TColumn('ID_ECF_CAIXA', 'Id Ecf Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEcfCaixa: Integer  read FID_ECF_CAIXA write FID_ECF_CAIXA;
    [TColumn('SERIE_ECF', 'Serie Ecf', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property SerieEcf: String  read FSERIE_ECF write FSERIE_ECF;
    [TColumn('CRZ', 'Crz', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Crz: Integer  read FCRZ write FCRZ;
    [TColumn('COO', 'Coo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Coo: Integer  read FCOO write FCOO;
    [TColumn('CRO', 'Cro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cro: Integer  read FCRO write FCRO;
    [TColumn('DATA_MOVIMENTO', 'Data Movimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataMovimento: TDateTime  read FDATA_MOVIMENTO write FDATA_MOVIMENTO;
    [TColumn('DATA_EMISSAO', 'Data Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    [TColumn('HORA_EMISSAO', 'Hora Emissao', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraEmissao: String  read FHORA_EMISSAO write FHORA_EMISSAO;
    [TColumn('VENDA_BRUTA', 'Venda Bruta', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property VendaBruta: Extended  read FVENDA_BRUTA write FVENDA_BRUTA;
    [TColumn('GRANDE_TOTAL', 'Grande Total', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property GrandeTotal: Extended  read FGRANDE_TOTAL write FGRANDE_TOTAL;
    [TColumn('LOGSS', 'Logss', 256, [ldGrid, ldLookup, ldCombobox], False)]
    property Logss: String  read FLOGSS write FLOGSS;
    [TColumn('DATA_SINCRONIZACAO', 'Data Sincronizacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataSincronizacao: TDateTime  read FDATA_SINCRONIZACAO write FDATA_SINCRONIZACAO;
    [TColumn('HORA_SINCRONIZACAO', 'Hora Sincronizacao', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraSincronizacao: String  read FHORA_SINCRONIZACAO write FHORA_SINCRONIZACAO;

  end;

implementation


initialization
  Classes.RegisterClass(TEcfR02VO);

finalization
  Classes.UnRegisterClass(TEcfR02VO);

end.
