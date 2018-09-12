#!/bin/bash

# this is test run for debian "rules"
# convenience helper only

DEV_DIR=`dirname $0`
. ${DEV_DIR}/common-include.sh

make -n -d --file ./debian/rules clean

