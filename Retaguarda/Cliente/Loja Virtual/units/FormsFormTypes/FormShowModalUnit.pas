unit FormShowModalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TFormShowModal = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FormShowModal: TFormShowModal;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FormShowModal: TFormShowModal;
begin
  Result := TFormShowModal(UniMainModule.GetFormInstance(TFormShowModal));
end;

end.
