unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ComCtrls, Registry, IniFiles;

type
  TMain = class(TForm)
    ApplyBtn: TButton;
    ExitBtn: TButton;
    XPManifest: TXPManifest;
    ChsVRLbl: TLabel;
    TrackBar: TTrackBar;
    ScrIndLbl: TLabel;
    ChsDriverLbl: TLabel;
    ChsDriverCB: TComboBox;
    RendLbl: TLabel;
    RendXLbl: TLabel;
    RendWidthEdt: TEdit;
    RendHeightEdt: TEdit;
    CBScrControl: TCheckBox;
    AboutBtn: TButton;
    HeadsetProfileLbl: TLabel;
    ChsDistortionCB: TComboBox;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure AboutBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TMain.FormCreate(Sender: TObject);
var
  Reg: TRegistry; i, ScreenIndex: integer; SR: TSearchRec; DriverName, Driver64Name, DistortionProfile: string;
begin
  Application.Title:=Caption;

  SetWindowLong(RendWidthEdt.Handle, GWL_STYLE, GetWindowLong(RendWidthEdt.Handle, GWL_STYLE) or ES_NUMBER);
  SetWindowLong(RendHeightEdt.Handle, GWL_STYLE, GetWindowLong(RendHeightEdt.Handle, GWL_STYLE) or ES_NUMBER);

  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if Reg.OpenKey('\Software\TrueOpenVR', true) then begin
    try
      ScreenIndex:=Reg.ReadInteger('ScreenIndex');

      //TrackBar.Max:=Screen.MonitorCount;
      //if ScreenIndex > TrackBar.Max then
        TrackBar.Max:=ScreenIndex;
      TrackBar.Position:=ScreenIndex;
      //if (Screen.MonitorCount < TrackBar.Position) or (Screen.MonitorCount = 1) then
        //TrackBar.Enabled:=false;
      ScrIndLbl.Caption:=IntToStr(ScreenIndex);

      CBScrControl.Checked:=Reg.ReadBool('ScreenControl');
      RendWidthEdt.Text:=IntToStr(Reg.ReadInteger('RenderWidth'));
      RendHeightEdt.Text:=IntToStr(Reg.ReadInteger('RenderHeight'));
      DriverName:=Reg.ReadString('Driver');
      Driver64Name:=Reg.ReadString('Driver64');
      DistortionProfile:=Reg.ReadString('DistortionProfile');
    except
      CBScrControl.Checked:=true;
      ScreenIndex:=1;
      RendWidthEdt.Text:=IntToStr(Screen.Monitors[0].Width);
      RendHeightEdt.Text:=IntToStr(Screen.Monitors[0].Height);
      DriverName:='';
      Driver64Name:='';
      DistortionProfile:='';
    end;

    Reg.CloseKey;
   end;
  Reg.Free;


  if FindFirst(ExtractFilePath(ParamStr(0)) + 'Drivers\*.dll', faAnyFile, SR) = 0 then begin
    repeat
      if (SR.Attr <> faDirectory) then begin
        if Copy(SR.Name, Length(SR.Name) - 5, 2) <> '64' then
          ChsDriverCB.Items.Add(Copy(SR.Name, 1, Length(SR.Name) - 4))
          else if FileExists(ExtractFilePath(ParamStr(0)) + 'Drivers\' + Copy(SR.Name, 1, Length(SR.Name) - 6) + '.dll') = false then //if not found 32-bit driver then show only 64-bit
            ChsDriverCB.Items.Add(Copy(SR.Name, 1, Length(SR.Name) - 4));
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;

  ChsDriverCB.ItemIndex:=0;

  if DriverName = '' then DriverName:=Driver64Name;
  for i:=0 to ChsDriverCB.Items.Count - 1 do
    if ChsDriverCB.Items.Strings[i] = Copy(DriverName, 1, Length(DriverName) - 4) then
      ChsDriverCB.ItemIndex:=i;


  if FindFirst(ExtractFilePath(ParamStr(0)) + 'HeadsetProfiles\*.ini', faAnyFile, SR) = 0 then begin
    repeat
      if (SR.Attr <> faDirectory) then
        ChsDistortionCB.Items.Add(Copy(SR.Name, 1, Length(SR.Name) - 4))
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;

  ChsDistortionCB.ItemIndex:=0;

  for i:=0 to ChsDistortionCB.Items.Count - 1 do
    if ChsDistortionCB.Items.Strings[i] = Copy(DistortionProfile, 1, Length(DistortionProfile) - 4) then
      ChsDistortionCB.ItemIndex:=i;
end;

procedure TMain.TrackBarChange(Sender: TObject);
begin
  if TrackBar.Position <= Screen.MonitorCount then begin
    TrackBar.Max:=Screen.MonitorCount;
    ScrIndLbl.Caption:=IntToStr(TrackBar.Position);
    RendWidthEdt.Text:=IntToStr(Screen.Monitors[TrackBar.Position - 1].Width);
    RendHeightEdt.Text:=IntToStr(Screen.Monitors[TrackBar.Position - 1].Height);
  end;
end;

procedure TMain.ApplyBtnClick(Sender: TObject);
var
  Reg: TRegistry; Ini: TIniFile;
begin
  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if Reg.OpenKey('\Software\TrueOpenVR', true) then begin
    Reg.WriteInteger('ScreenIndex', TrackBar.Position);
    Reg.WriteBool('ScreenControl', CBScrControl.Checked);
    Reg.WriteInteger('RenderWidth', StrToInt(RendWidthEdt.Text));
    Reg.WriteInteger('RenderHeight', StrToInt(RendHeightEdt.Text));

    if FileExists(ExtractFilePath(ParamStr(0)) + 'HeadsetProfiles\' + ChsDistortionCB.Items.Strings[ChsDistortionCB.ItemIndex] + '.ini') then begin
      Reg.WriteString('DistortionProfile', ChsDistortionCB.Items.Strings[ChsDistortionCB.ItemIndex] + '.ini');
      Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'HeadsetProfiles\' + ChsDistortionCB.Items.Strings[ChsDistortionCB.ItemIndex] + '.ini');
      Reg.WriteFloat('IPD', StrToFloat(StringReplace(Ini.ReadString('VR', 'IPD', '0.065'), '.', ',', [rfReplaceAll])));
      Reg.WriteFloat('DistortionK1', StrToFloat(StringReplace(Ini.ReadString('Distortion', 'K1', '0'), '.', ',', [rfReplaceAll])));
      Reg.WriteFloat('DistortionK2', StrToFloat(StringReplace(Ini.ReadString('Distortion', 'K2', '0'), '.', ',', [rfReplaceAll])));
      Reg.WriteFloat('DistanceScaleX', StrToFloat(StringReplace(Ini.ReadString('Distortion', 'DistanceScaleX', '1'), '.', ',', [rfReplaceAll])));
      Reg.WriteFloat('DistanceScaleY', StrToFloat(StringReplace(Ini.ReadString('Distortion', 'DistanceScaleY', '1'), '.', ',', [rfReplaceAll])));
      Reg.WriteFloat('DistanceBetweenEyes', StrToFloat(StringReplace(Ini.ReadString('Display', 'DistanceBetweenEyes', '0'), '.', ',', [rfReplaceAll])));
      Reg.WriteFloat('ScreenOffsetX', StrToFloat(StringReplace(Ini.ReadString('Display', 'ScreenOffsetX', '0'), '.', ',', [rfReplaceAll])));
      Ini.Free;
    end;

    if Copy(ChsDriverCB.Items.Strings[ChsDriverCB.ItemIndex], Length(ChsDriverCB.Items.Strings[ChsDriverCB.ItemIndex]) - 1, 2) <> '64' then begin
      Reg.WriteString('Driver', ChsDriverCB.Items.Strings[ChsDriverCB.ItemIndex] + '.dll');
      if FileExists(ExtractFilePath(ParamStr(0)) + 'Drivers\' + ChsDriverCB.Items.Strings[ChsDriverCB.ItemIndex] + '64.dll') then
        Reg.WriteString('Driver64', ChsDriverCB.Items.Strings[ChsDriverCB.ItemIndex] + '64.dll')
      else
        Reg.WriteString('Driver64', ''); //If not found 64-bit driver
    end else if Copy(ChsDriverCB.Items.Strings[ChsDriverCB.ItemIndex], Length(ChsDriverCB.Items.Strings[ChsDriverCB.ItemIndex]) - 1, 2) = '64' then begin
      Reg.WriteString('Driver', '');
      Reg.WriteString('Driver64', ChsDriverCB.Items.Strings[ChsDriverCB.ItemIndex] + '.dll');
    end else begin //Non-standard names are not accepted to avoid errors.
      Reg.WriteString('Driver', '');
      Reg.WriteString('Driver64', '');
    end;

    Reg.WriteString('Library', ExtractFilePath(ParamStr(0)) + 'TOVR.dll');
    Reg.WriteString('Library64', ExtractFilePath(ParamStr(0)) + 'TOVR64.dll');
    Reg.WriteString('Drivers', ExtractFilePath(ParamStr(0)) + 'Drivers\');
    Reg.WriteString('HeadsetProfiles', ExtractFilePath(ParamStr(0)) + 'HeadsetProfiles\');
    Reg.CloseKey;
  end;
  Reg.Free;
  Close;
end;

procedure TMain.AboutBtnClick(Sender: TObject);
begin
  Application.MessageBox(PChar('TrueOpenVR' + #13#10 + 'https://github.com/TrueOpenVR' + #13#10 + 'r57zone@gmail.com'), PChar(Caption), MB_ICONINFORMATION);
end;

end.
