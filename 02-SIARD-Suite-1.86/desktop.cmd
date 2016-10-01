@echo off
rem ==$Workfile: desktop.cmd $==========================================
rem  desktop creates shortcuts to this installation of SIARD. 
rem  Version    : $Id: desktop.cmd 1507 2013-02-19 07:29:07Z hartwig $
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
goto start

:progdir
rem --------------------------------------------------------------------
rem evaluate the programs directory which may contain %USERPROFILES%
rem --------------------------------------------------------------------
set programs=%~1
goto exit

:desktopdir
rem --------------------------------------------------------------------
rem evaluate the desktop directory which may contain %USERPROFILES%
rem --------------------------------------------------------------------
set desktop=%~1
goto exit

:getuserpath
rem --------------------------------------------------------------------
rem get user path from registry: HKEY_CURRENT_USER\Environment\path
rem --------------------------------------------------------------------
rem @echo checking registry
set userpath=
set key=HKCU\Environment
for /f "skip=4 delims=	 tokens=3" %%f in ('%reg% query "%key%" /v PATH') do set userpath=%%~f
rem @echo PATH found: "%userpath%"
goto exit

:cleanuserpath
rem --------------------------------------------------------------------
rem remove leading and duplicate ; from userpath
rem For the following the variable syntax is difficult to find:
rem %variable:search=replace% substitutes all "search" by "replace";
rem %variable:~offset% returns the substring starting at "offset".
rem %variable:~offset,length% returns the substring starting at "offset"
rem   with "length"
rem if Windows version is > NT 4.0 then negative offsets and lengths
rem   are treated as if they were added to the length of the variable. 
rem --------------------------------------------------------------------
if "%userpath%"=="" goto setuserpath
rem if first character is now a ; then remove it
set firstchar=%userpath:~0,1%
rem @echo first char: %firstchar%
if "%firstchar%"==";" set userpath=%userpath:~1%
rem @echo path without leading ";" :%userpath%
rem replace ;; by ;
set userpath=%userpath:;;=;%
rem @echo path without ";;" :%userpath%
goto exit

:setuserpath
rem --------------------------------------------------------------------
rem set user path in registry: HKEY_CURRENT_USER\Environment\path
rem --------------------------------------------------------------------
rem @echo setting registry
set key=HKCU\Environment
%reg% add %key% /v PATH /d "%userpath%" /f
%setx% PATH "%userpath%"
goto exit

:regquery
rem --------------------------------------------------------------------
rem query the registry
rem input: %reg%, %key% and %value%
rem output: %result%
rem --------------------------------------------------------------------
rem @echo +regquery %reg% %key% %value%
set result=
rem try skip 4 first
for /f "skip=4 delims= tokens=*" %%f in ('%reg% query "%key%" /v %value%') do set result=%%~f
if not "%result%"=="" goto result
rem now try skip 2
for /f "skip=2 delims= tokens=*" %%f in ('%reg% query "%key%" /v %value%') do set result=%%~f
:result
rem replace all tabs by 4 blanks
if not "%result%"=="" set result=%result:	=    %
rem @echo -regquery '%result%'
goto exit

:regjava
rem --------------------------------------------------------------------
rem check registry HKLM\SOFTWARE\JavaSoft\Java Runtime Environment\xxx
rem for JavaHome\bin\%executable%
rem input: %reg%, %softkey% and %executable%
rem output: %jh%
rem --------------------------------------------------------------------
rem @echo +regjava %reg% %softkey% %executable%
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
rem @echo -regjava '%jh%'
goto exit

:start
rem --------------------------------------------------------------------
rem use C:\Windows\system32\reg.exe if it exists
rem --------------------------------------------------------------------
set reg=reg.exe
set sysreg=%SystemRoot%\system32\%reg%
if exist %sysreg% set reg=%sysreg%

rem --------------------------------------------------------------------
rem use C:\Windows\system32\setx.exe if it exists
rem --------------------------------------------------------------------
set setx=setx.exe
set syssetx=%SystemRoot%\system32\%setx%
if exist %syssetx% set setx=%syssetx%

rem --------------------------------------------------------------------
rem execution directory from which cmd is called
rem --------------------------------------------------------------------
set execdir=%~dp0
rem detach the trailing backslash
set execdir=%execdir:~0,-1%

