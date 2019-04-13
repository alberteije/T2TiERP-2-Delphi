{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [AGENCIA_BANCO] 
                                                                                
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
unit AgenciaBancoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, DB, SysUtils, BancoVO;

type
  [TEntity]
  [TTable('AGENCIA_BANCO')]
  TAgenciaBancoVO = class(TVO)
  private
    FID: Integer;
    FID_BANCO: Integer;
    FCODIGO: String;
    FDIGITO: String;
    FNOME: String;
    FLOGRADOURO: String;
    FNUMERO: String;
    FCEP: String;
    FBAIRRO: String;
    FMUNICIPIO: String;
    FUF: String;
    FTELEFONE: String;
    FGERENTE: String;
    FCONTATO: String;
    FOBSERVACAO: String;

    //Transientes
    FBancoNome: String;

    FBancoVO: TBancoVO;

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_BANCO', 'Id Banco', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdBanco: Integer  read FID_BANCO write FID_BANCO;
    [TColumnDisplay('BANCO.NOME', 'Banco', 150, [ldGrid, ldLookup], ftString, 'BancoVO.TBancoVO', True)]
    property BancoNome: String read FBancoNome write FBancoNome;

    [TColumn('CODIGO', 'Codigo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('DIGITO', 'Digito', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Digito: String  read FDIGITO write FDIGITO;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('LOGRADOURO', 'Logradouro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    [TColumn('NUMERO', 'Numero', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('CEP', 'Cep', 64, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCep, taLeftJustify)]
    property Cep: String  read FCEP write FCEP;
    [TColumn('BAIRRO', 'Bairro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Bairro: String  read FBAIRRO write FBAIRRO;
    [TColumn('MUNICIPIO', 'Municipio', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Municipio: String  read FMUNICIPIO write FMUNICIPIO;
    [TColumn('UF', 'Uf', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Uf: String  read FUF write FUF;
    [TColumn('TELEFONE', 'Telefone', 112, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property Telefone: String  read FTELEFONE write FTELEFONE;
    [TColumn('GERENTE', 'Gerente', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property Gerente: String  read FGERENTE write FGERENTE;
    [TColumn('CONTATO', 'Empresa Contato', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property Contato: String  read FCONTATO write FCONTATO;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes
    [TAssociation('ID', 'ID_BANCO')]
    property BancoVO: TBancoVO read FBancoVO write FBancoVO;

  end;

implementation

constructor TAgenciaBancoVO.Create;
begin
  inherited;

  FBancoVO := TBancoVO.Create;
end;

destructor TAgenciaBancoVO.Destroy;
begin
  FreeAndNil(FBancoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TAgenciaBancoVO);

finalization
  Classes.UnRegisterClass(TAgenciaBancoVO);

end.
