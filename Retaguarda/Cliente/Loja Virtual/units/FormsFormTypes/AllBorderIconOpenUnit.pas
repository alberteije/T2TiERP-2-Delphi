unit AllBorderIconOpenUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TAllBorderIconOpenForm = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AllBorderIconOpenForm: TAllBorderIconOpenForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function AllBorderIconOpenForm: TAllBorderIconOpenForm;
begin
  Result := TAllBorderIconOpenForm(UniMainModule.GetFormInstance(TAllBorderIconOpenForm));
end;

end.
