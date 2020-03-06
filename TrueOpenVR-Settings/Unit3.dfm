object SplitterAdvanceForm: TSplitterAdvanceForm
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Splitter Advance'
  ClientHeight = 266
  ClientWidth = 233
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
    Width = 217
    Height = 89
    Caption = 'HMD drivers:'
    TabOrder = 0
    object HMDPosLbl: TLabel
      Left = 8
      Top = 25
      Width = 40
      Height = 13
      Caption = 'Position:'
    end
    object HMDRotLbl: TLabel
      Left = 8
      Top = 58
      Width = 40
      Height = 13
      Caption = 'Rotation'
    end
    object HMDPosCB: TComboBox
      Left = 64
      Top = 24
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object HMDRotCB: TComboBox
      Left = 64
      Top = 56
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object ControllersGB: TGroupBox
    Left = 8
    Top = 104
    Width = 217
    Height = 121
    Caption = 'Controllers drivers:'
    TabOrder = 1
    object CtrlsPossLbl: TLabel
      Left = 8
      Top = 26
      Width = 45
      Height = 13
      Caption = 'Positions:'
    end
    object CtrlsRotsLbl: TLabel
      Left = 8
      Top = 58
      Width = 48
      Height = 13
      Caption = 'Rotations:'
    end
    object CtrlsBtnsLbl: TLabel
      Left = 8
      Top = 90
      Width = 39
      Height = 13
      Caption = 'Buttons:'
    end
    object ControllersPossCB: TComboBox
      Left = 64
      Top = 24
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object ControllersRotsCB: TComboBox
      Left = 64
      Top = 56
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
    object ControllersBtnsCB: TComboBox
      Left = 64
      Top = 88
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
  end
  object OkBtn: TButton
    Left = 7
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = OkBtnClick
  end
  object CancelBtn: TButton
    Left = 87
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = CancelBtnClick
  end
end
