object Main: TMain
  Left = 193
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'True Open VR Settings'
  ClientHeight = 211
  ClientWidth = 241
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
    Left = 168
    Top = 16
    Width = 6
    Height = 13
    Caption = '1'
  end
  object ResLbl: TLabel
    Left = 8
    Top = 96
    Width = 73
    Height = 13
    Caption = 'User resolution:'
  end
  object Label4: TLabel
    Left = 137
    Top = 95
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object ChsPlugin: TLabel
    Left = 8
    Top = 136
    Width = 73
    Height = 13
    Caption = 'Choose plugin: '
  end
  object ApplyBtn: TButton
    Left = 8
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 0
    OnClick = ApplyBtnClick
  end
  object ExitBtn: TButton
    Left = 88
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = ExitBtnClick
  end
  object CBScale: TCheckBox
    Left = 8
    Top = 56
    Width = 113
    Height = 17
    Caption = 'Use image scaling'
    TabOrder = 2
  end
  object TrackBar: TTrackBar
    Left = 104
    Top = 12
    Width = 57
    Height = 33
    Min = 1
    Position = 1
    TabOrder = 3
    OnChange = TrackBarChange
  end
  object EdtWidth: TEdit
    Left = 88
    Top = 93
    Width = 41
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object EdtHeight: TEdit
    Left = 151
    Top = 93
    Width = 41
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object CBChsPlugin: TComboBox
    Left = 88
    Top = 132
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object XPManifest1: TXPManifest
    Left = 200
    Top = 8
  end
end
