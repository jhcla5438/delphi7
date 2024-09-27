unit game_crack;
    
interface
uses
    windows,Messages,SysUtils, Classes;

//被调用时,需先在此声明函数体
//否则被调用时提示 函数名未定义

//------------------------------------------------------------------------------------------
// Byte: 1 字节
// Word: 2 字节
// Dword: 4 字节
// Single: 4字节
// Double: 8字节
//------------------------------------------------------------------------------------------
//读取整数
function readValue(gameName:string;baseAddress:DWORD;Number_of_bytes_read:Byte):DWORD;

//读取单精度浮点数
function readValueF(gameName:string;baseAddress:DWORD;Number_of_bytes_read:Byte):Single;

//双精度浮点数读取
function readValueD(gameName:string;baseAddress:DWORD;Number_of_bytes_read:Byte):Double;

//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------

//写入整数
function writeValue(gameName:string;baseAddress:DWORD;newValue:DWORD;Number_of_bytes_write:Byte):DWORD;

//写入 单精度浮点数
function writeValueF(gameName:string;baseAddress:DWORD;newValue:Single;Number_of_bytes_write:Byte):Single;

//写入  双精度浮点数
function writeValueD(gameName:string;baseAddress:DWORD;newValue:Double;Number_of_bytes_write:Byte):Double;
//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------

implementation

////根据内存地址读取数值    
 function readValue(gameName:string;baseAddress:DWORD;Number_of_bytes_read:Byte):DWORD;
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

//ReadProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_findValue),sizeof(game_findValue),tempValue);
ReadProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_findValue),Number_of_bytes_read,tempValue);
result:=game_findValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;

//单精度浮点数读取
 function readValueF(gameName:string;baseAddress:DWORD;Number_of_bytes_read:Byte):Single;
    var
    gameHwnd:hwnd;
    gamePid:DWORD;
    gameHandle:DWORD;
    gameBaseAddress:DWORD;
    game_findValue:Single;
    tempValue:DWORD;
begin
gameHwnd:=findwindow(nil,PAnsichar(AnsiString(gameName)));//获取游戏的句柄,根据游戏名
GetWindowThreadProcessId(gameHwnd,@gamePid);//获取进程ID,根据游戏程序的句柄
gameHandle:=OpenProcess(PROCESS_ALL_ACCESS,false,gamePid);//打开进程
gameBaseAddress:=baseAddress;

//ReadProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_findValue),sizeof(game_findValue),tempValue);
ReadProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_findValue),Number_of_bytes_read,tempValue);
result:=game_findValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;

//双精度浮点数读取
 function readValueD(gameName:string;baseAddress:DWORD;Number_of_bytes_read:Byte):Double;
    var
    gameHwnd:hwnd;
    gamePid:DWORD;
    gameHandle:DWORD;
    gameBaseAddress:DWORD;
    game_findValue:Double;
    tempValue:DWORD;
begin
gameHwnd:=findwindow(nil,PAnsichar(AnsiString(gameName)));//获取游戏的句柄,根据游戏名
GetWindowThreadProcessId(gameHwnd,@gamePid);//获取进程ID,根据游戏程序的句柄
gameHandle:=OpenProcess(PROCESS_ALL_ACCESS,false,gamePid);//打开进程
gameBaseAddress:=baseAddress;

//ReadProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_findValue),sizeof(game_findValue),tempValue);
ReadProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_findValue),Number_of_bytes_read,tempValue);
result:=game_findValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;


//根据内存地址写入新的数值 整数型
function writeValue(gameName:string;baseAddress:DWORD;newValue:DWORD;Number_of_bytes_write:Byte):DWORD;
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

WriteProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_newValue),Number_of_bytes_write,tempValue);
result:=game_newValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;


//根据内存地址写入新的数值 单精度浮点数型
function writeValueF(gameName:string;baseAddress:DWORD;newValue:Single;Number_of_bytes_write:Byte):Single;
    var
    gameHwnd:hwnd;
    gamePid:DWORD;
    gameHandle:DWORD;
    gameBaseAddress:DWORD;

    tempValue:DWORD;
begin
gameHwnd:=findwindow(nil,PAnsichar(AnsiString(gameName)));//获取游戏的句柄,根据游戏名
GetWindowThreadProcessId(gameHwnd,@gamePid);//获取进程ID,根据游戏程序的句柄
gameHandle:=OpenProcess(PROCESS_ALL_ACCESS,false,gamePid);//打开进程
gameBaseAddress:=baseAddress;

WriteProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@newValue),Number_of_bytes_write,tempValue);
result:=newValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;

//根据内存地址写入新的数值 双精度浮点数型
function writeValueD(gameName:string;baseAddress:DWORD;newValue:Double;Number_of_bytes_write:Byte):Double;
    var
    gameHwnd:hwnd;
    gamePid:DWORD;
    gameHandle:DWORD;
    gameBaseAddress:DWORD;

    tempValue:DWORD;
begin
gameHwnd:=findwindow(nil,PAnsichar(AnsiString(gameName)));//获取游戏的句柄,根据游戏名
GetWindowThreadProcessId(gameHwnd,@gamePid);//获取进程ID,根据游戏程序的句柄
gameHandle:=OpenProcess(PROCESS_ALL_ACCESS,false,gamePid);//打开进程
gameBaseAddress:=baseAddress;

WriteProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@newValue),Number_of_bytes_write,tempValue);
result:=newValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;


//程序代码结束    
end.