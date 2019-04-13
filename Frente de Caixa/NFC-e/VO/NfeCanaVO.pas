{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_CANA] 
                                                                                
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
unit NfeCanaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,

  NfeCanaFornecimentoDiarioVO, NfeCanaDeducoesSafraVO;

type
  [TEntity]
  [TTable('NFE_CANA')]
  TNfeCanaVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FSAFRA: String;
    FMES_ANO_REFERENCIA: String;

    // Grupo ZC
    FListaNfeCanaFornecimentoDiarioVO: TObjectList<TNfeCanaFornecimentoDiarioVO>; //1:31
    FListaNfeCanaDeducoesSafraVO: TObjectList<TNfeCanaDeducoesSafraVO>; //0:10

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('SAFRA', 'Safra', 72, [ldGrid, ldLookup, ldCombobox], False)]
    property Safra: String  read FSAFRA write FSAFRA;
    [TColumn('MES_ANO_REFERENCIA', 'Mes Ano Referencia', 72, [ldGrid, ldLookup, ldCombobox], False)]
    property MesAnoReferencia: String  read FMES_ANO_REFERENCIA write FMES_ANO_REFERENCIA;

    [TManyValuedAssociation('ID_NFE_CANA','ID')]
    property ListaNfeCanaFornecimentoDiarioVO: TObjectList<TNfeCanaFornecimentoDiarioVO> read FListaNfeCanaFornecimentoDiarioVO write FListaNfeCanaFornecimentoDiarioVO;

    [TManyValuedAssociation('ID_NFE_CANA','ID')]
    property ListaNfeCanaDeducoesSafraVO: TObjectList<TNfeCanaDeducoesSafraVO> read FListaNfeCanaDeducoesSafraVO write FListaNfeCanaDeducoesSafraVO;

  end;

implementation

constructor TNfeCanaVO.Create;
begin
  inherited;
  FListaNfeCanaFornecimentoDiarioVO := TObjectList<TNfeCanaFornecimentoDiarioVO>.Create;
  FListaNfeCanaDeducoesSafraVO := TObjectList<TNfeCanaDeducoesSafraVO>.Create;
end;

destructor TNfeCanaVO.Destroy;
begin
  FreeAndNil(FListaNfeCanaFornecimentoDiarioVO);
  FreeAndNil(FListaNfeCanaDeducoesSafraVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TNfeCanaVO);

finalization
  Classes.UnRegisterClass(TNfeCanaVO);

end.
