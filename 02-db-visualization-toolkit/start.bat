@echo off

REM move to current directory. sources: http://stackoverflow.com/a/4420078/1483200 and Solr CMD script
set SDIR=%~dp0
IF "%SDIR:~-1%"=="\" set SDIR=%SDIR:~0,-1%
cd "%SDIR%"

REM setup environment
SET DBVTK_HOME=%SDIR%\dbvtk-data
SET JAVA_HOME=%SDIR%\jre\windows
SET CATALINA_HOME=%SDIR%\apache-tomcat

REM start
CALL solr\bin\solr.cmd start -c
CALL apache-tomcat\bin\startup.bat

pause
