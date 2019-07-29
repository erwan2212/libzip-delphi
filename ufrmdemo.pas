unit ufrmdemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,libzip;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var

source,buf:pointer;
fs:TFileStream;
size:int64;
begin
if arch=nil then exit;

//
FS := TFileStream.Create('libz.dll', fmOpenRead or fmShareDenyWrite);
size:=fs.Size;
buf:=AllocMem(size );
fs.ReadBuffer(buf^,size );
fs.Free ;
//
//set to 0, zip_source_free must be called
source:=zip_source_buffer(arch,buf,size ,0);
zip_file_add (arch,'libz.dll',source,0);
zip_source_free(source);

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  err:integer;
begin
init;
arch:=zip_open('test.zip',0,@err);
if arch=nil then begin showmessage(inttostr(err));exit;end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if arch=nil then exit;
zip_close (arch);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
sb:pointer;
num:int64;
i:integer;
begin
if arch=nil then exit;
memo1.Clear ;
num:=zip_get_num_entries(arch,0);
sb:=AllocMem(sizeof(tzip_stat));

for i:=0 to num-1 do
  begin
  zip_stat_index(arch,i,0,sb);
  memo1.Lines.Add (pzip_stat(sb)^.name);
  end;
end;

end.
