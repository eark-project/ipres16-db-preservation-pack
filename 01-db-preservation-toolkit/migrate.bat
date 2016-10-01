@echo off

REM move to current directory. sources: http://stackoverflow.com/a/4420078/1483200 and Solr CMD script
set SDIR=%~dp0
IF "%SDIR:~-1%"=="\" set SDIR=%SDIR:~0,-1%
cd "%SDIR%"

IF [%1] == [] GOTO USAGE

..\05-db-visualization-toolkit\jre\windows\bin\java.exe "-Dfile.encoding=UTF-8" -jar dbptk-app.jar --import=mysql --import-hostname=%1 --import-database=sakila --import-username=ipres --import-password=ipres --export=siard-2 --export-pretty-xml --export-file=sakila-siard2.siard

exit

LABEL USAGE

echo Usage: migrate.bat provided_address
echo Example: migrate.bat 192.168.3.1
