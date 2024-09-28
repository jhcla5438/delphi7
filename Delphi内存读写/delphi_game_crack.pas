unit game_crack;
    
interface
uses
    windows,Messages,SysUtils, Classes;

//被调用时,需先在此声明函数体
//否则被调用时提示 函数名未定义

//------------------------------------------------------------------------------------------
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

var
    //表示游戏的窗口,是个句柄.
    gameHwnd:hwnd;

    //游戏进程在任务管理器中显示的PID.它是根据游戏的窗口(gameHwnd)获取的游戏线程的ID(有些程序有多个线程会显示多个PID).
    gamePid:DWORD;

    //表示游戏进程的句柄,是根据游戏进程的PID值(gamePid)获取的游戏进程的句柄,后续用于操作游戏内存
    gameHandle:DWORD;

    //基地址,游戏中各种变量在内存中的地址,例如生命值..
    gameBaseAddress:DWORD;

    //游戏中某个变量的具体数值,例如游戏中生命值=100,game_findVlaue就是100.是根据gameBaseAddress获取到的具体的数值.
    game_findValue:DWORD;

    //输出用的指针,将实际读取到的字节数写入到它指向的一块内存空间,如果用不到可设为nil,但在Delphi7中会提示"形参与实参不一致".
    //设置这个变量的目的是 防止程序报错-"形参与实参不一致"
    tempValue:DWORD;

//第一步 获取游戏程序的窗口
//第二步 根据窗口获得进程PID
//第三步 根据PID获取游戏进程的句柄
//第四步 根据进程句柄操作游戏内存,如获取生命值,设置防御力,获取金钱数量,设置体力..



//Byte型,Word型,Dword型整数的读取  
 function readValue(gameName:string;baseAddress:DWORD;Number_of_bytes_read:Byte):DWORD;
begin
gameHwnd:=findwindow(nil,PAnsichar(AnsiString(gameName)));//获取游戏的句柄,根据游戏名
GetWindowThreadProcessId(gameHwnd,@gamePid);//获取进程ID,根据游戏程序的句柄
gameHandle:=OpenProcess(PROCESS_ALL_ACCESS,false,gamePid);//打开进程
gameBaseAddress:=baseAddress;

ReadProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_findValue),Number_of_bytes_read,tempValue);
result:=game_findValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;




//单精度浮点数读取
 function readValueF(gameName:string;baseAddress:DWORD;Number_of_bytes_read:Byte):Single;
    var
    game_findValue:Single;//用于存储 单精度数值

begin
gameHwnd:=findwindow(nil,PAnsichar(AnsiString(gameName)));//获取游戏的句柄,根据游戏名
GetWindowThreadProcessId(gameHwnd,@gamePid);//获取进程ID,根据游戏程序的句柄
gameHandle:=OpenProcess(PROCESS_ALL_ACCESS,false,gamePid);//打开进程
gameBaseAddress:=baseAddress;

ReadProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_findValue),Number_of_bytes_read,tempValue);
result:=game_findValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;





//双精度浮点数读取
 function readValueD(gameName:string;baseAddress:DWORD;Number_of_bytes_read:Byte):Double;
    var
    game_findValue:Double;//用于存储 双精度数值

begin
gameHwnd:=findwindow(nil,PAnsichar(AnsiString(gameName)));//获取游戏的句柄,根据游戏名
GetWindowThreadProcessId(gameHwnd,@gamePid);//获取进程ID,根据游戏程序的句柄
gameHandle:=OpenProcess(PROCESS_ALL_ACCESS,false,gamePid);//打开进程
gameBaseAddress:=baseAddress;

ReadProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@game_findValue),Number_of_bytes_read,tempValue);
result:=game_findValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;




//Byte型,Word型,Dword型整数的写入
function writeValue(gameName:string;baseAddress:DWORD;newValue:DWORD;Number_of_bytes_write:Byte):DWORD;
begin
gameHwnd:=findwindow(nil,PAnsichar(AnsiString(gameName)));//获取游戏的句柄,根据游戏名
GetWindowThreadProcessId(gameHwnd,@gamePid);//获取进程ID,根据游戏程序的句柄
gameHandle:=OpenProcess(PROCESS_ALL_ACCESS,false,gamePid);//打开进程
gameBaseAddress:=baseAddress;

WriteProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@newValue),Number_of_bytes_write,tempValue);
result:=newValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;




//单精度浮点数型的写入
function writeValueF(gameName:string;baseAddress:DWORD;newValue:Single;Number_of_bytes_write:Byte):Single;
begin
gameHwnd:=findwindow(nil,PAnsichar(AnsiString(gameName)));//获取游戏的句柄,根据游戏名
GetWindowThreadProcessId(gameHwnd,@gamePid);//获取进程ID,根据游戏程序的句柄
gameHandle:=OpenProcess(PROCESS_ALL_ACCESS,false,gamePid);//打开进程
gameBaseAddress:=baseAddress;

WriteProcessMemory(gameHandle,Pointer(gameBaseAddress),Pointer(@newValue),Number_of_bytes_write,tempValue);
result:=newValue;

CloseHandle(gameHandle);//关闭游戏程序的句柄,释放内存
end;




//双精度浮点数型的写入
function writeValueD(gameName:string;baseAddress:DWORD;newValue:Double;Number_of_bytes_write:Byte):Double;
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