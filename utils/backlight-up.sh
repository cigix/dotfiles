#!/bin/sh

base=$(dirname $0)

source $base/backlight-common.sh

if [ $((cur_brightness + indent)) -gt $max_brightness ]
then
    set_brightness $max_brightness
else
    set_brightness $((cur_brightness + indent))
fi
