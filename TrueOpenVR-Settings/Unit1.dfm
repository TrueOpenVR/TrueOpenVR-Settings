object Main: TMain
  Left = 193
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TrueOpenVR Settings'
  ClientHeight = 201
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
    Top = 88
    Width = 106
    Height = 13
    Caption = 'User resolution for VR:'
  end
  object Label4: TLabel
    Left = 209
    Top = 87
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object ChsPlugin: TLabel
    Left = 8
    Top = 128
    Width = 89
    Height = 13
    Caption = 'Choose VR driver: '
  end
  object ApplyBtn: TButton
    Left = 8
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 0
    OnClick = ApplyBtnClick
  end
  object ExitBtn: TButton
    Left = 88
    Top = 168
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
    Top = 85
    Width = 41
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object EdtHeight: TEdit
    Left = 223
    Top = 85
    Width = 41
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object CBChsPlugin: TComboBox
    Left = 104
    Top = 124
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object XPManifest1: TXPManifest
    Left = 240
    Top = 168
  end
end
