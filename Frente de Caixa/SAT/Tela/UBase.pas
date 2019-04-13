{ *******************************************************************************
Title: T2TiPDV
Description: Formulário Base

The MIT License

Copyright: Copyright (C) 2015 T2Ti.COM

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

@author Albert Eije
@version 2.0
******************************************************************************* }
unit UBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SessaoUsuario, JvArrowButton, Buttons, Tipos, ComCtrls,
  JvPageList, Rtti, Atributos, ActnList, Menus, Vcl.ExtCtrls;

type
  TFBase = class(TForm)
  private

    function GetSessaoUsuario: TSessaoUsuario;
    { Private declarations }
  public
    { Public declarations }
    property Sessao: TSessaoUsuario read GetSessaoUsuario;
  end;

var
  FBase: TFBase;

implementation

{$R *.dfm}
{ TFBase }

function TFBase.GetSessaoUsuario: TSessaoUsuario;
begin
  Result := TSessaoUsuario.Instance;
end;


end.
