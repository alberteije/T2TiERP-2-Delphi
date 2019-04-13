{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_IMPRESSORA] 
                                                                                
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
unit EcfImpressoraVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('ECF_IMPRESSORA')]
  TEcfImpressoraVO = class(TVO)
  private
    FID: Integer;
    FNUMERO: Integer;
    FCODIGO: String;
    FSERIE: String;
    FIDENTIFICACAO: String;
    FMC: String;
    FMD: String;
    FVR: String;
    FTIPO: String;
    FMARCA: String;
    FMODELO: String;
    FMODELO_ACBR: String;
    FMODELO_DOCUMENTO_FISCAL: String;
    FVERSAO: String;
    FLE: String;
    FLEF: String;
    FMFD: String;
    FLACRE_NA_MFD: String;
    FDATA_INSTALACAO_SB: TDateTime;
    FHORA_INSTALACAO_SB: String;
    FDOCTO: String;
    FECF_IMPRESSORA: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('NUMERO', 'Numero', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Numero: Integer  read FNUMERO write FNUMERO;
    [TColumn('CODIGO', 'Codigo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('SERIE', 'Serie', 200, [ldGrid, ldLookup, ldCombobox], False)]
    property Serie: String  read FSERIE write FSERIE;
    [TColumn('IDENTIFICACAO', 'Identificacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Identificacao: String  read FIDENTIFICACAO write FIDENTIFICACAO;
    [TColumn('MC', 'Mc', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Mc: String  read FMC write FMC;
    [TColumn('MD', 'Md', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Md: String  read FMD write FMD;
    [TColumn('VR', 'Vr', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Vr: String  read FVR write FVR;
    [TColumn('TIPO', 'Tipo', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: String  read FTIPO write FTIPO;
    [TColumn('MARCA', 'Marca', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property Marca: String  read FMARCA write FMARCA;
    [TColumn('MODELO', 'Modelo', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property Modelo: String  read FMODELO write FMODELO;
    [TColumn('MODELO_ACBR', 'Modelo Acbr', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ModeloAcbr: String  read FMODELO_ACBR write FMODELO_ACBR;
    [TColumn('MODELO_DOCUMENTO_FISCAL', 'Modelo Documento Fiscal', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property ModeloDocumentoFiscal: String  read FMODELO_DOCUMENTO_FISCAL write FMODELO_DOCUMENTO_FISCAL;
    [TColumn('VERSAO', 'Versao', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property Versao: String  read FVERSAO write FVERSAO;
    [TColumn('LE', 'Le', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Le: String  read FLE write FLE;
    [TColumn('LEF', 'Lef', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Lef: String  read FLEF write FLEF;
    [TColumn('MFD', 'Mfd', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Mfd: String  read FMFD write FMFD;
    [TColumn('LACRE_NA_MFD', 'Lacre Na Mfd', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property LacreNaMfd: String  read FLACRE_NA_MFD write FLACRE_NA_MFD;
    [TColumn('DATA_INSTALACAO_SB', 'Data Instalacao Sb', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInstalacaoSb: TDateTime  read FDATA_INSTALACAO_SB write FDATA_INSTALACAO_SB;
    [TColumn('HORA_INSTALACAO_SB', 'Hora Instalacao Sb', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraInstalacaoSb: String  read FHORA_INSTALACAO_SB write FHORA_INSTALACAO_SB;
    [TColumn('DOCTO', 'Docto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Docto: String  read FDOCTO write FDOCTO;
    [TColumn('ECF_IMPRESSORA', 'Ecf Impressora', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property EcfImpressora: String  read FECF_IMPRESSORA write FECF_IMPRESSORA;

  end;

implementation


initialization
  Classes.RegisterClass(TEcfImpressoraVO);

finalization
  Classes.UnRegisterClass(TEcfImpressoraVO);

end.
