@echo off

color 0a

:main
echo 1. English
echo 2. ��������

echo=
set /p language=Choose Language / ѡ������:

if %language% == 1 && (start cmd call .\English.bat) || goto main
if %language% == 2 && (start cmd call .\����.bat) || goto main