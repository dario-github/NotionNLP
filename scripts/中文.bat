@echo off

color 0a

:main
echo ================= �� Notion ��Ȼ���Դ��� �� =====================
echo=
echo ����:  Dario Zhang
echo �汾:  v1.0.5.1
echo ����:  https://github.com/dario-github/notion-nlp
echo ����:  ��Notion���ݿ��ж�ȡ�ı���������Ȼ���Դ������
echo=
echo =====================   �ƹ���   ==============================
echo=                                   
echo ��������:  https://reurl.cc/7R3MeN
echo=
echo ==============================================================
echo=
echo 1. ִ����������
echo 2. �鿴������Ϣ
echo 3. ������������
echo 4. ���е�������
echo 5. ���������¼�

echo=
set /p opt=ѡ�� ��������ţ���

if %opt% == 1 goto one
if %opt% == 2 goto two
if %opt% == 3 goto three
if %opt% == 4 goto four
if %opt% == 5 goto five

echo ��Чѡ��
cls
goto main

:one
.\notion-nlp-win64.exe first-try || (set /p tmp=̫��ϧ��~ δ֪�������������ߴ����ǵø�������Ĵ�����־Ŷ~ ������ճ����־ ==> https://reurl.cc/b7nDkl && exit)
start notepad ".\Temp-dataset\configs\notion.test.yaml"
start explorer ".\Temp-dataset\results"
echo �Ѵ򿪲����ļ����������ɽ�������������ʹ��˵���޸Ĳ����ļ���https://github.com/dario-github/notion-nlp/blob/main/README.zh.md#%E4%BD%BF%E7%94%A8 
set /p tmp=ִ����ϣ��밴�س������ز˵�...
cls
goto main

:two
set /p file=����������ļ���ַ [Default: .\Temp-dataset\configs\notion.yaml]: 
if not defined file set file=.\Temp-dataset\configs\notion.yaml
.\notion-nlp-win64.exe task-info --config-file %file% || ((echo δ�ҵ������ļ������ô���) && (goto two))
set /p tmp=ִ����ϣ��밴�س������ز˵�...
cls
goto main

:three
set /p file=����������ļ���ַ [Default: .\Temp-dataset\configs\notion.yaml]: 
if not defined file set file=.\Temp-dataset\configs\notion.yaml
.\notion-nlp-win64.exe run-all-tasks --config-file %file% || ((echo δ�ҵ������ļ������ô���) && (goto three))
set /p tmp=ִ����ϣ��밴�س������ز˵�...
cls
goto main

:four
set /p name=����������ļ��е�������
if not defined four goto four
set /p file=����������ļ���ַ [Default: .\Temp-dataset\configs\notion.yaml]: 
if not defined file set file=.\Temp-dataset\configs\notion.yaml
.\notion-nlp-win64.exe run-task --task-name %name% --config-file %file%  || ((echo δ�ҵ������ļ������ô���) && (goto four))
set /p tmp=ִ����ϣ��밴�س������ز˵�...
cls
goto main

:five
color 2
echo 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0
ping localhost -n 1 >nul
echo 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 2 3 1 5 4 6 4 6 5 4 6 5 4
ping localhost -n 1 >nul
echo 7 9 4 6 5 4 9 8 7 4 1 6 5 4 9 8 7 4 6 8 7 4 6 5 1 3 5 4 9 8 7 4 1 1 3 2 1 3 1
ping localhost -n 1 >nul
echo 1 3 5 4 1 6 5 4 6 1 3 2 4 8 6 4 3 5 4 1 6 5 4 6 1 3 8 7 4 6 5 4 5 4 6 8 1 3 5
ping localhost -n 1 >nul
echo 7 1 9 1 8 7 3 4 2 5 7 8 4 1 3 6 5 7 8 4 1 3 5 4 9 4 1 9 8 7 3 8 7 9 8 7 4 5 6
ping localhost -n 1 >nul
goto five

