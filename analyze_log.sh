#!/bin/bash

LOG="${1:-transit_session.log}"

if [ ! -f "$LOG" ]; then
    echo "Error: log file '$LOG' not found"
    exit 1
fi

sessions=$(grep -c "SESSION_START_WORD" "$LOG")
zebras=$(grep -c "ZEBRA_WORD" "$LOG")
lanes=$(grep -c "LANE_WORD" "$LOG")

# Latest session: find the line number of the last session start,
# then keep only the lines from there to the end of the file
start=$(grep -n "SESSION_START_WORD" "$LOG" | tail -1 | cut -d: -f1)
latest=$(tail -n +"$start" "$LOG")

echo "Sessions: $sessions"
echo "Zebra stops: $zebras"
echo "Lane changes: $lanes"