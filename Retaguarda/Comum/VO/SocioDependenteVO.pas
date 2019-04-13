{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [SOCIO_DEPENDENTE] 
                                                                                
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
unit SocioDependenteVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('SOCIO_DEPENDENTE')]
  TSocioDependenteVO = class(TVO)
  private
    FID: Integer;
    FID_SOCIO: Integer;
    FID_TIPO_RELACIONAMENTO: Integer;
    FNOME: String;
    FDATA_NASCIMENTO: TDateTime;
    FDATA_INICIO_DEPEDENCIA: TDateTime;
    FDATA_FIM_DEPENDENCIA: TDateTime;
    FCPF: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_SOCIO', 'Id Socio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSocio: Integer  read FID_SOCIO write FID_SOCIO;
    [TColumn('ID_TIPO_RELACIONAMENTO', 'Id Tipo Relacionamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTipoRelacionamento: Integer  read FID_TIPO_RELACIONAMENTO write FID_TIPO_RELACIONAMENTO;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DATA_NASCIMENTO', 'Data Nascimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataNascimento: TDateTime  read FDATA_NASCIMENTO write FDATA_NASCIMENTO;
    [TColumn('DATA_INICIO_DEPEDENCIA', 'Data Inicio Depedencia', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInicioDepedencia: TDateTime  read FDATA_INICIO_DEPEDENCIA write FDATA_INICIO_DEPEDENCIA;
    [TColumn('DATA_FIM_DEPENDENCIA', 'Data Fim Dependencia', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFimDependencia: TDateTime  read FDATA_FIM_DEPENDENCIA write FDATA_FIM_DEPENDENCIA;
    [TColumn('CPF', 'Cpf', 88, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCpf, taLeftJustify)]
    property Cpf: String  read FCPF write FCPF;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TSocioDependenteVO);

finalization
  Classes.UnRegisterClass(TSocioDependenteVO);

end.
