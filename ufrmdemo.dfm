object Form1: TForm1
  Left = 314
  Height = 800
  Top = 137
  Width = 1270
  Caption = 'Form1'
  ClientHeight = 800
  ClientWidth = 1270
  Color = clBtnFace
  DesignTimePPI = 120
  Font.Color = clWindowText
  Font.Height = -25
  Font.Name = 'MS Sans Serif'
  LCLVersion = '1.8.2.0'
  object Button1: TButton
    Left = 1050
    Height = 48
    Top = 135
    Width = 140
    Caption = 'Add File'
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    OnClick = Button1Click
    ParentFont = False
    TabOrder = 0
  end
  object Button2: TButton
    Left = 330
    Height = 48
    Top = 30
    Width = 140
    Caption = 'List Files'
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    OnClick = Button2Click
    ParentFont = False
    TabOrder = 1
  end
  object Button3: TButton
    Left = 15
    Height = 48
    Top = 30
    Width = 140
    Caption = 'Open'
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    OnClick = Button3Click
    ParentFont = False
    TabOrder = 2
  end
  object Button4: TButton
    Left = 1050
    Height = 48
    Top = 30
    Width = 140
    Caption = 'Close'
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    OnClick = Button4Click
    ParentFont = False
    TabOrder = 3
  end
  object ListView1: TListView
    Left = 20
    Height = 353
    Top = 110
    Width = 768
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
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    ParentFont = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 4
    ViewStyle = vsReport
  end
  object Button5: TButton
    Left = 1065
    Height = 48
    Top = 315
    Width = 140
    Caption = 'Delete File'
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    OnClick = Button5Click
    ParentFont = False
    TabOrder = 5
  end
  object Button6: TButton
    Left = 1065
    Height = 48
    Top = 420
    Width = 140
    Caption = 'Extract File'
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    OnClick = Button6Click
    ParentFont = False
    TabOrder = 6
  end
  object Button7: TButton
    Left = 1065
    Height = 48
    Top = 480
    Width = 140
    Caption = 'Edit File'
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    OnClick = Button7Click
    ParentFont = False
    TabOrder = 7
  end
  object StatusBar1: TStatusBar
    Left = 0
    Height = 28
    Top = 772
    Width = 1270
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Panels = <>
    ParentFont = False
  end
  object OpenDialog1: TOpenDialog
    left = 1065
    top = 225
  end
end
