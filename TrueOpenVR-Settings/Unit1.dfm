object Main: TMain
  Left = 193
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TrueOpenVR Settings'
  ClientHeight = 192
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
  object ChsDriverLbl: TLabel
    Left = 8
    Top = 97
    Width = 89
    Height = 13
    Caption = 'Choose VR driver: '
  end
  object RendLbl: TLabel
    Left = 8
    Top = 65
    Width = 119
    Height = 13
    Caption = 'Render resolution for VR:'
  end
  object RendXLbl: TLabel
    Left = 202
    Top = 64
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object LensDistortionProfileLbl: TLabel
    Left = 8
    Top = 128
    Width = 102
    Height = 13
    Caption = 'Lens distortion profile:'
  end
  object ApplyBtn: TButton
    Left = 8
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 5
    OnClick = ApplyBtnClick
  end
  object ExitBtn: TButton
    Left = 88
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 6
    OnClick = ExitBtnClick
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
  object ChsDriverCB: TComboBox
    Left = 120
    Top = 93
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
  end
  object RendWidthEdt: TEdit
    Left = 153
    Top = 62
    Width = 41
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object RendHeightEdt: TEdit
    Left = 216
    Top = 62
    Width = 41
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object CBScrControl: TCheckBox
    Left = 8
    Top = 33
    Width = 193
    Height = 17
    Caption = 'Auto enable and disable VR screen'
    TabOrder = 1
  end
  object AboutBtn: TButton
    Left = 240
    Top = 160
    Width = 27
    Height = 25
    Caption = '?'
    TabOrder = 7
    OnClick = AboutBtnClick
  end
  object ChsDistortionCB: TComboBox
    Left = 120
    Top = 124
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
  end
  object XPManifest: TXPManifest
    Left = 120
    Top = 1
  end
end
