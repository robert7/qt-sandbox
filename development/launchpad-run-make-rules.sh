#!/bin/bash

# this is test run for debian "rules"
# convenience helper only

DEV_DIR=`dirname $0`
. ${DEV_DIR}/common-include.sh


dh clean --without=build-stamp || error_exit "dh clean"
dh build-arch --without=build-stamp --buildsystem=qmake --with javahelper



