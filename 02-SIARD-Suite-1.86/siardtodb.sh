#!/bin/sh
#== siardtodb.sh =======================================================
# siardtodb executes ch.admin.bar.siard.SiardToDb in bin/SiardEdit.jar. 
# Version    : $Id: siardtodb.sh 1507 2013-02-19 07:29:07Z hartwig $
# Application: Siard2
# Platform   : LINUX/UNIX
#-----------------------------------------------------------------------
# Copyright  : Swiss Federal Archives, Berne, Switzerland, 2008
# Created    : 24.03.2008, Hartwig Thomas
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
  echo 'Calling syntax                                                      '
  echo '  siardtodb.sh [-h] | [-32] | <args>                                '
  echo 'executes ch.admin.bar.siard.SiardToDb in bin/SiardEdit.jar.         '
  echo '                                                                    '
  echo '-h          displays usage information                              '
  echo '-32         force usage of 32-bit JAVA                              '
  echo '<args>      see documentation of SiardToDb;                             '
  echo '                                                                    '
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
  echo '                                                                    '
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
# executes ch.admin.bar.siard.SiardToDb in bin/SiardEdit.jar
#-----------------------------------------------------------------------
execute()
{
  execdir="$0"
  execdir=${execdir%/siardtodb.sh}
    echo "$java" -Xmx1024m $JAVA_OPTS -cp "$execdir/bin/SiardEdit.jar"  "ch.admin.bar.siard.SiardToDb" "$args"
  if [ ${#args} -eq 0 ];
  then
    "$java" $JAVA_OPTS -cp "$execdir/bin/SiardEdit.jar"  "ch.admin.bar.siard.SiardToDb"
  else
    "$java" $JAVA_OPTS -cp "$execdir/bin/SiardEdit.jar"  "ch.admin.bar.siard.SiardToDb" "$args"
  fi
  return $?
} # execute

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

  java="java"
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
    execute
  else
    error
  fi
  rc=$?
  
else
  help
  rc=$?
fi

exit $rc
