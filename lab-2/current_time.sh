#!/bin/bash

# Script: current_time.sh
# Description: Shows the current time and how long until the work day ends at 17:00.

WORK_END="18:00"

CURRENT_TIME=$(date +"%H:%M")

CURRENT_HOUR=$(date +"%H")
CURRENT_MINUTE=$(date +"%M")
CURRENT_TOTAL_MINUTES=$((10#$CURRENT_HOUR * 60 + 10#$CURRENT_MINUTE))

END_HOUR=${WORK_END%:*}
END_MINUTE=${WORK_END#*:}
END_TOTAL_MINUTES=$((10#$END_HOUR * 60 + 10#$END_MINUTE))

if [ $CURRENT_TOTAL_MINUTES -ge $END_TOTAL_MINUTES ]; then
  echo "Current time: $CURRENT_TIME. The work day has already ended!"
else
  TIME_DIFF=$((END_TOTAL_MINUTES - CURRENT_TOTAL_MINUTES))
  HOURS_LEFT=$((TIME_DIFF / 60))
  MINUTES_LEFT=$((TIME_DIFF % 60))
  echo "Current time: $CURRENT_TIME. Work day ends after $HOURS_LEFT hours and $MINUTES_LEFT minutes."
fi

