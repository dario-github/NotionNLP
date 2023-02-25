@echo off

color 0a
:: �״�ִ�нű���������Դ�ļ�
if not exist ".\Temp-dataset\configs\notion.yaml" (
    echo ��⵽�ű��״�ִ�У���������Դ�ļ���ִ���������������ĵȴ� 1-3 min...
    .\notion-nlp-win64.exe first-try || ((echo ̫��ϧ��~����δ֪�������������ߴ����ǵø�������Ĵ�����־Ŷ~������ճ����־ ==> https://reurl.cc/b7nDkl) && pause) 
    echo ����������ִ����ϣ��밴�س����鿴����ͼ������Ŀ¼
    set /p tmp=�鿴����Ч�����뷵�ر����ڣ�������һ����...
    start "" ".\Temp-dataset\results\wordcloud\zh_unit_testing_task\colormap_viridis.png"
    start "" ".\Temp-dataset\results\wordcloud\zh_unit_testing_task"
    echo=
    set /p tmp=�밴�س����鿴�����ܽ�markdown�ĵ�...
    start "" ".\Temp-dataset\results\tfidf_analysis\zh_unit_testing_task\zh_unit_testing_task.top_5.md"
    echo=
    echo ��������Լ������񣿽̳�ָ�� ==> https://github.com/dario-github/notion-nlp/blob/main/README.zh.md#%E4%BD%BF%E7%94%A8
    echo=
    set /p tmp=�밴�س����򿪲����ļ�����ʼ�������Լ�������...
    copy /y ".\Temp-dataset\configs\notion.test.yaml" ".\Temp-dataset\configs\notion.yaml" > nul
    start "" ".\Temp-dataset\configs\notion.yaml"
    echo=
    echo /p tmp=�밴�س����������˵�...
    cls
) else (
    echo=
)

color 0a
:main
color 0a
echo ================= �� Notion ��Ȼ���Դ��� �� =====================
echo=
echo ����:  Dario Zhang
echo �汾:  v1.0.6
echo ����:  https://github.com/dario-github/notion-nlp
echo ����:  ��Notion���ݿ��ж�ȡ�ı���������Ȼ���Դ������
echo=
echo =====================   �ƹ���   ==============================
echo=                                   
echo ��������:  https://reurl.cc/7R3MeN
echo=
echo ==============================================================
echo=
echo 1. �鿴������Ϣ
echo 2. ������������
echo 3. ����ָ������
echo 4. ������������

echo=
set /p opt=ѡ�� (�������):

if %opt% == 1 goto one
if %opt% == 2 goto two
if %opt% == 3 goto three
if %opt% == 4 goto lastopt

echo ��Чѡ��
cls
goto main

:: �鿴������Ϣ
:one
.\notion-nlp-win64.exe task-info --config-file ".\Temp-dataset\configs\notion.yaml"
IF %ERRORLEVEL% EQU 0 GOTO endresult
echo δ�ҵ������ļ������ô����밴�ս̳̼�������ļ�
goto main

:: ִ����������
:two
.\notion-nlp-win64.exe run-all-tasks --config-file ".\Temp-dataset\configs\notion.yaml"
IF %ERRORLEVEL% EQU 0 GOTO endresult
echo δ�ҵ������ļ������ô����밴�ս̳̼�������ļ�
goto main

:: ִ�е�������
:three
set /p name=����������ļ��е������������� info �鿴����������Ϣ: 
if not defined name goto three
if %name% == info goto one
.\notion-nlp-win64.exe run-task --task-name %name% --config-file ".\Temp-dataset\configs\notion.yaml"
IF %ERRORLEVEL% EQU 0 GOTO endresult
echo δ�ҵ������ļ������ô����밴�ս̳̼�������ļ�
goto main


:endresult
echo=
echo  �������������[ �����[  �����[
echo �����X�T�T�T�����[�����U �����T�a
echo �����U   �����U���������U
echo �����U   �����U�����U �����[
echo �^�������������X�a�����U�[ �����[
echo  �^�T�T�T�T�T�a �^�T�T�a �^�T�a
echo=
set /p tmp=ִ����ϣ��밴�س������ز˵�...
cls
goto main


:lastopt
cls
mode 200,60
:# Windows Version control. Assigns flag true if system is windows 10.
 Set "Win10="
 Ver | Findstr /LIC:" 10." > nul && Set "Win10=true"

:# Test if virtual terminal codes enabled ; enable if false
:# removes win10 flag definition if version does not support Virtual Terminal sequences
 If defined Win10 (
  Reg Query HKCU\Console | %SystemRoot%\System32\findstr.exe /LIC:"VirtualTerminalLevel    REG_DWORD    0x1" > nul || (
    Reg Add HKCU\Console /f /v VirtualTerminalLevel /t REG_DWORD /d 1
  ) > Nul || Set "Win10="
 )
 If not defined Win10 (
  Echo(Virtual terminal sequences not supported on your system
  Exit /B 1
 )

 If "%~1" == "" (
  Mode 200,150
  Cls
 )

:# /@ Switch requires clean working driectory to execute in.
 RD "%TEMP%\%~n0_Run" 2> nul && Timeout 1 > nul
 MD "%TEMP%\%~n0_Run"

(Set \n=^^^

%= \n macro newline variable. Do not modify =%)

:# assign virtual terminal control character 0x27 'escape' variable \E
 For /F %%a in ( 'Echo prompt $E ^| cmd' )Do Set "\E=%%a"

 Set $Cout_Switches="A" "Y" "X" "U" "D" "R" "L" "H" "Alt" "Main" "K" "Del" "I" "N" "T" "B" "C" "E" "S" "@"

 Set $Cout=For %%n in (1 2)Do if %%n==2 (%\n%
  For %%G in ( %$Cout_Switches% )Do Set "$Cout_Switch[%%~G]="%\n%
  If not "!$Cout_args:* /=!" == "!$Cout_args!" (%\n: build $Cout.Args[!$Cout_i.Arg!] array if args present =%
   Set "$Cout_leading.args=!$Cout_args:*/=!"%\n%
   For /F "Delims=" %%G in ("!$Cout_leading.args!")Do Set "$Cout_leading.args=!$Cout_args:/%%G=!"%\n%
   Set ^"$Cout_args=!$Cout_args:"=!"%\n%
   Set "$Cout_i.arg=0"%\n%
   For %%G in (!$Cout_leading.args!)Do (%\n%
    Set /A "$Cout_i.arg+=1"%\n%
    Set "$Cout_arg[!$Cout_i.arg!]=%%~G"%\n%
   )%\n%
  ) Else (%\n: remove doublequotes from args before switch processing =%
   Set ^"$Cout_args=!$Cout_args:"=!"%\n%
  )%\n%
  Set "$Cout_LastSwitch="%\n%
  For /L %%L in (2 1 4)Do If "!$Cout_LastSwitch!" == "" (%\n%
   If "!$Cout_Args:~-%%L,1!" == " " Set "$Cout_LastSwitch=_"%\n%
   If "!$Cout_Args:~-%%L,1!" == "/" (%\n: Flag last switch true if no subargs; Works for character switches of up to 3 characters =%
    For /F "Delims=" %%v in ('Set /A "%%L-1"')Do Set "$Cout_Switch[!$Cout_Args:~-%%v!]=true"%\n%
    If not "!$Cout_Args:/?=!." == "!$Cout_Args!." Set "$Cout_Switch[help]=true"%\n%
    Set "$Cout_Args=!$Cout_Args:~0,-%%L!"%\n%
    Set "$Cout_LastSwitch=_"%\n%
   )%\n%
  )%\n%
  For %%G in ( %$Cout_Switches% )Do If not "!$Cout_args:/%%~G =!" == "!$Cout_args!" (%\n%
   Set "$Cout_Switch[%%~G]=!$Cout_Args:*/%%~G =!"%\n%
   If not "!$Cout_Switch[%%~G]:*/=!" == "!$Cout_Switch[%%~G]!" (%\n%
    Set "$Cout_Trail[%%~G]=!$Cout_Switch[%%~G]:*/=!"%\n%
    For %%v in ("!$Cout_Trail[%%~G]!")Do (%\n%
     Set "$Cout_Switch[%%~G]=!$Cout_Switch[%%~G]: /%%~v=!"%\n%
     Set "$Cout_Switch[%%~G]=!$Cout_Switch[%%~G]:/%%~v=!"%\n%
    )%\n%
    Set "$Cout_Trail[%%~G]="%\n%
    If "!$Cout_Switch[%%~G]:~-1!" == " " Set "$Cout_Switch[%%~G]=!$Cout_Switch[%%~G]:~0,-1!"%\n%
    If "!$Cout_Switch[%%~G]!" == "" Set "$Cout_Switch[%%~G]=true"%\n%
   )%\n%
  )%\n%
  If /I "!$Cout_Switch[C]!" == "random" (%\n%
   If not "!$Cout_Switch[B]!" == ""   (Set "$Cout_MOD=100")Else Set "$Cout_MOD=200"%\n%
   Set /A "$Cout_RR=!random! %% !$Cout_MOD! + 50,$Cout_GG=!random! %% !$Cout_MOD! + 50,$Cout_BB=!random! %% !$Cout_MOD! + 50"%\n%
   If /I "!$Cout_Switch[B]!" == "R" Set "$Cout_RR=250"%\n%
   If /I "!$Cout_Switch[B]!" == "G" Set "$Cout_GG=250"%\n%
   If /I "!$Cout_Switch[B]!" == "B" Set "$Cout_BB=250"%\n%
   If /I "!$Cout_Switch[B]!" == "M" Set /A "$Cout_RR=!Random! %% 50 + 200,Cout_GG=0,$Cout_BB=!Random! %% 50 + 200"%\n%
   If /I "!$Cout_Switch[B]!" == "Y" Set /A "$Cout_RR=!Random! %% 90 + 100,Cout_GG=!Random! %% 90 + 90,$Cout_BB=0"%\n%
   If /I "!$Cout_Switch[B]!" == "C" Set /A "$Cout_RR=0,Cout_GG=!Random! %% 120 + 30,$Cout_BB=175"%\n%
   Set "$Cout_Switch[C]=38;2;!$Cout_RR!;!$Cout_GG!;!$Cout_BB!"%\n%
  )%\n%
  If "!$Cout_Switch[help]!" == "true" ((For /F "Tokens=1,2 Delims=#" %%Y in ('findstr /BLIC:"::#" "%~f0"')Do @Echo(%%Z)^| @More)%\n%
  If not "!$Cout_Switch[C]!" == ""    (Set "$Cout_Color=%\E%[!$Cout_Switch[C]:,=m%\E%[!m")Else Set "$Cout_Color="%\n%
  If not "!$Cout_Switch[Y]!" == ""    (Set "$Cout_Ypos=%\E%[!$Cout_Switch[Y]!d")Else Set "$Cout_Ypos="%\n%
  If not "!$Cout_Switch[X]!" == ""    (Set "$Cout_Xpos=%\E%[!$Cout_Switch[X]!G")Else Set "$Cout_Xpos="%\n%
  For %%d in (U D L R)Do if not "!$Cout_Switch[%%d]!" == "" (Set /A "$Cout_Switch[%%d]=!$Cout_Switch[%%d]!")%\n%
  If not "!$Cout_Switch[U]!" == ""    (Set "$Cout_Yoffset=%\E%[!$Cout_Switch[U]!A")Else Set "$Cout_Yoffset="%\n%
  If not "!$Cout_Switch[D]!" == ""    Set "$Cout_Yoffset=%\E%[!$Cout_Switch[D]!B"%\n%
  If not "!$Cout_Switch[R]!" == ""    (Set "$Cout_Xoffset=%\E%[!$Cout_Switch[R]!C")Else Set "$Cout_Xoffset="%\n%
  If not "!$Cout_Switch[L]!" == ""    Set "$Cout_Xoffset=%\E%[!$Cout_Switch[L]!D"%\n%
  If "!$Cout_Switch[H]!" == "-"       Set "$Cout_Cursor=%\E%[?25l"%\n%
  If "!$Cout_Switch[H]!" == "+"       Set "$Cout_Cursor=%\E%[?25h"%\n%
  If "!$Cout_Switch[Main]!" == "true" (Set "$Cout_Buffer=%\E%[?1049l")Else Set "$Cout_Buffer="%\n%
  If "!$Cout_Switch[Alt]!" == "true"  Set "$Cout_Buffer=%\E%[?1049h"%\n%
  If not "!$Cout_Switch[A]!" == ""    (Set "$Cout_Absolutepos=%\E%[!$Cout_Switch[A]!H")Else Set "$Cout_Absolutepos="%\n%
  If not "!$Cout_Switch[K]!" == ""    (Set "$Cout_LineClear=%\E%[K")Else Set "$Cout_LineClear="%\n%
  If not "!$Cout_Switch[Del]!" == ""  (Set "$Cout_Delete=%\E%[!$Cout_Switch[Del]!P")Else Set "$Cout_Delete="%\n%
  If not "!$Cout_Switch[I]!" == ""    (Set "$Cout_Insert=%\E%[!$Cout_Switch[I]!@")Else Set "$Cout_Insert="%\n%
  If not "!$Cout_Switch[S]!" == ""    (%\n%
   Set "$Cout_String=!$Cout_Switch[S]:{FS}=/!"%\n%
   Set "$Cout_String=!$Cout_String:{EQ}==!"%\n%
   Set "$Cout_String=!$Cout_String:{AS}=*!"%\n%
   Set ^"$Cout_String=!$Cout_String:{DQ}="!"%\n%
  )Else (Set "$Cout_String=")%\n%
  If "!$Cout_Switch[E]!" == "true"    (Set "$Cout_EOLC=!$Cout_Color!")%\n%
  If not "!$Cout_Switch[E]!" == ""    (Set "$Cout_EOLC=%\E%[!$Cout_Switch[E]!m")%\n%
  If "!$Cout_EOLC!" == ""             (Set "$Cout_EOLC=%\E%[0m")%\n%
  ^< nul set /P "=!$Cout_Buffer!!$Cout_Cursor!!$Cout_Absolutepos!!$Cout_Ypos!!$Cout_YOffset!!$Cout_Xpos!!$Cout_XOffset!!$Cout_Delete!!$Cout_Insert!!$Cout_Color!!$Cout_LineClear!!$Cout_String!!$COUT_EOLC!"%\n%
  If "!$Cout_Switch[N]!" == "true"    Echo(%\n%
  If not "!$Cout_Switch[T]!" == ""    (For /L %%T in (1 1 !$Cout_Switch[T]!)Do (Call )%= Delay resetting Errorlevel to 0 =%)%\n%
  If "!$Cout_Switch[help]!" == "true" Pause%\n%
  If not "!$Cout_Switch[@]!" == "" (%\n%
   PUSHD "%TEMP%\%~n0_Run"%\n%
   Set "$Cout{pos}=" ^&Set "$Cout[Char]="%\n%
   For /L %%l in (2 1 8)Do (%\n%
    If not "!$Cout[Char]!" == "R" (%\n%
     ^<nul set /p "=%\E%[6n" %\n%
     FOR /L %%z in (1 1 %%l) DO pause ^< CON ^> NUL%\n%
     Set "$Cout[Char]=;"%\n%
     for /F "tokens=1 skip=1 delims=*" %%C in ('"REPLACE /W ? . < con"') DO (Set "$Cout[Char]=%%C")%\n%
     If "!$Cout{pos}!" == "" (Set "$Cout{pos}=!$Cout[Char]!")Else (set "$Cout{pos}=!$Cout{pos}!!$Cout[Char]:R=!")%\n%
   ))%\n%
   For /F "tokens=1,2 Delims=;" %%X in ("!$Cout{pos}!")Do Set "$Cout{Y}=%%X" ^& Set "$Cout{X}=%%Y" %\n%
   If not "!$Cout_Switch[@]!" == "true" (%\n%
    Set "{Pos}!$Cout_Switch[@]!=!$Cout{pos}!"%\n%
    Set /A "{Y}!$Cout_Switch[@]!=$Cout{Y},{X}!$Cout_Switch[@]!=$Cout{X}"%\n%
   )%\n%
   POPD "%TEMP%\%~n0_Run"%\n%
  )%\n%
 ) Else Set $Cout_args=

:# enable macro
Setlocal EnableExtensions EnableDelayedExpansion

:# facilitate testing of the macro using parameters from the command line; or Call %~n0.bat /? to see help.

 if not "%~1" == ""  (
  %$Cout% %*
  Exit /B !Errorlevel!
 )

:# usage example Ascii art ; Bird with animation

:# ensures Y;X axis at screen home
%$Cout% /A 1;1

(
%$Cout% /H - /C 1,33 /S "                ,      .-;" /N
%$Cout% /C 1,33 /S "             ,  |\    {FS} {FS}  __," /N
%$Cout% /C 1,33 /S "             |\ '.`-.|  |.'.-'" /N
%$Cout% /C 1,33 /S "              \`'-:  `; : {FS}" /N
%$Cout% /C 1,33 /S "               `-._'.  \'|" /N
%$Cout% /C 1,33 /S "              ,_.-` ` `  ~,_" /N
%$Cout% /C 1,33 /S "               '--,.    "
%$Cout% /C 31 /S ".-. "
%$Cout% /C 1,33 /S ",{EQ}{DQ}{EQ}." /N
%$Cout% /C 1,33 /S "                 {FS}     "
%$Cout% /C 31 /S "{ "
%$Cout% /C 1,36 /S "} "
%$Cout% /C 31 /S ")"
%$Cout% /C 1,33 /S "`"
%$Cout% /C 33 /S ";-."
%$Cout% /C 1,33 /S "}" /N
%$Cout% /C 1,33 /S "                 |      "
%$Cout% /C 31 /S "'-' "
%$Cout% /C 33 /S "{FS}__ |" /N
%$Cout% /C 1,33 /S "                 {FS}          "
%$Cout% /C 33 /S "\_,\|" /N
%$Cout% /C 1,33 /S "                 |          (" /N
%$Cout% /C 1,33 /S "             "
%$Cout% /C 31 /S "__ "
%$Cout% /C 1,33 /S "{FS} '          \" /N
%$Cout% /C random /B G /S "     {FS}\_    "
%$Cout% /C 31 /S "{FS},'`"
%$Cout% /C 1,33 /S "|     '   "
%$Cout% /C 31 /S ".-~^~~-." /N
%$Cout% /C random /B G /S "     |`.\_ "
%$Cout% /C 31 /S "|   "
%$Cout% /C 1,33 /S "{FS}  ' ,    "
%$Cout% /C 31 /S "{FS}        \" /N
%$Cout% /C random /B G /S "   _{FS}  `, \"
%$Cout% /C 31 /S "|  "
%$Cout% /C 1,33 /S "; ,     . "
%$Cout% /C 31 /S "|  ,  '  . |" /N
%$Cout% /C random /B G /S "   \   `,  "
%$Cout% /C 31 /S "|  "
%$Cout% /C 1,33 /S "|  ,  ,   "
%$Cout% /C 31 /S "|  :  ;  : |" /N
%$Cout% /C random /B G /S "   _\  `,  "
%$Cout% /C 31 /S "\  "
%$Cout% /C 1,33 /S "|.     ,  "
%$Cout% /C 31 /S "|  |  |  | |" /N
%$Cout% /C random /B G /S "   \`  `.   "
%$Cout% /C 31 /S "\ "
%$Cout% /C 1,33 /S "|   '     "
%$Cout% /C 1,32 /S "|"
%$Cout% /C 31 /S "\_|-'|_,'\|" /N
%$Cout% /C random /B G /S "   _\   `,   "
%$Cout% /C 1,32 /S "`"
%$Cout% /C 1,33 /S "\  '  . ' "
%$Cout% /C 1,32 /S "| |  | |  |           "
%$Cout% /C random /B G /S "__" /N
%$Cout% /C random /B G /S "   \     `,   "
%$Cout% /C 33 /S "| ,  '    "
%$Cout% /C 1,32 /S "|_{FS}'-|_\_{FS}     "
%$Cout% /C random /B G /S "__ ,-;` {FS}" /N
%$Cout% /C random /B G /S "    \    `,    "
%$Cout% /C 33 /S "\ .  , ' .| | | | |   "
%$Cout% /C random /B G /S "_{FS}' ` _-`|" /N
%$Cout% /C random /B G /S "     `\    `,   "
%$Cout% /C 33 /S "\     ,  | | | | |"
%$Cout% /C random /B G /S "_{FS}'   .{EQ}{DQ}  {FS}" /N
%$Cout% /C random /B G /S "     \`     `,   "
%$Cout% /C 33 /S "`\      \{FS}|,| ;"
%$Cout% /C random /B G /S "{FS}'   .{EQ}{DQ}    |" /N
%$Cout% /C random /B G /S "      \      `,    "
%$Cout% /C 33 /S "`\' ,  | ; "
%$Cout% /C random /B G /S "{FS}'    {EQ}{DQ}    _{FS}" /N
%$Cout% /C random /B G /S "       `\     `,  "
%$Cout% /C random /B M /S ".{EQ}{DQ}-. "
%$Cout% /C 1,33 /S "': "
%$Cout% /C random /B G /S "{FS}'     {EQ}{DQ}    .{FS}" /N
%$Cout% /C random /B G /S "    jgs _`\    ;"
%$Cout% /C random /B M /S "_{  '   ; "
%$Cout% /C random /B G /S "{FS}'    {EQ}{DQ}      {FS}" /N
%$Cout% /C random /B G /S "       _\`-{FS}__"
%$Cout% /C random /B M /S ".~  `."
%$Cout% /C 1,35,7,48;2;130;100;0 /S "8"
%$Cout% /C random /B M /S ".'.^`~-. "
%$Cout% /C random /B G /S "{EQ}{DQ}     _,{FS}" /N
%$Cout% /C random /B G /S "    __\      "
%$Cout% /C random /B M /S "{   '-."
%$Cout% /C 1,35,7,48;2;150;130;0 /S "|"
%$Cout% /C random /B M /S ".'.--~'`}"
%$Cout% /C random /B G /S "     _{FS}" /N
%$Cout% /C random /B G /S "    \    .{EQ}{DQ}` "
%$Cout% /C random /B M /S "}.-~^'"
%$Cout% /C 1,35,7,48;2;170;150;0 /S "@"
%$Cout% /C random /B M /S "'-. '-..'  "
%$Cout% /C random /B G /S "__{FS}" /N
%$Cout% /C random /B G /S "   _{FS}  .{DQ}    "
%$Cout% /C random /B M /S "{  -'.~('-._,.'"
%$Cout% /C random /B G /S "\_,{FS}" /N
%$Cout% /C random /B G /S "  {FS}  .{DQ}    _{FS}'"
%$Cout% /C random /B M /S "`--; ;  `.  ;" /N
%$Cout% /C random /B G /S "   .{EQ}{DQ}   _{FS}'      "
%$Cout% /C random /B M /S "`-..__,-'" /N
%$Cout% /C random /B G /S "     __{FS}'" /N
) > "%~dp0parrot.brd"
TYPE "%~dp0parrot.brd"
DEL "%~dp0parrot.brd"

:# Just a bit of animation
For /L %%i in (0 1 25)Do (
 %$Cout% /Y 25 /X 19 /C random /B M /S ".{EQ}{DQ}-. "
 %$Cout% /D 1 /X 17 /C random /B M /S "_{  '   ; "
 %$Cout% /D 1 /X 15 /C random /B M /S ".~  `."
 %$Cout% /R 1 /C random /B M /S ".'.^`~-. "
 %$Cout% /D 1 /X 14 /C random /B M /S "{   '-."
 %$Cout% /R 1 /C random /B M /S ".'.--~'`}"
 %$Cout% /D 1 /X 15 /C random /B M /S "}.-~^'"
 %$Cout% /R 1 /C random /B M /S "'-. '-..'  "
 %$Cout% /D 1 /X 14 /C random /B M /S "{  -'.~('-._,.'"
 %$Cout% /D 1 /X 15 /C random /B M /S "`--; ;  `.  ;"
 %$Cout% /D 1 /X 19 /C random /B M /S "`-..__,-'"
 %$Cout% /T 15 /Y 8 /X 26 /C random /B C /S {EQ}
 %$Cout% /D 2 /R 5 /I 2
 %$Cout% /U 1 /R 1 /C 33 /S \
 %$Cout% /Y 25 /X 19 /C random /B M /S ".{EQ}{DQ}-. "
 %$Cout% /D 1 /X 17 /C random /B M /S "_{  '   ; "
 %$Cout% /D 1 /X 15 /C random /B M /S ".~  `."
 %$Cout% /R 1 /C random /B M /S ".'.^`~-. "
 %$Cout% /D 1 /X 14 /C random /B M /S "{   '-."
 %$Cout% /R 1 /C random /B M /S ".'.--~'`}"
 %$Cout% /D 1 /X 15 /C random /B M /S "}.-~^'"
 %$Cout% /R 1 /C random /B M /S "'-. '-..'  "
 %$Cout% /D 1 /X 14 /C random /B M /S "{  -'.~('-._,.'"
 %$Cout% /D 1 /X 15 /C random /B M /S "`--; ;  `.  ;"
 %$Cout% /D 1 /X 19 /C random /B M /S "`-..__,-'"
 %$Cout% /T 15 /Y 8 /X 26 /C random /B B /S {EQ}
 %$Cout% /D 2 /R 5 /Del 2
 %$Cout% /U 1 /R 1 /C 33 /S "|"
 If %%i EQU 25 %$Cout% /H + /Y 34 /X 1 /N
)

start "" "%~f0"
