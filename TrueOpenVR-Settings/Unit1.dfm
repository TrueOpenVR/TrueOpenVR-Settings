object Main: TMain
  Left = 193
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TrueOpenVR Settings'
  ClientHeight = 271
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
    Top = 16
    Width = 95
    Height = 13
    Caption = 'Choose VR screen :'
  end
  object ScrIndLbl: TLabel
    Left = 255
    Top = 16
    Width = 6
    Height = 13
    Caption = '1'
  end
  object ResLbl: TLabel
    Left = 8
    Top = 120
    Width = 106
    Height = 13
    Caption = 'User resolution for VR:'
  end
  object ResXLbl: TLabel
    Left = 209
    Top = 119
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object ChsPlugin: TLabel
    Left = 8
    Top = 200
    Width = 89
    Height = 13
    Caption = 'Choose VR driver: '
  end
  object RendLbl: TLabel
    Left = 8
    Top = 160
    Width = 119
    Height = 13
    Caption = 'Render resolution for VR:'
  end
  object RendXLbl: TLabel
    Left = 209
    Top = 159
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object FOVLbl: TLabel
    Left = 8
    Top = 84
    Width = 39
    Height = 13
    Caption = 'FOV: 90'
  end
  object ApplyBtn: TButton
    Left = 8
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 0
    OnClick = ApplyBtnClick
  end
  object ExitBtn: TButton
    Left = 88
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = ExitBtnClick
  end
  object CBScale: TCheckBox
    Left = 8
    Top = 48
    Width = 113
    Height = 17
    Caption = 'Use image scaling'
    TabOrder = 2
  end
  object TrackBar: TTrackBar
    Left = 191
    Top = 12
    Width = 57
    Height = 33
    Min = 1
    Position = 1
    TabOrder = 3
    OnChange = TrackBarChange
  end
  object EdtWidth: TEdit
    Left = 160
    Top = 117
    Width = 41
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object EdtHeight: TEdit
    Left = 223
    Top = 117
    Width = 41
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object CBChsDriver: TComboBox
    Left = 104
    Top = 196
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object EdtRendWidth: TEdit
    Left = 160
    Top = 157
    Width = 41
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object EdtRendHeight: TEdit
    Left = 223
    Top = 157
    Width = 41
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object FovBar: TTrackBar
    Left = 64
    Top = 80
    Width = 208
    Height = 33
    Max = 240
    Min = 80
    Frequency = 10
    Position = 90
    TabOrder = 9
    OnChange = FovBarChange
  end
  object XPManifest1: TXPManifest
    Left = 136
    Top = 8
  end
end
