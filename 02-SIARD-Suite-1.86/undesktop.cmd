@echo off
rem ==$Workfile: uninstall.cmd $==========================================
rem  undesktop deletes shortcuts to this installation of SIARD. 
rem  Version    : $Id: undesktop.cmd 1311 2011-11-24 07:52:19Z hartwig $
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
if "%~1"=="-H" goto help
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
rem get user path from registry: rem HKEY_CURRENT_USER\Environment\path
rem --------------------------------------------------------------------
rem @echo checking registry
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
rem set user path in registry: rem HKEY_CURRENT_USER\Environment\path
rem --------------------------------------------------------------------
rem @echo setting registry
set key=HKCU\Environment
%reg% add %key% /v PATH /d "%userpath%" /f
%setx% PATH "%userpath%"
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
rem determine execution directory
rem --------------------------------------------------------------------
set execdir=%~dp0
rem detach the trailing backslash
set execdir=%execdir:~0,-1%

rem --------------------------------------------------------------------
rem remove it from PATH (if it was on it)
rem --------------------------------------------------------------------
call :getuserpath
if "%userpath%"=="" goto :programs
rem remove %execdir% from %userpath%
call set userpath=%%userpath:%execdir%=%%
rem @echo path without %execdir%: %userpath%
call :cleanuserpath
rem @echo cleaned path: %userpath%
rem now set it in registry
call :setuserpath

:programs
rem --------------------------------------------------------------------
rem determine programs directory in start menu
rem --------------------------------------------------------------------
set key="HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
rem reg query %key% /v Programs
for /f "skip=4 delims=	 tokens=3-10" %%i in ('reg.exe query %key% /v Programs') do set programs=%%i
call :progdir "%programs%"
@echo progdir: %programs%

rem --------------------------------------------------------------------
rem determine desktop directory
rem --------------------------------------------------------------------
set key="HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
rem reg query %key% /v Desktop
for /f "skip=4 delims=	 tokens=3-10" %%i in ('reg.exe query %key% /v Desktop') do set desktop=%%i
call :desktopdir "%desktop%"
@echo desktopdir: %desktop%

:uninstall
rem --------------------------------------------------------------------
rem remove shortcut
rem --------------------------------------------------------------------
rem remove previous shortcuts if they exist
del "%desktop%\SiardEdit.lnk" >NUL 2>NUL
rem remove previous SIARD programs entry
del "%programs%\SIARD\SiardEdit.lnk" >NUL 2>NUL
rmdir /q/s "%programs%\SIARD"
goto exit

:error
rem --------------------------------------------------------------------
rem error message for missing javaw.exe
rem --------------------------------------------------------------------
@echo "No valid javaw.exe could be found.                                  "
@echo "Install the JAVA JRE or indicate correct path on the command line.  "

:help
rem --------------------------------------------------------------------
rem help for calling syntax
rem --------------------------------------------------------------------
rem we need the quotes for protecting the angular brackets
@echo "Calling syntax                                                      "
@echo "  undesktop                                                         "
@echo "deletes the shortcut for siardedit and the contents of this         "
@echo "directory.                                                          "
@echo "                                                                    "

rem --------------------------------------------------------------------
rem exit
rem --------------------------------------------------------------------
:exit
