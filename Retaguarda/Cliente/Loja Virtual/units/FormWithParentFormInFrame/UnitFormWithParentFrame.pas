unit UnitFormWithParentFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TUniFormFrame = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniFormFrame: TUniFormFrame;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniFormFrame: TUniFormFrame;
begin
  Result := TUniFormFrame(UniMainModule.GetFormInstance(TUniFormFrame));
end;

end.
