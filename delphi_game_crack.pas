unit game_crack;
    
interface
uses
    windows,Messages,SysUtils, Classes;
//
//被调用时,需先在此声明函数体.
//否则被调用时提示 函数名未定义
function readValue(gameName:string;baseAddress:DWORD):integer;//根据内存地址读取数值
function writeValue(gameName:string;baseAddress:DWORD;newValue:DWORD):integer;//根据内存地址写入新的数值


    
implementation

////根据内存地址读取数值    
 function readValue(gameName:string;baseAddress:DWORD):integer;
    var
    gameHwnd:hwnd;
    gamePid:DWORD;
    gameHandle:DWORD;
    gameBaseAddress:DWORD;
    game_findValue:DWORD;
    tempValue:DWORD;
begin
gameHwnd:=findwindow(nil,PAnsichar(AnsiString(gameName)));//获取游戏的句柄,根据游戏名
GetWindowThreadProcessId(gameHwnd,@gamePid);//获取进程ID,根据游戏程序的句柄
gameHandle:=OpenProcess(PROCESS_ALL_ACCESS,false,gamePid);//打开进程
gameBaseAddress:=baseAddress;

ReadProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_findValue),sizeof(game_findValue),tempValue);
result:=game_findValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;

//根据内存地址写入新的数值
function writeValue(gameName:string;baseAddress:DWORD;newValue:DWORD):integer;
    var
    gameHwnd:hwnd;
    gamePid:DWORD;
    gameHandle:DWORD;
    gameBaseAddress:DWORD;
    game_newValue:DWORD;
    tempValue:DWORD;
begin
gameHwnd:=findwindow(nil,PAnsichar(AnsiString(gameName)));//获取游戏的句柄,根据游戏名
GetWindowThreadProcessId(gameHwnd,@gamePid);//获取进程ID,根据游戏程序的句柄
gameHandle:=OpenProcess(PROCESS_ALL_ACCESS,false,gamePid);//打开进程
gameBaseAddress:=baseAddress;
game_newValue:=newValue;

WriteProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_newValue),sizeof(game_newValue),tempValue);
result:=game_newValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;


//程序代码结束    
end.