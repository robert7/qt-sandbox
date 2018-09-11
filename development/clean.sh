#!/bin/bash


for i in ?make-build-debug debug appdir Makefile; do
  if [ -d $i ] ; then
     echo Removing directory $i
     rm -rf $i
  fi
  if [ -f $i ] ; then
     echo Removing file $i
     rm -f $i
  fi
done

echo OK
