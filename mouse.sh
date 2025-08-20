#!/bin/bash

# Get initial mouse position
prev_position=$(cliclick p)

while true; do
    # Get current mouse position
    curr_position=$(cliclick p)

    if [[ "$curr_position" != "$prev_position" ]]; then
        /Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --set-variables '{"mouse_moving":1}'
    else
        /Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --set-variables '{"mouse_moving":0}'
    fi

    # Update previous position
    prev_position=$curr_position

    # Check every 0.1 seconds
    sleep 0.1
done
