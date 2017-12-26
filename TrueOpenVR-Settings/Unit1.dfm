object Main: TMain
  Left = 194
  Top = 128
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TrueOpenVR Settings'
  ClientHeight = 201
  ClientWidth = 243
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
    Top = 104
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
    Top = 135
    Width = 74
    Height = 13
    Caption = 'Headset profile:'
  end
  object ApplyBtn: TButton
    Left = 8
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 5
    OnClick = ApplyBtnClick
  end
  object ExitBtn: TButton
    Left = 88
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 6
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
    Top = 101
    Width = 137
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
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
    Left = 8
    Top = 38
    Width = 193
    Height = 17
    Caption = 'Auto enable and disable VR screen'
    TabOrder = 1
  end
  object AboutBtn: TButton
    Left = 208
    Top = 168
    Width = 27
    Height = 25
    Caption = '?'
    TabOrder = 7
    OnClick = AboutBtnClick
  end
  object ChsDistortionCB: TComboBox
    Left = 96
    Top = 132
    Width = 137
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
  end
  object XPManifest: TXPManifest
    Left = 104
    Top = 1
  end
end
