{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [GED_DOCUMENTO_DETALHE] 
                                                                                
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
unit GedDocumentoDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  GedVersaoDocumentoVO;

type
  [TEntity]
  [TTable('GED_DOCUMENTO_DETALHE')]
  TGedDocumentoDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_GED_DOCUMENTO_CABECALHO: Integer;
    FID_EMPRESA: Integer;
    FID_GED_TIPO_DOCUMENTO: Integer;
    FNOME: String;
    FDESCRICAO: String;
    FPALAVRA_CHAVE: String;
    FPODE_EXCLUIR: String;
    FPODE_ALTERAR: String;
    FASSINADO: String;
    FDATA_FIM_VIGENCIA: TDateTime;
    FDATA_EXCLUSAO: TDateTime;

    //Transientes
    FListaGedVersaoDocumentoVO: TObjectList<TGedVersaoDocumentoVO>;



  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_GED_DOCUMENTO_CABECALHO', 'Id Ged Documento Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdGedDocumentoCabecalho: Integer  read FID_GED_DOCUMENTO_CABECALHO write FID_GED_DOCUMENTO_CABECALHO;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('ID_GED_TIPO_DOCUMENTO', 'Id Ged Tipo Documento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdGedTipoDocumento: Integer  read FID_GED_TIPO_DOCUMENTO write FID_GED_TIPO_DOCUMENTO;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('PALAVRA_CHAVE', 'Palavra Chave', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property PalavraChave: String  read FPALAVRA_CHAVE write FPALAVRA_CHAVE;
    [TColumn('PODE_EXCLUIR', 'Pode Excluir', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property PodeExcluir: String  read FPODE_EXCLUIR write FPODE_EXCLUIR;
    [TColumn('PODE_ALTERAR', 'Pode Alterar', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property PodeAlterar: String  read FPODE_ALTERAR write FPODE_ALTERAR;
    [TColumn('ASSINADO', 'Assinado', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Assinado: String  read FASSINADO write FASSINADO;
    [TColumn('DATA_FIM_VIGENCIA', 'Data Fim Vigencia', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFimVigencia: TDateTime  read FDATA_FIM_VIGENCIA write FDATA_FIM_VIGENCIA;
    [TColumn('DATA_EXCLUSAO', 'Data Exclusao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataExclusao: TDateTime  read FDATA_EXCLUSAO write FDATA_EXCLUSAO;


    //Transientes
    [TManyValuedAssociation('ID_GED_DOCUMENTO', 'ID')]
    property ListaGedVersaoDocumentoVO: TObjectList<TGedVersaoDocumentoVO> read FListaGedVersaoDocumentoVO write FListaGedVersaoDocumentoVO;


  end;

implementation

constructor TGedDocumentoDetalheVO.Create;
begin
  inherited;

  FListaGedVersaoDocumentoVO := TObjectList<TGedVersaoDocumentoVO>.Create;
end;

destructor TGedDocumentoDetalheVO.Destroy;
begin
  FreeAndNil(FListaGedVersaoDocumentoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TGedDocumentoDetalheVO);

finalization
  Classes.UnRegisterClass(TGedDocumentoDetalheVO);

end.
