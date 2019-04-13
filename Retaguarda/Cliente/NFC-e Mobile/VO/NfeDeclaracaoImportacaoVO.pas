{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DECLARACAO_IMPORTACAO] 
                                                                                
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
unit NfeDeclaracaoImportacaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  NfeImportacaoDetalheVO;

type
  [TEntity]
  [TTable('NFE_DECLARACAO_IMPORTACAO')]
  TNfeDeclaracaoImportacaoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FNUMERO_DOCUMENTO: String;
    FDATA_REGISTRO: TDateTime;
    FLOCAL_DESEMBARACO: String;
    FUF_DESEMBARACO: String;
    FDATA_DESEMBARACO: TDateTime;
    FCODIGO_EXPORTADOR: String;
    FVIA_TRANSPORTE: Integer;
    FVALOR_AFRMM: Extended;
    FFORMA_INTERMEDIACAO: Integer;
    FCNPJ: String;
    FUF_TERCEIRO: String;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

    FListaNfeImportacaoDetalheVO: TObjectList<TNfeImportacaoDetalheVO>; //1:100

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('NUMERO_DOCUMENTO', 'Numero Documento', 96, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroDocumento: String  read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    [TColumn('DATA_REGISTRO', 'Data Registro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataRegistro: TDateTime  read FDATA_REGISTRO write FDATA_REGISTRO;
    [TColumn('LOCAL_DESEMBARACO', 'Local Desembaraco', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property LocalDesembaraco: String  read FLOCAL_DESEMBARACO write FLOCAL_DESEMBARACO;
    [TColumn('UF_DESEMBARACO', 'Uf Desembaraco', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfDesembaraco: String  read FUF_DESEMBARACO write FUF_DESEMBARACO;
    [TColumn('DATA_DESEMBARACO', 'Data Desembaraco', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataDesembaraco: TDateTime  read FDATA_DESEMBARACO write FDATA_DESEMBARACO;
    [TColumn('CODIGO_EXPORTADOR', 'Codigo Exportador', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoExportador: String  read FCODIGO_EXPORTADOR write FCODIGO_EXPORTADOR;
    [TColumn('VIA_TRANSPORTE', 'Via Transporte', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ViaTransporte: Integer  read FVIA_TRANSPORTE write FVIA_TRANSPORTE;
    [TColumn('VALOR_AFRMM', 'Valor Afrmm', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorAfrmm: Extended  read FVALOR_AFRMM write FVALOR_AFRMM;
    [TColumn('FORMA_INTERMEDIACAO', 'Forma Intermediacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FormaIntermediacao: Integer  read FFORMA_INTERMEDIACAO write FFORMA_INTERMEDIACAO;
    [TColumn('CNPJ', 'Cnpj', 112, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCnpj, taLeftJustify)]
    property Cnpj: String  read FCNPJ write FCNPJ;
    [TColumn('UF_TERCEIRO', 'Uf Terceiro', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfTerceiro: String  read FUF_TERCEIRO write FUF_TERCEIRO;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

    [TManyValuedAssociation('ID_NFE_DECLARACAO_IMPORTACAO', 'ID')]
    property ListaNfeImportacaoDetalheVO: TObjectList<TNfeImportacaoDetalheVO> read FListaNfeImportacaoDetalheVO write FListaNfeImportacaoDetalheVO;

  end;

implementation

constructor TNfeDeclaracaoImportacaoVO.Create;
begin
  inherited;
  FListaNfeImportacaoDetalheVO := TObjectList<TNfeImportacaoDetalheVO>.Create;
end;

destructor TNfeDeclaracaoImportacaoVO.Destroy;
begin
  FreeAndNil(FListaNfeImportacaoDetalheVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TNfeDeclaracaoImportacaoVO);

finalization
  Classes.UnRegisterClass(TNfeDeclaracaoImportacaoVO);

end.
