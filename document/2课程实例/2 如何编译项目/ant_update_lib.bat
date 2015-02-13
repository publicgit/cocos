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

::���� local.properties �ļ�
if exist "%cocos2d_java_lib_local%local.properties" (
	echo ��Ŀ¼�ѳ�ʼ������������ִ�и�����
	goto label_exit
)
	
echo ���ڳ�ʼ��...
android update lib-project -p %cocos2d_java_lib_local%
echo ִ�����
goto label_exit
	
:label_exit
pause
