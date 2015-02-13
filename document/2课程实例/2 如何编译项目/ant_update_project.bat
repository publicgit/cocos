@echo off
set cocos2d_java_lib_local=H:\works\Cocos2d-lua_quick\quick\quick-cocos2d-x-2.2.6-release\lib\cocos2d-x\cocos2dx\platform\android\java\
set sdk_path=%ANDROID_SDK_ROOT%
echo ��ǰsdk ��������Ϊ�� %sdk_path%
set ant_path=%ANT_ROOT%
echo ��ǰant ��������Ϊ�� %ant_path%

::�Ƿ������� sdk �Ļ�������
if "%sdk_path%"=="" (
	echo û������ ANDROID_SDK_ROOT �������ú���ִ�и�����
	goto label_exit
)

::�Ƿ������� ant �Ļ�������
if "%ant_path%"=="" (
	echo û������ ANT_ROOT �������ú���ִ�и�����
	goto label_exit
)

::Ŀ¼��Ч
if not exist "%cocos2d_java_lib_local%"  (
	echo ����������Ŀ¼ %cocos2d_java_lib_local% ��Ч,���޸�����ָ�� quick-cocos2d-x �� lib\cocos2d-x\cocos2dx\platform\android\java Ŀ¼
	goto label_exit 
)

:label1
@cls
set /p projectname=������Ҫ���� Android �汾�ŵ� ��Ŀ�� �� testgame : 
set /p android_ver=������Ҫ���� �� Android �汾�� �� 1 ���� "android-8" ��ϸ��Ϣ���� ��dos �� ���� android.bat list targets �鿴 : 
echo ������Ĺ��̰�Ϊ %projectname%
echo �������Android �汾��Ϊ %android_ver%

if not exist %projectname% ( 
	echo ��Ŀ�����ڣ����������� 
	pause
	goto label1 
)

echo ȷ��Ҫ����Android �汾��?
CHOICE /C 123 /M "ȷ���밴 1��ȡ���밴 2�������˳��밴 3��"
echo %errorlevel%
if %errorlevel%==1 goto label2
if %errorlevel%==2 goto label1
if %errorlevel%==3 goto label_exit

:label2
echo ���ڸ��������ļ�...
android update project --name %projectname% -t %android_ver% -p ./%projectname%/proj.android --subprojects

echo ִ�����
goto label_exit
	
:label_exit
pause
