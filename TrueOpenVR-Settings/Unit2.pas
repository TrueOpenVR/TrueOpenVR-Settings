unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles;

type
  TSplitterForm = class(TForm)
    HMDGB: TGroupBox;
    ControllersGB: TGroupBox;
    OkBtn: TButton;
    CancelBtn: TButton;
    HMDCB: TComboBox;
    ControllersCB: TComboBox;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplitterForm: TSplitterForm;

implementation

uses Unit1;

{$R *.dfm}

procedure TSplitterForm.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSplitterForm.FormShow(Sender: TObject);
var
  Ini: TIniFile; i: integer;
begin
  HMDCB.Items:=Main.ChsDriverCB.Items;
  ControllersCB.Items:=Main.ChsDriverCB.Items;
  HMDCB.ItemIndex:=0;
  ControllersCB.ItemIndex:=0;
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Drivers\Splitter.ini');

  for i:=0 to Main.ChsDriverCB.Items.Count - 1 do begin
    if Main.ChsDriverCB.Items.Strings[i] = Copy(Ini.ReadString('Drivers', 'HMD', ''), 1, Length(Ini.ReadString('Drivers', 'HMD', '')) - 4) then
      HMDCB.ItemIndex:=i;

    if Main.ChsDriverCB.Items.Strings[i] = Copy(Ini.ReadString('Drivers', 'Controllers', ''), 1, Length(Ini.ReadString('Drivers', 'Controllers', '')) - 4) then
      ControllersCB.ItemIndex:=i;
  end;

  Ini.Free;
end;

function FixArch(DriverName: string): string;
begin
  if Copy(DriverName, Length(DriverName) - 1, 2) = '64' then //for only 64 bit drivers
    Result:=Copy(DriverName, 1, Length(DriverName) - 2)
  else
    Result:=DriverName
end;

function CheckDriver(DriverName: string): string;
begin
  if FileExists(ExtractFilePath(ParamStr(0)) + 'Drivers\' + FixArch(DriverName) + '.dll') then
    Result:=FixArch(DriverName)
  else
   Result:='Emulation';
end;

procedure TSplitterForm.OkBtnClick(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Drivers\Splitter.ini');
  Ini.WriteString('Drivers', 'HMD', CheckDriver(FixArch(HMDCB.Items.Strings[HMDCB.ItemIndex])) + '.dll');
  Ini.WriteString('Drivers', 'Controllers', CheckDriver(FixArch(ControllersCB.Items.Strings[ControllersCB.ItemIndex])) + '.dll');
  Ini.Free;
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Drivers\Splitter64.ini');
  Ini.WriteString('Drivers', 'HMD', FixArch(HMDCB.Items.Strings[HMDCB.ItemIndex]) + '64.dll');
  Ini.WriteString('Drivers', 'Controllers', FixArch(ControllersCB.Items.Strings[ControllersCB.ItemIndex]) + '64.dll');
  Ini.Free;
  Close;
end;

end.
