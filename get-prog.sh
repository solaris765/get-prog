#!/bin/bash
prog="$1"

windows="$(xdotool search --class $prog)"
if [ -z "$windows" ]
then
      chromium-browser&exit  
else
      for pid in $windows; do
            xdotool windowactivate $pid
      done
fi
