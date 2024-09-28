program ClassConsoleExample;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  aaa = class
  private
    aname: string;
    aage: Byte;

  public
    //class的构造函数，一定要写
    constructor create;
    procedure setinfo(_name: string; _age: Byte);
    function showinfo(): string;
  end;

constructor aaa.create;
begin
//  inherited;
end;

procedure aaa.setinfo(_name: string; _age: Byte);
begin
  aname := _name;
  aage := _age;
end;

function aaa.showinfo(): string;
begin
  Writeln('name:', aname);
  Writeln('age:', aage);
end;

var
  aa: aaa;

begin
  try
    aa := aaa.create;
    aa.setinfo('tom', 22);
    aa.showinfo();
  finally
    aa.Free;
  end;
  Readln;
end.
