object Main: TMain
  Left = 193
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TrueOpenVR Settings'
  ClientHeight = 250
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ChsVRLbl: TLabel
    Left = 8
    Top = 9
    Width = 95
    Height = 13
    Caption = 'Choose VR screen :'
  end
  object ScrIndLbl: TLabel
    Left = 255
    Top = 9
    Width = 6
    Height = 13
    Caption = '1'
  end
  object ResLbl: TLabel
    Left = 8
    Top = 121
    Width = 106
    Height = 13
    Caption = 'User resolution for VR:'
  end
  object ResXLbl: TLabel
    Left = 210
    Top = 120
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object ChsPlugin: TLabel
    Left = 8
    Top = 185
    Width = 89
    Height = 13
    Caption = 'Choose VR driver: '
  end
  object RendLbl: TLabel
    Left = 8
    Top = 153
    Width = 119
    Height = 13
    Caption = 'Render resolution for VR:'
  end
  object RendXLbl: TLabel
    Left = 210
    Top = 152
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object FOVLbl: TLabel
    Left = 8
    Top = 85
    Width = 39
    Height = 13
    Caption = 'FOV: 90'
  end
  object ApplyBtn: TButton
    Left = 8
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 9
    OnClick = ApplyBtnClick
  end
  object ExitBtn: TButton
    Left = 88
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 10
    OnClick = ExitBtnClick
  end
  object CBScale: TCheckBox
    Left = 8
    Top = 57
    Width = 113
    Height = 17
    Caption = 'Use image scaling'
    TabOrder = 2
  end
  object TrackBar: TTrackBar
    Left = 191
    Top = 5
    Width = 57
    Height = 28
    Min = 1
    Position = 1
    TabOrder = 0
    OnChange = TrackBarChange
  end
  object EdtWidth: TEdit
    Left = 161
    Top = 118
    Width = 41
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object EdtHeight: TEdit
    Left = 224
    Top = 118
    Width = 41
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object CBChsDriver: TComboBox
    Left = 104
    Top = 181
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
  end
  object EdtRendWidth: TEdit
    Left = 161
    Top = 150
    Width = 41
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object EdtRendHeight: TEdit
    Left = 224
    Top = 150
    Width = 41
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object FovBar: TTrackBar
    Left = 64
    Top = 81
    Width = 208
    Height = 28
    Max = 220
    Min = 80
    Frequency = 10
    Position = 90
    TabOrder = 3
    OnChange = FovBarChange
  end
  object CBScrControl: TCheckBox
    Left = 8
    Top = 33
    Width = 193
    Height = 17
    Caption = 'Auto enable and disable VR screen'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 240
    Top = 216
    Width = 27
    Height = 25
    Caption = '?'
    TabOrder = 11
    OnClick = Button1Click
  end
  object XPManifest1: TXPManifest
    Left = 232
    Top = 49
  end
end
