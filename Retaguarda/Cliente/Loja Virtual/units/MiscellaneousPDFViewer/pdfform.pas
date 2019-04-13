unit pdfform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniURLFrame;

type
  TUniPDFForm = class(TUniForm)
    UniURLFrame1: TUniURLFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniPDFForm: TUniPDFForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniPDFForm: TUniPDFForm;
begin
  Result := TUniPDFForm(UniMainModule.GetFormInstance(TUniPDFForm));
end;

end.
