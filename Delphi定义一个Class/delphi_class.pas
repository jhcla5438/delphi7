program ClassConsoleExample;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TMyClass = class
  private
    FValue: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetValue(Value: Integer);
    function GetValue: Integer;
  end;

constructor TMyClass.Create;
begin
  inherited;
  FValue := 0;
end;

destructor TMyClass.Destroy;
begin
  inherited;
end;

procedure TMyClass.SetValue(Value: Integer);
begin
  FValue := Value;
end;

function TMyClass.GetValue: Integer;
begin
  Result := FValue;
end;

//------------------------

var
  MyObject: TMyClass;

begin
  try
    MyObject := TMyClass.Create;
    MyObject.SetValue(100);
    Writeln('Value in the class: ', MyObject.GetValue);
  finally
    MyObject.Free;
  end;
  Readln;
end.