#!/bin/bash

echo This will delete all not checked in! Break to cancel/Enter to continue..
read xy

git clean -fdx

echo OK
