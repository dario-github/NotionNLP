chcp 65001 > nul 2>&1
@echo off

color 0a
:main
echo 1. English
echo 2. 简体中文
echo=
set /p language=Choose Language(Enter the number) / 选择语言 (输入序号):

if %language% == 1 (start English.bat)
if %language% == 2 (start Chinese-simple.bat)

echo Please choose 1 or 2 / 请选择 1 或 2 
cls
goto main