unit UnitFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TUniFrameForm = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniFrameForm: TUniFrameForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniFrameForm: TUniFrameForm;
begin
  Result := TUniFrameForm(UniMainModule.GetFormInstance(TUniFrameForm));
end;

end.
