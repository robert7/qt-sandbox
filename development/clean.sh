#!/bin/bash

DEV_DIR=`dirname $0`
. ${DEV_DIR}/common-include.sh

for i in ?make-build-* build* appdir Makefile; do
  if [ -d $i ] ; then
     echo Removing directory $i
     rm -rf $i || error_exit "rm directory \"$i\""
  fi
  if [ -f $i ] ; then
     echo Removing file $i || error_exit "rm file \"$i\""
     rm -f $i
  fi
done

echo OK