:remove
rem --------------------------------------------------------------------
rem remove it from PATH (if it was on it)
rem --------------------------------------------------------------------
call :getuserpath
if "%userpath%"=="" goto :add
rem remove %execdir% from %userpath%
call set userpath=%%userpath:%execdir%=%%
rem @echo path without %execdir%: %userpath%
call :cleanuserpath
rem @echo cleaned path: %userpath%
rem now set it in registry
call :setuserpath

:add
rem --------------------------------------------------------------------
rem add it to PATH
rem --------------------------------------------------------------------
call :getuserpath
set userpath=%userpath%;%execdir%
rem @echo path with %execdir%: %userpath%
call :cleanuserpath
rem @echo cleaned path: %userpath%
rem now set it in registry
call :setuserpath

rem --------------------------------------------------------------------
rem determine programs directory in start menu
rem --------------------------------------------------------------------
set key=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders
set value=Programs
call :regquery
rem parse result: 4 blanks, Programs, 4 blanks, REG_EXPAND_SZ, 4 blanks, %progdir%
set programs=%result:~33%
call :progdir "%programs%"
@echo progdir: %programs%

rem --------------------------------------------------------------------
rem determine desktop directory
rem --------------------------------------------------------------------
set key=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders
set value=Desktop
call :regquery
rem parse result: 4 blanks, Desktop, 4 blanks, REG_EXPAND_SZ, 4 blanks, %progdir%
set desktop=%result:~32%
call :desktopdir "%desktop%"
@echo desktopdir: %desktop%

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
goto argcheck
:wow6432node
set softkey=%softkey%\Wow6432Node
set args=%args:~3%

:argcheck
rem --------------------------------------------------------------------
rem if there is a command line parameter use it for locating %executable%
rem --------------------------------------------------------------------
if "%~1"=="" goto regcheck
set java=%~f1\bin\%executable%
if exist "%java%" goto execute
@echo File "%java%" could not be found!
goto error

:regcheck
@echo regcheck
rem --------------------------------------------------------------------
rem search for JavaHome in registry
rem --------------------------------------------------------------------
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
@echo File "%java%" could not be found!
goto javacheck

:javacheck
rem --------------------------------------------------------------------
rem check environment variable JAVA_HOME for %executable%
rem --------------------------------------------------------------------
@echo checking JAVA_HOME
if "%JAVA_HOME%"=="" goto pathcheck
set java=%JAVA_HOME%\bin\%executable%
if exist "%java%" goto execute
@echo File "%java%" could not be found!
goto error

:pathcheck
rem --------------------------------------------------------------------
rem check environment variable PATH for %executable%
rem --------------------------------------------------------------------
@echo checking PATH
for %%f in (%executable%) do (set java=%%~$PATH:f)
if "%java%"=="" goto cdrivecheck
@echo JAVA Executable based on PATH: "%java%"
goto execute

:execute
rem --------------------------------------------------------------------
rem install shortcut
rem --------------------------------------------------------------------
rem remove previous shortcuts if they exist
del "%desktop%\SiardEdit.lnk" >NUL 2>NUL
rem remove previous SIARD programs entry
del "%programs%\SIARD\SiardEdit.lnk" >NUL 2>NUL
rmdir /q/s "%programs%\SIARD"
rem create programs entry SIARD
mkdir "%programs%\SIARD"
rem create new shortcuts
@echo shortcut for SiardEdit is being installed using "%java%"
"%execdir%\Shortcut.exe" /F:"%desktop%\SiardEdit.lnk" /A:C /T:"%java%" /P:"%JAVA_OPTS% -jar \"%execdir%\bin\SiardEdit.jar\"" /W:"%execdir%" /I:"%execdir%\siardedit.ico" /D:"SiardEdit for viewing and modifying archived data from relational databases" >NUL
copy "%desktop%\SiardEdit.lnk" "%programs%\SIARD"
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
@echo "  install [/32] [<javahome>]                                        "
@echo "creates the shortcuts for SIARD.                                    "
@echo "                                                                    "
@echo "Parameters:                                                         "
@echo "Javahome:                                                           "
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
@echo "                                                                    "

rem --------------------------------------------------------------------
rem exit
rem --------------------------------------------------------------------
:exit
