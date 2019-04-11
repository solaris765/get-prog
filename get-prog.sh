#!/bin/bash
prog="$1"
launch=$prog

# Special case
if [ $prog = "slack" ] ; then
    launch=$(XDG_CURRENT_DESKTOP=Unity env BAMF_DESKTOP_FILE_HINT=/var/lib/snapd/desktop/applications/slack_slack.desktop /snap/bin/slack %U)
fi

windows="$(xdotool search --class $prog)"
if [ -z "$windows" ]
then
      $launch&exit  
else
      for pid in $windows; do
            xdotool windowactivate $pid
      done
fi

