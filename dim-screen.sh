#!/bin/bash -x

# Example notifier script -- lowers screen brightness, then waits to be killed
# and restores previous brightness on exit.

## CONFIGURATION ##############################################################

# Brightness will be lowered to this value.
min_brightness=500

# If your video driver works with xbacklight, set -time and -steps for fading
# to $min_brightness here. Setting steps to 1 disables fading.
fade_steps=20

# Time to sleep (in seconds) between increments when using sysfs. If unset or
# empty, fading is disabled.
fade_step_time=0.05

###############################################################################

get_brightness() {
    brightnessctl get
}

set_brightness() {
    brightnessctl set $1
}

fade_brightness() {
    local level
    local value=$(get_brightness)
    local decrement=$((($value - $1) / $fade_steps))
    for level in $(eval echo {$fade_steps..1}); do
        local value=$(($value - $decrement))
        set_brightness $value
        sleep $fade_step_time
    done
}

trap 'exit 0' TERM INT
trap "set_brightness $(get_brightness); kill %%" EXIT
fade_brightness $min_brightness
sleep 2147483647 &
wait
