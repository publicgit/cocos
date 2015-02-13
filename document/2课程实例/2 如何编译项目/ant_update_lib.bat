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

::已有 local.properties 文件
if exist "%cocos2d_java_lib_local%local.properties" (
	echo 该目录已初始化过，无需再执行该命令
	goto label_exit
)
	
echo 正在初始化...
android update lib-project -p %cocos2d_java_lib_local%
echo 执行完毕
goto label_exit
	
:label_exit
pause
