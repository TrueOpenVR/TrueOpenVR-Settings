unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ComCtrls, Registry, IniFiles;

type
  TMain = class(TForm)
    ApplyBtn: TButton;
    ExitBtn: TButton;
    XPManifest1: TXPManifest;
    CBScale: TCheckBox;
    ChsVRLbl: TLabel;
    TrackBar: TTrackBar;
    ScrIndLbl: TLabel;
    ResLbl: TLabel;
    EdtWidth: TEdit;
    Label4: TLabel;
    EdtHeight: TEdit;
    ChsPlugin: TLabel;
    CBChsPlugin: TComboBox;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
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
  Reg: TRegistry; Ini: TIniFile; i, ScreenIndex: integer; SR: TSearchRec; PluginPath: string;
begin
  Application.Title:=Caption;

  SetWindowLong(EdtWidth.Handle, GWL_STYLE, GetWindowLong(EdtWidth.Handle, GWL_STYLE) or ES_NUMBER);
  SetWindowLong(EdtHeight.Handle, GWL_STYLE, GetWindowLong(EdtHeight.Handle, GWL_STYLE) or ES_NUMBER);

  TrackBar.Max:=Screen.MonitorCount;
  if Screen.MonitorCount = 1 then TrackBar.Enabled:=false;

  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if Reg.OpenKey('\Software\TrueOpenVR', true) then begin
     Reg.WriteString('Path', ExtractFilePath(ParamStr(0)));
     Reg.CloseKey;
   end;
  Reg.Free;

  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'TOVR.ini');

  if Ini.ReadBool('VRInit', 'Scale', false) = true then CBScale.Checked:=true;

  ScreenIndex:=Ini.ReadInteger('VRInit', 'ScreenIndex', 1);
  if ScreenIndex>=TrackBar.Max then TrackBar.Position:=ScreenIndex;
  ScrIndLbl.Caption:=IntToStr(TrackBar.Position);

  EdtWidth.Text:=IntToStr(Ini.ReadInteger('VRInit', 'UserWidth', 1280));
  EdtHeight.Text:=IntToStr(Ini.ReadInteger('VRInit', 'UserHeight', 720));

  if FindFirst(ExtractFilePath(ParamStr(0)) + 'Drivers\*.dll', faAnyFile, SR) = 0 then
   begin
     repeat
       if (SR.Attr <> faDirectory) then
       begin
         CBChsPlugin.Items.Add(SR.Name);
       end;
     until FindNext(SR) <> 0;
     FindClose(SR);
   end;

  CBChsPlugin.ItemIndex:=0;

  PluginPath:=Ini.ReadString('Plugin', 'Path', '');

  for i:=0 to CBChsPlugin.Items.Count - 1 do
    if CBChsPlugin.Items.Strings[i] = PluginPath then CBChsPlugin.ItemIndex:=i;

  Ini.Free;
end;

procedure TMain.TrackBarChange(Sender: TObject);
begin
  ScrIndLbl.Caption:=IntToStr(TrackBar.Position);
  EdtWidth.Text:=IntToStr(Screen.Monitors[TrackBar.Position - 1].Width);
  EdtHeight.Text:=IntToStr(Screen.Monitors[TrackBar.Position - 1].Height);
end;

procedure TMain.ApplyBtnClick(Sender: TObject);
var
  Ini: TIniFile;
begin
   Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'TOVR.ini');
   Ini.WriteInteger('VRInit', 'ScreenIndex', TrackBar.Position);
   Ini.WriteBool('VRInit', 'Scale', CBScale.Checked);
   Ini.WriteString('VRInit', 'UserWidth', EdtWidth.Text);
   Ini.WriteString('VRInit', 'UserHeight', EdtHeight.Text);
   Ini.WriteString('Plugin', 'Path', CBChsPlugin.Items.Strings[CBChsPlugin.ItemIndex]);
   Ini.Free;
   Close;
end;

end.
