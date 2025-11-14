#!/bin/bash

echo "printing the special variables in shell scripting"

echo "all variables passed in the script ::$@"
echo "number of argumentsor variables passed in script ::$#"
echo "script name or file name :: $0"
echo "present working directory :: $PWD"
echo "home directorty of the user :: $HOME"
echo "which user is exeecuting the script or file :: $USER"
echo "PID of the current script or file :: $$"
echo "Last executed command status or used commend status ::$?"
echo "PID of the last commend executed in backedground :: $!"
echo "we used sleep command for 5 seconds is :: sleep 5 &"