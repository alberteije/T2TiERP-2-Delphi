{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_TERMO] 
                                                                                
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
unit ContabilTermoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CONTABIL_TERMO')]
  TContabilTermoVO = class(TVO)
  private
    FID: Integer;
    FID_CONTABIL_LIVRO: Integer;
    FABERTURA_ENCERRAMENTO: String;
    FNUMERO: Integer;
    FPAGINA_INICIAL: Integer;
    FPAGINA_FINAL: Integer;
    FREGISTRADO: String;
    FNUMERO_REGISTRO: String;
    FDATA_DESPACHO: TDateTime;
    FDATA_ABERTURA: TDateTime;
    FDATA_ENCERRAMENTO: TDateTime;
    FESCRITURACAO_INICIO: TDateTime;
    FESCRITURACAO_FIM: TDateTime;
    FTEXTO: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CONTABIL_LIVRO', 'Id Contabil Livro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContabilLivro: Integer  read FID_CONTABIL_LIVRO write FID_CONTABIL_LIVRO;
    [TColumn('ABERTURA_ENCERRAMENTO', 'Abertura Encerramento', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property AberturaEncerramento: String  read FABERTURA_ENCERRAMENTO write FABERTURA_ENCERRAMENTO;
    [TColumn('NUMERO', 'Numero', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Numero: Integer  read FNUMERO write FNUMERO;
    [TColumn('PAGINA_INICIAL', 'Pagina Inicial', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property PaginaInicial: Integer  read FPAGINA_INICIAL write FPAGINA_INICIAL;
    [TColumn('PAGINA_FINAL', 'Pagina Final', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property PaginaFinal: Integer  read FPAGINA_FINAL write FPAGINA_FINAL;
    [TColumn('REGISTRADO', 'Registrado', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Registrado: String  read FREGISTRADO write FREGISTRADO;
    [TColumn('NUMERO_REGISTRO', 'Numero Registro', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroRegistro: String  read FNUMERO_REGISTRO write FNUMERO_REGISTRO;
    [TColumn('DATA_DESPACHO', 'Data Despacho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataDespacho: TDateTime  read FDATA_DESPACHO write FDATA_DESPACHO;
    [TColumn('DATA_ABERTURA', 'Data Abertura', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataAbertura: TDateTime  read FDATA_ABERTURA write FDATA_ABERTURA;
    [TColumn('DATA_ENCERRAMENTO', 'Data Encerramento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEncerramento: TDateTime  read FDATA_ENCERRAMENTO write FDATA_ENCERRAMENTO;
    [TColumn('ESCRITURACAO_INICIO', 'Escrituracao Inicio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property EscrituracaoInicio: TDateTime  read FESCRITURACAO_INICIO write FESCRITURACAO_INICIO;
    [TColumn('ESCRITURACAO_FIM', 'Escrituracao Fim', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property EscrituracaoFim: TDateTime  read FESCRITURACAO_FIM write FESCRITURACAO_FIM;
    [TColumn('TEXTO', 'Texto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Texto: String  read FTEXTO write FTEXTO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TContabilTermoVO);

finalization
  Classes.UnRegisterClass(TContabilTermoVO);

end.
