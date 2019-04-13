{*******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [VIEW_FICHA_TECNICA]

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
unit ViewFichaTecnicaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, FichaTecnicaVO;

type
  [TEntity]
  [TTable('VIEW_FICHA_TECNICA')]
  TViewFichaTecnicaVO = class(TVO)
  private
    FID_PRODUTO: Integer;
    FNOME: string;
    FCUSTO_UNITARIO: Extended;

  public
    [TColumn('ID', 'Id Produto', 150, [ldGrid, ldLookup, ldComboBox], False)]
    property IdProduto: Integer read FID_PRODUTO write FID_PRODUTO;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldComboBox], False)]
    property Nome: string read FNome write FNome;
    [TColumn('CUSTO_UNITARIO', 'Custo Unitário', 150, [ldGrid, ldLookup, ldComboBox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustoUnitario: Extended read FCUSTO_UNITARIO write FCUSTO_UNITARIO;

  end;

implementation

end.
