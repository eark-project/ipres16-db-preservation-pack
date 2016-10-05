#!/usr/bin/env bash

# move to script directory, source http://stackoverflow.com/a/246128/1483200
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
cd "$DIR" || (echo "could not change directory to $DIR" && exit)

if [ "$1" = "" ]; then
  echo Usage: migrate.bat provided_address
  echo Example: migrate.bat 192.168.3.1
else
  if [ "$(uname -s)" = "Darwin" ]; then
    ../05-db-visualization-toolkit/jre/mac/bin/java -Dfile.encoding=UTF-8 -jar dbptk-app.jar --import=mysql --import-hostname="$1" --import-database=sakila --import-username=ipres --import-password=ipres --export=siard-2 --export-pretty-xml --export-file=sakila-siard2.siard
  else
    ../05-db-visualization-toolkit/jre/linux/bin/java -Dfile.encoding=UTF-8 -jar dbptk-app.jar --import=mysql --import-hostname="$1" --import-database=sakila --import-username=ipres --import-password=ipres --export=siard-2 --export-pretty-xml --export-file=sakila-siard2.siard
  fi
fi
