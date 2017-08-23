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

if [ "$(uname -s)" = "Darwin" ]; then
  ../03-db-visualization-toolkit/jre/mac/bin/java -Dfile.encoding=UTF-8 -jar ../01-db-preservation-toolkit/dbptk-app.jar --import=siard-2 --import-file=../sakila_siard2.siard --export=postgresql --export-hostname=127.0.0.1 --export-database=sakila --export-username=postgres --export-password=password --export-disable-encryption
else
  ../03-db-visualization-toolkit/jre/linux/bin/java -Dfile.encoding=UTF-8 -jar ../01-db-preservation-toolkit/dbptk-app.jar --import=siard-2 --import-file=../sakila_siard2.siard --export=postgresql --export-hostname=127.0.0.1 --export-database=sakila --export-username=postgres --export-password=password --export-disable-encryption
fi
