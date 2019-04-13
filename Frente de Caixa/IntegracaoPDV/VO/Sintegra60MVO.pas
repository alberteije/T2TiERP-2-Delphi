{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [SINTEGRA_60M] 
                                                                                
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
unit Sintegra60mVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  Sintegra60aVO;

type
  [TEntity]
  [TTable('ECF_SINTEGRA_60M')]
  TSintegra60mVO = class(TVO)
  private
    FID: Integer;
    FDATA_EMISSAO: TDateTime;
    FNUMERO_SERIE_ECF: String;
    FNUMERO_EQUIPAMENTO: Integer;
    FMODELO_DOCUMENTO_FISCAL: String;
    FCOO_INICIAL: Integer;
    FCOO_FINAL: Integer;
    FCRZ: Integer;
    FCRO: Integer;
    FVALOR_VENDA_BRUTA: Extended;
    FVALOR_GRANDE_TOTAL: Extended;

    FNOME_CAIXA: String;
    FID_GERADO_CAIXA: Integer;
    FDATA_SINCRONIZACAO: TDateTime;
    FHORA_SINCRONIZACAO: String;

    FListaSintegra60aVO: TObjectList<TSintegra60aVO>;

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('DATA_EMISSAO', 'Data Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    [TColumn('NUMERO_SERIE_ECF', 'Numero Serie Ecf', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroSerieEcf: String  read FNUMERO_SERIE_ECF write FNUMERO_SERIE_ECF;
    [TColumn('NUMERO_EQUIPAMENTO', 'Numero Equipamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroEquipamento: Integer  read FNUMERO_EQUIPAMENTO write FNUMERO_EQUIPAMENTO;
    [TColumn('MODELO_DOCUMENTO_FISCAL', 'Modelo Documento Fiscal', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property ModeloDocumentoFiscal: String  read FMODELO_DOCUMENTO_FISCAL write FMODELO_DOCUMENTO_FISCAL;
    [TColumn('COO_INICIAL', 'Coo Inicial', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CooInicial: Integer  read FCOO_INICIAL write FCOO_INICIAL;
    [TColumn('COO_FINAL', 'Coo Final', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CooFinal: Integer  read FCOO_FINAL write FCOO_FINAL;
    [TColumn('CRZ', 'Crz', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Crz: Integer  read FCRZ write FCRZ;
    [TColumn('CRO', 'Cro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cro: Integer  read FCRO write FCRO;
    [TColumn('VALOR_VENDA_BRUTA', 'Valor Venda Bruta', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorVendaBruta: Extended  read FVALOR_VENDA_BRUTA write FVALOR_VENDA_BRUTA;
    [TColumn('VALOR_GRANDE_TOTAL', 'Valor Grande Total', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorGrandeTotal: Extended  read FVALOR_GRANDE_TOTAL write FVALOR_GRANDE_TOTAL;

    [TColumn('NOME_CAIXA', 'Nome Caixa', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeCaixa: String  read FNOME_CAIXA write FNOME_CAIXA;
    [TColumn('ID_GERADO_CAIXA', 'Id Gerado Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property IdGeradoCaixa: Integer  read FID_GERADO_CAIXA write FID_GERADO_CAIXA;
    [TColumn('DATA_SINCRONIZACAO', 'Data Sinronizacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataSincronizacao: TDateTime  read FDATA_SINCRONIZACAO write FDATA_SINCRONIZACAO;
    [TColumn('HORA_SINCRONIZACAO', 'Hora Sincronizacao', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraSincronizacao: String  read FHORA_SINCRONIZACAO write FHORA_SINCRONIZACAO;

    [TManyValuedAssociation('ID_SINTEGRA_60M', 'ID')]
    property ListaSintegra60aVO: TObjectList<TSintegra60aVO> read FListaSintegra60aVO write FListaSintegra60aVO;

  end;

implementation

constructor TSintegra60mVO.Create;
begin
  inherited;

  FListaSintegra60aVO := TObjectList<TSintegra60aVO>.Create;
end;

destructor TSintegra60mVO.Destroy;
begin
  FreeAndNil(FListaSintegra60aVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TSintegra60mVO);

finalization
  Classes.UnRegisterClass(TSintegra60mVO);

end.
