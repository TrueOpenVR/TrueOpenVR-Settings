unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles;

type
  TSplitterAdvanceForm = class(TForm)
    HMDGB: TGroupBox;
    HMDPosCB: TComboBox;
    ControllersGB: TGroupBox;
    ControllersPossCB: TComboBox;
    OkBtn: TButton;
    CancelBtn: TButton;
    HMDPosLbl: TLabel;
    HMDRotLbl: TLabel;
    HMDRotCB: TComboBox;
    CtrlsPossLbl: TLabel;
    CtrlsRotsLbl: TLabel;
    CtrlsBtnsLbl: TLabel;
    ControllersRotsCB: TComboBox;
    ControllersBtnsCB: TComboBox;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplitterAdvanceForm: TSplitterAdvanceForm;

implementation

uses Unit1;

{$R *.dfm}

procedure TSplitterAdvanceForm.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSplitterAdvanceForm.FormShow(Sender: TObject);
var
  Ini: TIniFile; i: integer;
begin
  HMDPosCB.Items:=Main.ChsDriverCB.Items;
  HMDRotCB.Items:=Main.ChsDriverCB.Items;
  ControllersPossCB.Items:=Main.ChsDriverCB.Items;
  ControllersRotsCB.Items:=Main.ChsDriverCB.Items;
  ControllersBtnsCB.Items:=Main.ChsDriverCB.Items;

  HMDPosCB.ItemIndex:=0;
  HMDRotCB.ItemIndex:=0;
  ControllersPossCB.ItemIndex:=0;
  ControllersRotsCB.ItemIndex:=0;
  ControllersBtnsCB.ItemIndex:=0;

  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Drivers\SplitterAdvance.ini');

  for i:=0 to Main.ChsDriverCB.Items.Count - 1 do begin
    if Main.ChsDriverCB.Items.Strings[i] = Copy(Ini.ReadString('HMD', 'Position', ''), 1, Length(Ini.ReadString('HMD', 'Position', '')) - 4) then
      HMDPosCB.ItemIndex:=i;

    if Main.ChsDriverCB.Items.Strings[i] = Copy(Ini.ReadString('HMD', 'Rotation', ''), 1, Length(Ini.ReadString('HMD', 'Rotation', '')) - 4) then
      HMDRotCB.ItemIndex:=i;

    if Main.ChsDriverCB.Items.Strings[i] = Copy(Ini.ReadString('Controllers', 'Position', ''), 1, Length(Ini.ReadString('Controllers', 'Position', '')) - 4) then
      ControllersPossCB.ItemIndex:=i;

    if Main.ChsDriverCB.Items.Strings[i] = Copy(Ini.ReadString('Controllers', 'Rotation', ''), 1, Length(Ini.ReadString('Controllers', 'Rotation', '')) - 4) then
      ControllersRotsCB.ItemIndex:=i;

    if Main.ChsDriverCB.Items.Strings[i] = Copy(Ini.ReadString('Controllers', 'Buttons', ''), 1, Length(Ini.ReadString('Controllers', 'Buttons', '')) - 4) then
      ControllersBtnsCB.ItemIndex:=i;
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

procedure TSplitterAdvanceForm.OkBtnClick(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Drivers\SplitterAdvance.ini');
  Ini.WriteString('HMD', 'Position', CheckDriver(FixArch(HMDPosCB.Items.Strings[HMDPosCB.ItemIndex])) + '.dll');
  Ini.WriteString('HMD', 'Rotation', CheckDriver(FixArch(HMDPosCB.Items.Strings[HMDRotCB.ItemIndex])) + '.dll');
  Ini.WriteString('Controllers', 'Position', CheckDriver(FixArch(ControllersPossCB.Items.Strings[ControllersPossCB.ItemIndex])) + '.dll');
  Ini.WriteString('Controllers', 'Rotation', CheckDriver(FixArch(ControllersRotsCB.Items.Strings[ControllersRotsCB.ItemIndex])) + '.dll');
  Ini.WriteString('Controllers', 'Buttons', CheckDriver(FixArch(ControllersBtnsCB.Items.Strings[ControllersBtnsCB.ItemIndex])) + '.dll');
  Ini.Free;
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Drivers\SplitterAdvance64.ini');
  Ini.WriteString('HMD', 'Position', FixArch(HMDPosCB.Items.Strings[HMDPosCB.ItemIndex]) + '64.dll');
  Ini.WriteString('HMD', 'Rotation', FixArch(HMDPosCB.Items.Strings[HMDRotCB.ItemIndex]) + '64.dll');
  Ini.WriteString('Controllers', 'Position', FixArch(ControllersPossCB.Items.Strings[ControllersPossCB.ItemIndex]) + '64.dll');
  Ini.WriteString('Controllers', 'Rotation', FixArch(ControllersRotsCB.Items.Strings[ControllersRotsCB.ItemIndex]) + '64.dll');
  Ini.WriteString('Controllers', 'Buttons', FixArch(ControllersBtnsCB.Items.Strings[ControllersBtnsCB.ItemIndex]) + '64.dll');
  Ini.Free;
  Close;
end;

end.
