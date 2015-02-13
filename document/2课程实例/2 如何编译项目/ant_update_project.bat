@echo off
set cocos2d_java_lib_local=H:\works\Cocos2d-lua_quick\quick\quick-cocos2d-x-2.2.6-release\lib\cocos2d-x\cocos2dx\platform\android\java\
set sdk_path=%ANDROID_SDK_ROOT%
echo 当前sdk 环境变量为： %sdk_path%
set ant_path=%ANT_ROOT%
echo 当前ant 环境变量为： %ant_path%

::是否设置了 sdk 的环境变量
if "%sdk_path%"=="" (
	echo 没有设置 ANDROID_SDK_ROOT 请先设置好再执行该命令
	goto label_exit
)

::是否设置了 ant 的环境变量
if "%ant_path%"=="" (
	echo 没有设置 ANT_ROOT 请先设置好再执行该命令
	goto label_exit
)

::目录无效
if not exist "%cocos2d_java_lib_local%"  (
	echo 该命令配置目录 %cocos2d_java_lib_local% 无效,请修改配置指定 quick-cocos2d-x 的 lib\cocos2d-x\cocos2dx\platform\android\java 目录
	goto label_exit 
)

:label1
@cls
set /p projectname=请输入要设置 Android 版本号的 项目名 如 testgame : 
set /p android_ver=请输入要设置 的 Android 版本号 如 1 或者 "android-8" 详细信息可以 在dos 中 输入 android.bat list targets 查看 : 
echo 您输入的工程包为 %projectname%
echo 您输入的Android 版本号为 %android_ver%

if not exist %projectname% ( 
	echo 项目不存在，请重新输入 
	pause
	goto label1 
)

echo 确认要更改Android 版本号?
CHOICE /C 123 /M "确认请按 1，取消请按 2，或者退出请按 3。"
echo %errorlevel%
if %errorlevel%==1 goto label2
if %errorlevel%==2 goto label1
if %errorlevel%==3 goto label_exit

:label2
echo 正在更新配置文件...
android update project --name %projectname% -t %android_ver% -p ./%projectname%/proj.android --subprojects

echo 执行完毕
goto label_exit
	
:label_exit
pause
