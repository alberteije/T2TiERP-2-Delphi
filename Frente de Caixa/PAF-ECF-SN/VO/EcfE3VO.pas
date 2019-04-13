{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [ECF_E3]

The MIT License

Copyright: Copyright (C) 2010 T2Ti.COM

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
@version 1.0
*******************************************************************************}
unit EcfE3VO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, EcfProdutoVO;

type
  [TEntity]
  [TTable('ECF_E3')]
  TEcfE3VO = class(TVO)
  private
    FID: Integer;
    FSERIE_ECF: String;
    FMF_ADICIONAL: String;
    FTIPO_ECF: String;
    FMARCA_ECF: String;
    FMODELO_ECF: String;
    FDATA_ESTOQUE: TDateTime;
    FHORA_ESTOQUE: String;
    FLOGSS: String;

  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('SERIE_ECF', 'Serie Ecf', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property SerieEcf: String  read FSERIE_ECF write FSERIE_ECF;
    [TColumn('MF_ADICIONAL', 'Mf Adicional', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property MfAdicional: String  read FMF_ADICIONAL write FMF_ADICIONAL;
    [TColumn('TIPO_ECF', 'Tipo Ecf', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoEcf: String  read FTIPO_ECF write FTIPO_ECF;
    [TColumn('MARCA_ECF', 'Marca Ecf', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property MarcaEcf: String  read FMARCA_ECF write FMARCA_ECF;
    [TColumn('MODELO_ECF', 'Modelo Ecf', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property ModeloEcf: String  read FMODELO_ECF write FMODELO_ECF;
    [TColumn('DATA_ESTOQUE', 'Data Estoque', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEstoque: TDateTime  read FDATA_ESTOQUE write FDATA_ESTOQUE;
    [TColumn('HORA_ESTOQUE', 'Hora Estoque', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraEstoque: String  read FHORA_ESTOQUE write FHORA_ESTOQUE;
    [TColumn('LOGSS', 'Log', 8, [], False)]
    property HashRegistro: String  read FLOGSS write FLOGSS;

  end;

implementation


initialization
  Classes.RegisterClass(TEcfE3VO);

finalization
  Classes.UnRegisterClass(TEcfE3VO);

end.
