#!/bin/sh

base=$(dirname $0)

source $base/backlight-common.sh

if [ $((cur_brightness - indent)) -lt 0 ]
then
    set_brightness 0
else
    set_brightness $((cur_brightness - indent))
fi
