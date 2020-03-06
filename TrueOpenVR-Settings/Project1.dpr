program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Main},
  Unit2 in 'Unit2.pas' {SplitterForm},
  Unit3 in 'Unit3.pas' {SplitterAdvanceForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TSplitterForm, SplitterForm);
  Application.CreateForm(TSplitterAdvanceForm, SplitterAdvanceForm);
  Application.Run;
end.
