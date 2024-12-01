#!/usr/bin/bash

# Infinite loop to run bstat every 1 second
while true; do
    clear  # Clear the screen for fresh output
    bstat  # Run the bstat command
    sleep 1  # Wait for 1 second
done

