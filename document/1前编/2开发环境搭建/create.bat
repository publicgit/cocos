@echo off
::set batpath=%~dp0bin
::set batpath="%batpath%bin\create_project.bat"
set batpath="H:\works\Cocos2d-lua_quick\quick\quick-cocos2d-x-2.2.6-release\bin\create_project.bat"

:label1
@cls
echo ��ӭʹ�ÿ�ݴ���quick-Cocos2d-x����
set /p uid=��������Ҫ�����Ĺ��̰� �� com.quick:
set /p project=��������Ҫ�����Ĺ����� �� testgame:
echo ������Ĺ��̰�Ϊ%uid%
echo ������Ĺ��̰�Ϊ%project%
echo ������Ĺ�����ϢΪ%uid%.%project%

if exist %project% ( 
	echo �������Ѵ��ڣ����������� 
	pause
	goto label1 
)

echo ȷ�ϴ���������?
CHOICE /C 123 /M "ȷ���밴 1��ȡ���밴 2�������˳��밴 3��"
echo %errorlevel%
if %errorlevel%==1 goto label2
if %errorlevel%==2 goto label1
if %errorlevel%==3 goto label3
:label2
echo %batpath%
echo ���ڴ�������...
%batpath% -p "%uid%.%project%"
:label3
pause