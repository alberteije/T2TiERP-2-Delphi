{*******************************************************************************
Title: T2Ti ERP
Description: Classe DataSnap.

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
unit DSServerClass;

interface

uses DsServer, Classes, Controller, DSCommonServer;

type
  TServerClassPadrao = class(TDSServerClass)
  private
    FRegisterClass: TPersistentClass;

  protected
    //procedure CreateInstance(const CreateInstanceEventObject: TDSCreateInstanceEventObject); override;
    procedure OnRegisterClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure OnCreateInstanceClass(DSCreateInstanceEventObject: TDSCreateInstanceEventObject);

  public
    constructor Create(AOwner: TComponent); override;
    property RegisterClass: TPersistentClass read FRegisterClass write FRegisterClass;
  end;

implementation

{ TServerClassPadrao }

constructor TServerClassPadrao.Create(AOwner: TComponent);
begin
  inherited;
  OnGetClass := OnRegisterClass;
  OnCreateInstance := OnCreateInstanceClass;
end;

//procedure TServerClassPadrao.CreateInstance(
//  const CreateInstanceEventObject: TDSCreateInstanceEventObject);
//begin
//  inherited;
//
//end;

procedure TServerClassPadrao.OnCreateInstanceClass(
  DSCreateInstanceEventObject: TDSCreateInstanceEventObject);
var
  Sessao: string;
begin
//  TController(Self.FRegisterClass).IdSessao := '123456789';

  if DSCreateInstanceEventObject.ServerClassInstance is TController then
  begin
    Sessao := DSCreateInstanceEventObject.ServerClassInstance.ClassName;
  end;
end;

procedure TServerClassPadrao.OnRegisterClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := RegisterClass;
end;

end.

