unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ComCtrls, Registry;

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
    ResXLbl: TLabel;
    EdtHeight: TEdit;
    ChsPlugin: TLabel;
    CBChsDriver: TComboBox;
    RendLbl: TLabel;
    RendXLbl: TLabel;
    EdtRendWidth: TEdit;
    EdtRendHeight: TEdit;
    FOVLbl: TLabel;
    FovBar: TTrackBar;
    CBScrControl: TCheckBox;
    Button1: TButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure FovBarChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  Reg: TRegistry; i, ScreenIndex: integer; SR: TSearchRec; DriverName, Driver64Name: string;
begin
  Application.Title:=Caption;

  SetWindowLong(EdtWidth.Handle, GWL_STYLE, GetWindowLong(EdtWidth.Handle, GWL_STYLE) or ES_NUMBER);
  SetWindowLong(EdtHeight.Handle, GWL_STYLE, GetWindowLong(EdtHeight.Handle, GWL_STYLE) or ES_NUMBER);
  SetWindowLong(EdtRendWidth.Handle, GWL_STYLE, GetWindowLong(EdtRendWidth.Handle, GWL_STYLE) or ES_NUMBER);
  SetWindowLong(EdtRendHeight.Handle, GWL_STYLE, GetWindowLong(EdtRendHeight.Handle, GWL_STYLE) or ES_NUMBER);

  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if Reg.OpenKey('\Software\TrueOpenVR', true) then begin
    try
      ScreenIndex:=Reg.ReadInteger('ScreenIndex');
    
      TrackBar.Max:=Screen.MonitorCount;
      if ScreenIndex > TrackBar.Max then
        TrackBar.Max:=ScreenIndex;
      TrackBar.Position:=ScreenIndex;
      if (Screen.MonitorCount < TrackBar.Position) or (Screen.MonitorCount = 1) then
        TrackBar.Enabled:=false;
      ScrIndLbl.Caption:=IntToStr(ScreenIndex);

      CBScale.Checked:=Reg.ReadBool('Scale');
      CBScrControl.Checked:=Reg.ReadBool('ScreenControl');
      FovBar.Position:=Reg.ReadInteger('FOV');
      FOVLbl.Caption:='FOV: ' + IntToStr(FovBar.Position);
      EdtWidth.Text:=IntToStr(Reg.ReadInteger('UserWidth'));
      EdtHeight.Text:=IntToStr(Reg.ReadInteger('UserHeight'));
      EdtRendWidth.Text:=IntToStr(Reg.ReadInteger('RenderWidth'));
      EdtRendHeight.Text:=IntToStr(Reg.ReadInteger('RenderHeight'));
      DriverName:=Reg.ReadString('Driver');
      Driver64Name:=Reg.ReadString('Driver64');
    except
      CBScale.Checked:=false;
      CBScrControl.Checked:=true;
      ScreenIndex:=1;
      EdtWidth.Text:=IntToStr(Screen.Monitors[0].Width);
      EdtHeight.Text:=IntToStr(Screen.Monitors[0].Height);
      EdtRendWidth.Text:=EdtWidth.Text;
      EdtRendHeight.Text:=EdtHeight.Text;
      DriverName:='';
      Driver64Name:='';
    end;

    Reg.CloseKey;
   end;
  Reg.Free;


  if FindFirst(ExtractFilePath(ParamStr(0)) + 'Drivers\*.dll', faAnyFile, SR) = 0 then
   begin
     repeat
       if (SR.Attr <> faDirectory) then
       begin
          if Copy(SR.Name, Length(SR.Name) - 5, 2) <> '64' then
            CBChsDriver.Items.Add(Copy(SR.Name, 1, Length(SR.Name) - 4))
          else if FileExists(ExtractFilePath(ParamStr(0)) + 'Drivers\' + Copy(SR.Name, 1, Length(SR.Name) - 6) + '.dll') = false then //if not found 32-bit driver then show only 64-bit
            CBChsDriver.Items.Add(Copy(SR.Name, 1, Length(SR.Name) - 4));
       end;
     until FindNext(SR) <> 0;
     FindClose(SR);
   end;

  CBChsDriver.ItemIndex:=0;

  if DriverName = '' then DriverName:=Driver64Name;
  for i:=0 to CBChsDriver.Items.Count - 1 do
    if CBChsDriver.Items.Strings[i] = Copy(DriverName, 1, Length(DriverName) - 4) then CBChsDriver.ItemIndex:=i;
end;

procedure TMain.TrackBarChange(Sender: TObject);
begin
  if TrackBar.Position <= Screen.MonitorCount then begin
    ScrIndLbl.Caption:=IntToStr(TrackBar.Position);
    EdtWidth.Text:=IntToStr(Screen.Monitors[TrackBar.Position - 1].Width);
    EdtHeight.Text:=IntToStr(Screen.Monitors[TrackBar.Position - 1].Height);
  end;
end;

procedure TMain.ApplyBtnClick(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if Reg.OpenKey('\Software\TrueOpenVR', true) then begin
    Reg.WriteInteger('ScreenIndex', TrackBar.Position);
    Reg.WriteBool('Scale', CBScale.Checked);
    Reg.WriteBool('ScreenControl', CBScrControl.Checked);
    Reg.WriteInteger('FOV', FovBar.Position);
    Reg.WriteInteger('UserWidth', StrToInt(EdtWidth.Text));
    Reg.WriteInteger('UserHeight', StrToInt(EdtHeight.Text));
    Reg.WriteInteger('RenderWidth', StrToInt(EdtRendWidth.Text));
    Reg.WriteInteger('RenderHeight', StrToInt(EdtRendHeight.Text));

    if Copy(CBChsDriver.Items.Strings[CBChsDriver.ItemIndex], Length(CBChsDriver.Items.Strings[CBChsDriver.ItemIndex]) - 1, 2) <> '64' then begin
      Reg.WriteString('Driver', CBChsDriver.Items.Strings[CBChsDriver.ItemIndex] + '.dll');
      if FileExists(ExtractFilePath(ParamStr(0)) + 'Drivers\' + CBChsDriver.Items.Strings[CBChsDriver.ItemIndex] + '64.dll') then
        Reg.WriteString('Driver64', CBChsDriver.Items.Strings[CBChsDriver.ItemIndex] + '64.dll')
      else
        Reg.WriteString('Driver64', ''); //If not found 64-bit driver
    end else if Copy(CBChsDriver.Items.Strings[CBChsDriver.ItemIndex], Length(CBChsDriver.Items.Strings[CBChsDriver.ItemIndex]) - 1, 2) = '64' then begin
      Reg.WriteString('Driver', '');
      Reg.WriteString('Driver64', CBChsDriver.Items.Strings[CBChsDriver.ItemIndex] + '.dll');
    end else begin //Non-standard names are not accepted to avoid errors.
      Reg.WriteString('Driver', '');
      Reg.WriteString('Driver64', '');
    end;

    Reg.WriteString('Library', ExtractFilePath(ParamStr(0)) + 'TOVR.dll');
    Reg.WriteString('Library64', ExtractFilePath(ParamStr(0)) + 'TOVR64.dll');
    Reg.WriteString('Drivers', ExtractFilePath(ParamStr(0)) + 'Drivers\');
    Reg.CloseKey;
  end;
  Reg.Free;
  Close;
end;

procedure TMain.FovBarChange(Sender: TObject);
begin
  FOVLbl.Caption:='FOV: ' + IntToStr(FovBar.Position);
end;

procedure TMain.Button1Click(Sender: TObject);
begin
  Application.MessageBox(PChar('TrueOpenVR' + #13#10 + 'https://github.com/TrueOpenVR' + #13#10 + 'r57zone@gmail.com'), PChar(Caption), 0);
end;

end.
