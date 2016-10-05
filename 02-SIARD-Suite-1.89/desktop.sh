#!/bin/sh
#== desktop.sh =========================================================
# desktop creates shortcuts to this installation of SIARD Suite. 
# Version    : $Id: desktop.sh 1507 2013-02-19 07:29:07Z hartwig $
# Application: SIARD Suite
# Platform   : LINUX/UNIX
#-----------------------------------------------------------------------
# Copyright  : Swiss Federal Archives, Berne, Switzerland, 2007
# Created    : 07.02.2012, Hartwig Thomas
#=======================================================================
# return code (0 = OK, 4 = Warning, 8 = Error, 12 = fatal error
rc=12
#force32 indicates, whether 32-Bit version of JAVA must be used
force32=0
#java executable to be used
java=/usr/bin/java

#-----------------------------------------------------------------------
# javackeck returns 1, if $java exists, has version 6 or higher
# and if 32-Bit if force32 != 0
#-----------------------------------------------------------------------
javacheck()
{
  ok=0
  option=""
  if [ $force32 -ne 0 ];
  then
    option="-d32"
  fi
  version=`$java $option -version 2>&1`
  # must start with something like 'java version "1.6.0_23"'
  start=`expr substr "$version" 1 12`
  if [ "$start" = "java version" ];
  then
    version=${version#*\"}
    version=${version%%\"*}
    if [ "$version" \> "1.6" ];
    then
      ok=1
    fi  
  fi
  return $ok
} # javacheck

#-----------------------------------------------------------------------
# help displays usage information
#-----------------------------------------------------------------------
help()
{
  echo "Calling syntax                                                      "
  echo "  desktop.sh [-h] | [-32]                                           "
  echo "installs this SIARD Suite on a gnome desktop.                       "
  echo "                                                                    "
  echo '-h          displays usage information                              '
  echo '-32         force usage of 32-bit JAVA                              '
  echo "                                                                    "
  echo 'Javahome:                                                           '
  echo '  In order to find a suitable java executable, "java" is first      '
  echo '  tried, then all PATH folders, then JAVA_HOME and finally the      '
  echo '  whole file system is searched.                                    '
  echo 'Javaopts:                                                           '
  echo '  The environment variable JAVA_OPTS is used as a                   '
  echo '  source for additional JAVA options.                               '
  echo '  E.g. -Xmx1000m or                                                 '
  echo '       -DproxyHost=www-proxy.admin.ch -DproxyPort=8080 or           '
  echo '       -Dcom.sun.xml.ws.transport.http.client.HttpTransportPipe.dump=true'
  echo "                                                                    "
  return 4
}

#-----------------------------------------------------------------------
# display error message about java executable
#-----------------------------------------------------------------------
error()
{
  echo 'No valid java executable could be found!                            '
  echo 'Install the JAVA JRE or indicate correct location using JAVA_HOME!  '
  return 8
} # error

#-----------------------------------------------------------------------
# installs bin/SiardEdit.jar
#-----------------------------------------------------------------------
install()
{
  rc=8
  execdir="$0"
  execdir=${execdir%/desktop.sh}
  if [ -d "$HOME/Desktop" ];
  then
    # create siard.desktop in $HOME/Desktop
    echo '#!/usr/bin/env xdg-open'>"$HOME/Desktop/siard.desktop"
    echo '[Desktop Entry]'>>"$HOME/Desktop/siard.desktop"
    echo 'Name=SIARD Suite'>>"$HOME/Desktop/siard.desktop"
    echo 'Comment=Archive relational databases'>>"$HOME/Desktop/siard.desktop"
    echo "Icon=$execdir/siardedit.ico">>"$HOME/Desktop/siard.desktop"
    execdir=$(echo $execdir | sed 's/ /\\ /g')
    echo "execdir: $execdir"
    echo "Exec=$java $JAVA_OPTS -jar $execdir/bin/SiardEdit.jar">>"$HOME/Desktop/siard.desktop"
    echo 'Terminal=false'>>"$HOME/Desktop/siard.desktop"
    echo 'Type=Application'>>"$HOME/Desktop/siard.desktop"
    echo 'StartupNotify=true'>>"$HOME/Desktop/siard.desktop"
    echo 'Categories=GNOME;GTK;'>>"$HOME/Desktop/siard.desktop"
    echo 'Name[en_US]=SIARD Suite'>>"$HOME/Desktop/siard.desktop"
    chmod 755 "$HOME/Desktop/siard.desktop"
    rc=0
  fi
  return $rc
} # install

#-----------------------------------------------------------------------
# main
#-----------------------------------------------------------------------
if [ "$1" != "-h" ];
then
  if [ "$1" = "-32" ];
  then
    force32=1
    shift
  fi
  args="$@"

  javacheck
  ok=$?

  # first try PATH /usr/bin/java
  if [ $ok -eq 0 ];
  then
    echo "trying PATH ..."
    ifssaved="$IFS"
    IFS=:
    for dir in $PATH
    do
      if [ $ok -eq 0 ];
      then
        java="$dir/java"
        javacheck
        ok=$?
      fi
    done
    IFS="$ifssaved"
  fi
  
  # then try JAVA_HOME
  if [ $ok -eq 0 ];
  then
    echo "trying JAVA_HOME ..."  
    java="$JAVA_HOME/bin/java"
    javacheck
    ok=$?
  fi
  
  # finally try file system
  if [ $ok -eq 0 ];
  then
    echo "searching in file system ..."
    ifssaved="$IFS"
    IFS="
"
    for f in `find / -path */bin/java -print 2>/dev/null`
    do
      if [ $ok -eq 0 ];
      then
        java="$f"
        javacheck
        ok=$?
      fi
    done
    IFS="$ifssaved"    
  fi

  # if a suitable java executable was found then execute it
  if [ $ok -ne 0 ];
  then
    install
  else
    error
  fi
  rc=$?
  
else
  help
  rc=$?
fi

exit $rc
