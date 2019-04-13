{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [GED_DOCUMENTO_CABECALHO] 
                                                                                
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
unit GedDocumentoCabecalhoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  GedDocumentoDetalheVO;

type
  [TEntity]
  [TTable('GED_DOCUMENTO_CABECALHO')]
  TGedDocumentoCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FNOME: String;
    FDESCRICAO: String;
    FDATA_INCLUSAO: TDateTime;

    //Transientes
    FListaGedDocumentoDetalheVO: TObjectList<TGedDocumentoDetalheVO>;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('DATA_INCLUSAO', 'Data Inclusao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInclusao: TDateTime  read FDATA_INCLUSAO write FDATA_INCLUSAO;


    //Transientes
    [TManyValuedAssociation('ID_GED_DOCUMENTO_CABECALHO', 'ID')]
    property ListaGedDocumentoDetalheVO: TObjectList<TGedDocumentoDetalheVO> read FListaGedDocumentoDetalheVO write FListaGedDocumentoDetalheVO;


  end;

implementation

constructor TGedDocumentoCabecalhoVO.Create;
begin
  inherited;

  FListaGedDocumentoDetalheVO := TObjectList<TGedDocumentoDetalheVO>.Create;
end;

destructor TGedDocumentoCabecalhoVO.Destroy;
begin
  FreeAndNil(FListaGedDocumentoDetalheVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TGedDocumentoCabecalhoVO);

finalization
  Classes.UnRegisterClass(TGedDocumentoCabecalhoVO);

end.
