object Main: TMain
  Left = 194
  Top = 128
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TrueOpenVR Settings'
  ClientHeight = 232
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
    Left = 9
    Top = 9
    Width = 91
    Height = 13
    Caption = 'VR screen number:'
  end
  object ScrIndLbl: TLabel
    Left = 223
    Top = 9
    Width = 6
    Height = 13
    Caption = '1'
  end
  object ChsDriverLbl: TLabel
    Left = 8
    Top = 136
    Width = 34
    Height = 13
    Caption = 'Driver: '
  end
  object RendLbl: TLabel
    Left = 8
    Top = 72
    Width = 86
    Height = 13
    Caption = 'Render resolution:'
  end
  object RendXLbl: TLabel
    Left = 178
    Top = 72
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object HeadsetProfileLbl: TLabel
    Left = 8
    Top = 169
    Width = 74
    Height = 13
    Caption = 'Headset profile:'
  end
  object SupersamplingLbl: TLabel
    Left = 8
    Top = 104
    Width = 72
    Height = 13
    Caption = 'Supersampling:'
  end
  object SupersamplingNumLbl: TLabel
    Left = 208
    Top = 104
    Width = 23
    Height = 13
    Caption = 'x 1.0'
  end
  object ApplyBtn: TButton
    Left = 8
    Top = 199
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 8
    OnClick = ApplyBtnClick
  end
  object ExitBtn: TButton
    Left = 88
    Top = 199
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 9
    OnClick = ExitBtnClick
  end
  object TrackBar: TTrackBar
    Left = 159
    Top = 5
    Width = 57
    Height = 28
    Min = 1
    Position = 1
    TabOrder = 0
    OnChange = TrackBarChange
  end
  object ChsDriverCB: TComboBox
    Left = 96
    Top = 133
    Width = 115
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    OnChange = ChsDriverCBChange
  end
  object RendWidthEdt: TEdit
    Left = 129
    Top = 70
    Width = 41
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object RendHeightEdt: TEdit
    Left = 192
    Top = 70
    Width = 41
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object CBScrControl: TCheckBox
    Left = 9
    Top = 38
    Width = 193
    Height = 17
    Caption = 'Auto enable and disable VR screen'
    TabOrder = 1
  end
  object AboutBtn: TButton
    Left = 207
    Top = 199
    Width = 27
    Height = 25
    Caption = '?'
    TabOrder = 10
    OnClick = AboutBtnClick
  end
  object ChsDistortionCB: TComboBox
    Left = 96
    Top = 166
    Width = 137
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
  end
  object SupersamplingTB: TTrackBar
    Left = 90
    Top = 100
    Width = 118
    Height = 25
    Max = 50
    Min = 1
    Frequency = 5
    Position = 10
    TabOrder = 4
    OnChange = SupersamplingTBChange
  end
  object DriverAdvanceBtn: TButton
    Left = 213
    Top = 132
    Width = 21
    Height = 23
    Caption = '...'
    Enabled = False
    TabOrder = 6
    OnClick = DriverAdvanceBtnClick
    OnMouseDown = DriverAdvanceBtnMouseDown
  end
  object XPManifest: TXPManifest
    Left = 104
    Top = 1
  end
end
