//delphi unit for libzip


unit libzip;

interface

uses windows,sysutils;

  type
  UINT8 = System.Byte;
  UINT16 = System.Word;
  UINT32 = System.Longword;
{$IFNDEF UINT64}
  UINT64 = System.INT64;
{$ENDIF}
  INT16 = System.Smallint;
  INT32 = System.Longint;
  INT64 = System.INT64;
  TUINT32Array = array of UINT32;
  PUINT32 = ^UINT32;
  PBYTE = ^byte;

type tzip_stat =record
     valid:int64;                 //* which fields have valid values */
     name:pchar;                   //* name of the file */
     index:int64;                 //* index within archive */
     size:int64;                  //* size of file (uncompressed) */
     comp_size:int64;             //* size of file (compressed) */
     mtime:filetime;                       //* modification time */
     crc:dword;                   //* crc of file data */
     comp_method:word;           //* compression method used */
     encryption_method:word;     //* encryption method used */
     flags:dword;                 //* reserved for future use */
end;
pzip_stat=^tzip_stat;

procedure init;

var
arch:pointer;

zip_open:function(path:pchar;flags:integer;errorp:pinteger):pointer;cdecl;
zip_close:function(archive:pointer):integer;cdecl;

zip_file_add:function(archive:pointer;name:pchar;source:pointer;flags:integer):int64;cdecl;
zip_file_replace:function(archive:pointer;index:int64;source:pointer;flags:integer):integer;cdecl;

zip_source_buffer:function(archive:pointer;data:pointer;len:int64;freep:integer):pointer;cdecl;
zip_source_free:procedure(source:pointer);cdecl;

zip_stat_index:function(archive:pointer; index:int64;flags:integer;sb:pointer):integer;cdecl;
zip_get_num_entries:function(archive:pointer; flags:integer):int64;cdecl;

implementation

var
lib:thandle=thandle(-1);

function Swap16(ASmallInt : SmallInt) : SmallInt ; register ;
 asm  xchg al,ah  end ;

function Swap32(value : dword) : dword ; assembler ;
  asm  bswap eax  end ;

procedure init;
begin
lib:=LoadLibrary('libzip.dll');
if lib=thandle(-1) then exit;


@zip_open:=getprocaddress(lib,'zip_open');
@zip_close:=getprocaddress(lib,'zip_close');

@zip_file_add:=getprocaddress(lib,'zip_file_add');
@zip_file_replace:=getprocaddress(lib,'zip_file_replace');

@zip_source_buffer:=getprocaddress(lib,'zip_source_buffer');
@zip_source_free:=getprocaddress(lib,'zip_source_free');

@zip_stat_index:= getprocaddress(lib,'zip_stat_index');
@zip_get_num_entries:=getprocaddress(lib,'zip_get_num_entries');

if not assigned (zip_open) then raise exception.create('zip_open unassigned');
//
end;




end.
