#!/bin/sh
#== undesktop.sh =======================================================
# undesktop removes shortcuts to this installation of SIARD Suite. 
# Version    : $Id: undesktop.sh 1431 2012-02-10 13:07:33Z hartwig $
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

#-----------------------------------------------------------------------
# help displays usage information
#-----------------------------------------------------------------------
help()
{
  echo "Calling syntax                                                      "
  echo "  undesktop.sh                                                      "
  echo "uninstalls this SIARD Suite from a gnome desktop.                   "
  echo "                                                                    "
  echo 'Javahome:                                                           '
  echo '  In order to find a suitable java executable, "java" is first      '
  echo '  tried, then all PATH folders, then JAVA_HOME and finally the      '
  echo '  whole file system is searched.                                    '
  echo 'Javaopts:                                                           '
  echo '            The environment variable JAVA_OPTS is used as a         '
  echo '            source for additional JAVA options.                     '
  echo '            E.g. \"-DproxyHost=www-proxy.admin.ch -DproxyPort=8080\"'
  echo '            or -Dcom.sun.xml.ws.transport.http.client.HttpTransportPipe.dump=true'
  echo "                                                                    "
  echo "                                                                    "
  return 4
}

#-----------------------------------------------------------------------
# uninstalls bin/SiardEdit.jar
#-----------------------------------------------------------------------
uninstall()
{
  rc=8
  rm -f $HOME/Desktop/siard.desktop
  return $?
} # uninstall

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

  uninstall
  rc=$?
  
else
  help
  rc=$?
fi

exit $rc
