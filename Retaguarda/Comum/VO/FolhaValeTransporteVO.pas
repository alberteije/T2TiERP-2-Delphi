{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_VALE_TRANSPORTE] 
                                                                                
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
unit FolhaValeTransporteVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaColaboradorVO, EmpresaTransporteItinerarioVO;

type
  [TEntity]
  [TTable('FOLHA_VALE_TRANSPORTE')]
  TFolhaValeTransporteVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA_TRANSP_ITIN: Integer;
    FID_COLABORADOR: Integer;
    FQUANTIDADE: Integer;

    //Transientes
    FColaboradorNome: String;
    FEmpresaTransporteItinerarioNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;
    FEmpresaTransporteItinerarioVO: TEmpresaTransporteItinerarioVO;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_EMPRESA_TRANSP_ITIN', 'Id Empresa Transp Itin', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresaTranspItin: Integer  read FID_EMPRESA_TRANSP_ITIN write FID_EMPRESA_TRANSP_ITIN;
    [TColumnDisplay('EMPRESA_TRANSPORTE_ITINERARIO.NOME', 'Itinerário', 250, [ldGrid, ldLookup, ldComboBox], ftString, 'EmpresaTransporteItinerarioVO.TEmpresaTransporteItinerarioVO', True)]
    property EmpresaTransporteItinerarioNome: String read FEmpresaTransporteItinerarioNome write FEmpresaTransporteItinerarioNome;

    [TColumn('ID_COLABORADOR', 'Id Colaborador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumnDisplay('COLABORADOR.NOME', 'Colaborador', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'ViewPessoaColaboradorVO.TViewPessoaColaboradorVO', True)]
    property ColaboradorNome: String read FColaboradorNome write FColaboradorNome;

    [TColumn('QUANTIDADE', 'Quantidade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Quantidade: Integer  read FQUANTIDADE write FQUANTIDADE;


    //Transientes
    [TAssociation('ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    [TAssociation('ID', 'ID_EMPRESA_TRANSP_ITIN')]
    property EmpresaTransporteItinerarioVO: TEmpresaTransporteItinerarioVO read FEmpresaTransporteItinerarioVO write FEmpresaTransporteItinerarioVO;


  end;

implementation

constructor TFolhaValeTransporteVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;
  FEmpresaTransporteItinerarioVO := TEmpresaTransporteItinerarioVO.Create;
end;

destructor TFolhaValeTransporteVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);
  FreeAndNil(FEmpresaTransporteItinerarioVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFolhaValeTransporteVO);

finalization
  Classes.UnRegisterClass(TFolhaValeTransporteVO);

end.
