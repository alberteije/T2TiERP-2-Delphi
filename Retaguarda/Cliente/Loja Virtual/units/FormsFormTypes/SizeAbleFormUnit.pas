unit SizeAbleFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TSizeableForm = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SizeableForm: TSizeableForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function SizeableForm: TSizeableForm;
begin
  Result := TSizeableForm(UniMainModule.GetFormInstance(TSizeableForm));
end;

end.
