@echo off
::set batpath=%~dp0bin
::set batpath="%batpath%bin\create_project.bat"
set batpath="H:\works\Cocos2d-lua_quick\quick\quick-cocos2d-x-2.2.6-release\bin\create_project.bat"

:label1
@cls
echo 欢迎使用快捷创建quick-Cocos2d-x工程
set /p uid=请输入需要创建的工程包 如 com.quick:
set /p project=请输入需要创建的工程名 如 testgame:
echo 您输入的工程包为%uid%
echo 您输入的工程包为%project%
echo 您输入的工程信息为%uid%.%project%

if exist %project% ( 
	echo 工程名已存在，请重新输入 
	pause
	goto label1 
)

echo 确认创建工程吗?
CHOICE /C 123 /M "确认请按 1，取消请按 2，或者退出请按 3。"
echo %errorlevel%
if %errorlevel%==1 goto label2
if %errorlevel%==2 goto label1
if %errorlevel%==3 goto label3
:label2
echo %batpath%
echo 正在创建工程...
%batpath% -p "%uid%.%project%"
:label3
pause