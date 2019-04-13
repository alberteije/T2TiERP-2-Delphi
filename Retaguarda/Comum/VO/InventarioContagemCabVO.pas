{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [INVENTARIO_CONTAGEM_CAB] 
                                                                                
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
unit InventarioContagemCabVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  InventarioContagemDetVO;

type
  [TEntity]
  [TTable('INVENTARIO_CONTAGEM_CAB')]
  TInventarioContagemCabVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FDATA_CONTAGEM: TDateTime;
    FESTOQUE_ATUALIZADO: String;
    FTIPO: String;

    //Transientes
    FListaInventarioContagemDetVO: TObjectList<TInventarioContagemDetVO>;



  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('DATA_CONTAGEM', 'Data Contagem', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataContagem: TDateTime  read FDATA_CONTAGEM write FDATA_CONTAGEM;
    [TColumn('ESTOQUE_ATUALIZADO', 'Estoque Atualizado', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property EstoqueAtualizado: String  read FESTOQUE_ATUALIZADO write FESTOQUE_ATUALIZADO;
    [TColumn('TIPO', 'Tipo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: String  read FTIPO write FTIPO;


    //Transientes
    [TManyValuedAssociation('ID_INVENTARIO_CONTAGEM_CAB', 'ID')]
    property ListaInventarioContagemDetVO: TObjectList<TInventarioContagemDetVO> read FListaInventarioContagemDetVO write FListaInventarioContagemDetVO;

  end;

implementation

constructor TInventarioContagemCabVO.Create;
begin
  inherited;

  FListaInventarioContagemDetVO := TObjectList<TInventarioContagemDetVO>.Create;
end;

destructor TInventarioContagemCabVO.Destroy;
begin
  FreeAndNil(FListaInventarioContagemDetVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TInventarioContagemCabVO);

finalization
  Classes.UnRegisterClass(TInventarioContagemCabVO);

end.
