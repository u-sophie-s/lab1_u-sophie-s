#!/bin/bash

<<<<<<< HEAD
# Use the first argument as the log file, or the default if none is given
logs="${1:-transit_session.log}"

# Stop with exit code 1 if the file doesn't exist
if [ ! -f "$logs" ]; then
    echo "Error: log file '$logs' not found"
    exit 1
fi

# 1. Number of sessions: each run writes one "begins the journey" line
sessions=$(grep -c "begins the journey" "$logs")

# 2. #count the number of zebra crossings and lane changes. Since the logs all have warn when there is one of these changes we'll track the word "WARN"
zebras=$(grep "WARN" "$logs" | grep -c -i "zebra")
lanes=$(grep "WARN" "$logs" | grep -c -i "lane")
total=$((zebras + lanes))

echo "Sessions: $sessions"
echo "Zebra crossing stops: $zebras"
echo "Lane changes: $lanes"
echo "Total zebra stops and lane changes: $total"

# 3. Latest trip: driver name and top speed
if [ "$sessions" -eq 0 ]; then
    echo "No trips found in the log."
    exit 0
fi

# Line number of the most recent "begins the journey" line
start=$(grep -n "begins the journey" "$logs" | tail -1 | cut -d: -f1)

# Driver name: text between "[OK] " and " begins"
driver=$(sed -n "${start}p" "$logs" | sed 's/.*\] \(.*\) begins the journey.*/\1/')

# Top speed: only lines from the latest trip onwards
# (ASSUMPTION: speeds appear as numbers followed by "km/h", e.g. "60 km/h")
top=$(tail -n +"$start" "$logs" | grep -o "[0-9]\+ km/h" | cut -d' ' -f1 | sort -n | tail -1)

if [ -z "$top" ]; then
    top="not found"
fi

echo "Latest driver: $driver"
echo "Latest top speed: $top km/h"
=======
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
>>>>>>> analyze_script
