unit ufrmdemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,libzip, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    ListView1: TListView;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
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
filename:string;
begin
OpenDialog1.Filter :='*.*|*.*';
OpenDialog1.Execute ;
filename:=  OpenDialog1.FileName;
if filename ='' then exit;
if arch=nil then exit;

//
FS := TFileStream.Create(filename, fmOpenRead or fmShareDenyWrite);
size:=fs.Size;
buf:=AllocMem(size );
fs.ReadBuffer(buf^,size );
fs.Free ;
//
//set to 0, zip_source_free must be called
source:=zip_source_buffer(arch,buf,size ,0);
if zip_file_add (arch,pchar(ExtractFileName(filename)),source,0)=-1 then showmessage('zip_file_add failed');
zip_source_free(source);
//
Button2Click(self);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  err:integer;
  filename:string;
begin
init;
//
OpenDialog1.InitialDir :=ExtractFileDir(Application.ExeName ); 
OpenDialog1.Filter :='*.zip|*.zip';
OpenDialog1.Execute ;
filename:=  OpenDialog1.FileName;
if filename ='' then exit;
//
arch:=zip_open(pchar(filename),0,@err);
if arch=nil then begin showmessage(inttostr(err));exit;end;
//
Button2Click(self);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if arch=nil then exit;
zip_close (arch);
ListView1.Clear ;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
sb:pointer;
num:int64;
i:integer;
lv:tlistitem;
begin
if arch=nil then exit;
ListView1.Clear ;
num:=zip_get_num_entries(arch,0);
sb:=AllocMem(sizeof(tzip_stat));

for i:=0 to num-1 do
  begin
  zip_stat_index(arch,i,0,sb);
  lv:=ListView1.Items.Add ;
  lv.Caption :=pzip_stat(sb)^.name;
  lv.SubItems.Add(inttostr(pzip_stat(sb)^.size ));
  lv.SubItems.Add(inttostr(pzip_stat(sb)^.comp_size  ));
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
item:string;
index:int64;
begin
if arch=nil then exit;
if ListView1.Selected =nil then exit;
item:=ListView1.Selected.Caption ;
index:=zip_name_locate(arch,pchar(item),0);
if index=-1 then
  begin
  showmessage('wrong index');
  exit;
  end;
if zip_delete (arch,index)=-1 then showmessage('zip_delete failed');
//
Button2Click(self);
end;

procedure TForm1.Button6Click(Sender: TObject);
var
item:string;
index,size:int64;
file_,data:pointer;
sb:pointer;
fs:TFileStream;
begin
if arch=nil then exit;
if ListView1.Selected =nil then exit;
item:=ListView1.Selected.Caption ;
//showmessage((ListView1.Selected.SubItems[0]));
//size:=strtoint64(ListView1.Selected.SubItems[0]); //not working??
index:=zip_name_locate(arch,pchar(item),0);
if index=-1 then
  begin
  showmessage('wrong index');
  exit;
  end;
// size
sb:=AllocMem(sizeof(tzip_stat));
zip_stat_index(arch,index,0,sb);
size:=pzip_stat(sb)^.size;
//open
file_:=nil;
file_:=zip_fopen_index(arch,index,0);
data:=allocmem(size);
size:= zip_fread (file_,data,size);
if size=-1 then showmessage('zip_fread failed');
//
FS := TFileStream.Create(pzip_stat(sb)^.name , fmCreate);
fs.Position :=0;
//fs.Size:=size;
fs.writeBuffer(data^,size );
fs.Free ;
//
zip_fclose (file_);

end;

end.
