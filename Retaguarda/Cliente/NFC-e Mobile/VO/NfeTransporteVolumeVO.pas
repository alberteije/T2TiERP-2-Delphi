{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_TRANSPORTE_VOLUME] 
                                                                                
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
unit NfeTransporteVolumeVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,

  NfeTransporteVolumeLacreVO;

type
  [TEntity]
  [TTable('NFE_TRANSPORTE_VOLUME')]
  TNfeTransporteVolumeVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_TRANSPORTE: Integer;
    FQUANTIDADE: Integer;
    FESPECIE: String;
    FMARCA: String;
    FNUMERACAO: String;
    FPESO_LIQUIDO: Extended;
    FPESO_BRUTO: Extended;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

    // Grupo X - X33
    FListaNfeTransporteVolumeLacreVO: TObjectList<TNfeTransporteVolumeLacreVO>; //0:5000

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_TRANSPORTE', 'Id Nfe Transporte', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeTransporte: Integer  read FID_NFE_TRANSPORTE write FID_NFE_TRANSPORTE;
    [TColumn('QUANTIDADE', 'Quantidade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Quantidade: Integer  read FQUANTIDADE write FQUANTIDADE;
    [TColumn('ESPECIE', 'Especie', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Especie: String  read FESPECIE write FESPECIE;
    [TColumn('MARCA', 'Marca', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Marca: String  read FMARCA write FMARCA;
    [TColumn('NUMERACAO', 'Numeracao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Numeracao: String  read FNUMERACAO write FNUMERACAO;
    [TColumn('PESO_LIQUIDO', 'Peso Liquido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PesoLiquido: Extended  read FPESO_LIQUIDO write FPESO_LIQUIDO;
    [TColumn('PESO_BRUTO', 'Peso Bruto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PesoBruto: Extended  read FPESO_BRUTO write FPESO_BRUTO;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

    [TManyValuedAssociation('ID_NFE_TRANSPORTE_VOLUME','ID')]
    property ListaNfeTransporteVolumeLacreVO: TObjectList<TNfeTransporteVolumeLacreVO> read FListaNfeTransporteVolumeLacreVO write FListaNfeTransporteVolumeLacreVO;

  end;

implementation

constructor TNfeTransporteVolumeVO.Create;
begin
  inherited;
  FListaNfeTransporteVolumeLacreVO := TObjectList<TNfeTransporteVolumeLacreVO>.Create;
end;

destructor TNfeTransporteVolumeVO.Destroy;
begin
  FreeAndNil(FListaNfeTransporteVolumeLacreVO);
  inherited;
end;


initialization
  Classes.RegisterClass(TNfeTransporteVolumeVO);

finalization
  Classes.UnRegisterClass(TNfeTransporteVolumeVO);

end.
