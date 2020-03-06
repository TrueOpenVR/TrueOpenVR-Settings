object SplitterForm: TSplitterForm
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Splitter'
  ClientHeight = 160
  ClientWidth = 177
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object HMDGB: TGroupBox
    Left = 8
    Top = 8
    Width = 161
    Height = 49
    Caption = 'HMD driver:'
    TabOrder = 0
    object HMDCB: TComboBox
      Left = 8
      Top = 16
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object ControllersGB: TGroupBox
    Left = 8
    Top = 64
    Width = 161
    Height = 57
    Caption = 'Controllers driver:'
    TabOrder = 1
    object ControllersCB: TComboBox
      Left = 8
      Top = 24
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object OkBtn: TButton
    Left = 7
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = OkBtnClick
  end
  object CancelBtn: TButton
    Left = 95
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = CancelBtnClick
  end
end
