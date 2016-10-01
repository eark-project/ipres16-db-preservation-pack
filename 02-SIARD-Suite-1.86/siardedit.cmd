@echo off
rem ==$Workfile: siardedit.cmd $========================================
rem  siardedit executes bin/SiardEdit.jar. 
rem  Version    : $Id: siardedit.cmd 1643 2014-09-11 13:26:08Z hartwig $
rem  Application: Siard2
rem  Platform   : Win32
rem --------------------------------------------------------------------
rem Copyright  : Swiss Federal Archives, Berne, Switzerland, 2007, 2011
rem Created    : 22.11.2007, Hartwig Thomas
rem ====================================================================
chcp 1252
if "%~1"=="-?" goto help
if "%~1"=="/?" goto help
if "%~1"=="-h" goto help
if "%~1"=="/h" goto help
goto local

:fullpath
rem --------------------------------------------------------------------
rem determine normalized full path of file given in first argument
rem input: %1
rem output: %fullpath%
rem --------------------------------------------------------------------
set fullpath=%~f1
goto exit

:regquery
rem --------------------------------------------------------------------
rem query the registry
rem input: %reg%, %key% and %value%
rem output: %result%
rem --------------------------------------------------------------------
rem @echo ">>> regquery %reg% %key% %value%"
set result=
rem There is a stupid bug in the FOR command which prevents parsing a quoted command.
rem So we have to pipe its output into a temporary file first.
"%reg%" query "%key%" /v %value%>%TEMP%\reg.txt
rem try skip 4 first
for /f "usebackq skip=4 delims= tokens=*" %%f in ("%TEMP%\reg.txt") do set result=%%~f
if not "%result%"=="" goto result
rem now try skip 2
for /f "usebackq skip=2 delims= tokens=*" %%f in ("%TEMP%\reg.txt") do set result=%%~f
:result
del %TEMP%\reg.txt
rem replace all tabs by 4 blanks
if not "%result%"=="" set result=%result:	=    %
rem @echo "<<< regquery '%result%'"
goto exit

:regjava
rem --------------------------------------------------------------------
rem check registry HKLM\SOFTWARE\JavaSoft\Java Runtime Environment\xxx
rem for JavaHome\bin\%executable%
rem input: %reg%, %softkey% and %executable%
rem output: %jh%
rem --------------------------------------------------------------------
rem @echo ">>> regjava %reg% %softkey% %executable%"
set jh=
set key=%softkey%\JavaSoft\Java Runtime Environment
set value=CurrentVersion
call :regquery
if "%result%"=="" goto jh
rem parse result: 4 blanks, CurrentVersion, 4 blanks, REG_SZ, 4 blanks, %cv%
set cv=%result:~32%
if "%cv%"=="" goto jh
set key=%key%\%cv%
set value=JavaHome
call :regquery
if "%result%"=="" goto jh
rem parse result: 4 blanks, JavaHome, 4 blanks, REG_SZ, 4 blanks, %jh%
set jh=%result:~26%
:jh
rem @echo "<<< regjava '%jh%'"
goto exit

:local
rem --------------------------------------------------------------------
rem use C:\Windows\system32\reg.exe if it exists
rem --------------------------------------------------------------------
set reg=reg.exe
set sysreg=%SystemRoot%\system32\%reg%
if exist %sysreg% set reg=%sysreg%

rem --------------------------------------------------------------------
rem execution directory from which cmd is called
rem --------------------------------------------------------------------
set execdir=%~dp0
rem detach the trailing backslash
set execdir=%execdir:~0,-1%

rem --------------------------------------------------------------------
rem local variables
rem --------------------------------------------------------------------
set executable=javaw.exe
set java=

rem --------------------------------------------------------------------
rem check option
rem --------------------------------------------------------------------
set args=%*
set arg1=%~1
set softkey=HKLM\Software
if "%arg1%"=="/32" goto wow6432node
if "%arg1%"=="-32" goto wow6432node
goto regcheck
:wow6432node
set softkey=%softkey%\Wow6432Node
set args=%args:~3%

:regcheck
rem --------------------------------------------------------------------
rem try and find JavaHome in registry
rem --------------------------------------------------------------------
rem try and find JavaHome in registry
call :regjava
if not "%jh%"=="" goto setjava
set softkey=HKLM\Software
if "%arg1%"=="/32" goto nextreg
if "%arg1%"=="-32" goto nextreg
set softkey=%softkey%\Wow6432Node
:nextreg
call :regjava
if "%jh%"=="" goto javacheck
:setjava 
set java=%jh%\bin\%executable%
if exist "%java%" goto execute
@echo File "%java%" could not be found in registry!
goto javacheck

:javacheck
rem --------------------------------------------------------------------
rem check environment variable JAVA_HOME for %executable%
rem --------------------------------------------------------------------
@echo checking JAVA_HOME
if "%JAVA_HOME%"=="" goto pathcheck
set java=%JAVA_HOME%\bin\%executable%
if exist "%java%" goto execute
@echo File "%java%" could not be found in JAVA_HOME!
goto error

:pathcheck
rem --------------------------------------------------------------------
rem check environment variable PATH for %executable%
rem --------------------------------------------------------------------
@echo checking PATH
for %%f in (%executable%) do (set java=%%~$PATH:f)
if NOT "%java%"=="" goto execute
@echo File "%java%" could not be found in PATH!
goto error

:execute
rem --------------------------------------------------------------------
rem execute bin/SiardEdit
rem --------------------------------------------------------------------
"%java%" %JAVA_OPTS% -jar "%execdir%\bin\SiardEdit.jar" %args%
goto exit

:error
rem --------------------------------------------------------------------
rem error message for missing %executable%
rem --------------------------------------------------------------------
@echo "No valid javaw.exe could be found.                                  "
@echo "Install the JAVA JRE or indicate correct path on the command line.  "

:help
rem --------------------------------------------------------------------
rem help for calling syntax
rem --------------------------------------------------------------------
rem we need the quotes for protecting the angular brackets
@echo "Calling syntax                                                      "
@echo "  siardedit.cmd [/32] [<siardfile>]                                 "
@echo "executes bin/SiardEdit.jar.                                         "
@echo "                                                                    "
@echo "Parameters:                                                         "
@echo "  /32       on 64-bit system: use 32-bit JAVA if available.         "
@echo "  siardfile SIARD file to be opened.                                "
@echo "                                                                    "
echo "Javahome:                                                           "
@echo "  First the registry under HKLM\SOFTWARE\JavaSoft                   "
@echo "  is searched for CurrentVersion and for JavaHome                   "
@echo "  for locating the javaw.exe.                                       "
@echo "                                                                    "
@echo "  Then, if an environment variable JAVA_HOME exists,                "
@echo "  it is used for locating the javaw.exe.                            "
@echo "                                                                    "
@echo "Javaopts:                                                           "
@echo "  The environment variable JAVA_OPTS is used as a                   "
@echo "  source for additional JAVA options.                               "
@echo "  E.g. -Xmx1000m or                                                 "
@echo "       -DproxyHost=www-proxy.admin.ch -DproxyPort=8080 or           "
@echo "       -Dcom.sun.xml.ws.transport.http.client.HttpTransportPipe.dump=true"
@@echo "                                                                    "

rem --------------------------------------------------------------------
rem exit
rem --------------------------------------------------------------------
:exit
exit /b %ERRORLEVEL%