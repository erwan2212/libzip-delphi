object Form1: TForm1
  Left = 314
  Top = 137
  Width = 1278
  Height = 837
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -25
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 120
  TextHeight = 29
  object Button1: TButton
    Left = 1050
    Top = 135
    Width = 140
    Height = 48
    Caption = 'Add File'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 330
    Top = 30
    Width = 140
    Height = 48
    Caption = 'List Files'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 15
    Top = 30
    Width = 140
    Height = 48
    Caption = 'Open'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 1050
    Top = 30
    Width = 140
    Height = 48
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button4Click
  end
  object ListView1: TListView
    Left = 20
    Top = 110
    Width = 768
    Height = 353
    Columns = <
      item
        Caption = 'Name'
        Width = 375
      end
      item
        Caption = 'Size'
        Width = 188
      end
      item
        Caption = 'Comp Size'
        Width = 188
      end
      item
        Caption = 'DateTime'
        Width = 188
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 4
    ViewStyle = vsReport
  end
  object Button5: TButton
    Left = 1065
    Top = 315
    Width = 140
    Height = 48
    Caption = 'Delete File'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 1065
    Top = 420
    Width = 140
    Height = 48
    Caption = 'Extract File'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 1065
    Top = 480
    Width = 140
    Height = 48
    Caption = 'Edit File'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button7Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 772
    Width = 1270
    Height = 28
    Panels = <>
  end
  object OpenDialog1: TOpenDialog
    Left = 1065
    Top = 225
  end
end
