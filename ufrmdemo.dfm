object Form1: TForm1
  Left = 314
  Top = 137
  Width = 595
  Height = 267
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Button1: TButton
    Left = 88
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Add File'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Stat'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 464
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Memo1: TMemo
    Left = 176
    Top = 64
    Width = 249
    Height = 153
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
end
