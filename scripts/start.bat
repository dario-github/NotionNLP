@echo off

color 0a
:main
echo 1. English
echo 2. ��������
echo=
set /p language=Choose Language(Enter the number) / ѡ������ (�������):

if %language% == 1 (start English.bat)
if %language% == 2 (start ����.bat)

echo Please choose 1 or 2 / ��ѡ��1��2
cls
goto main