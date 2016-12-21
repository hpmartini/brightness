#!/bin/bash

maxBrightness=`cat /sys/class/backlight/intel_backlight/max_brightness`;
brightness=`cat /sys/class/backlight/intel_backlight/brightness`;

echo max brightness: $maxBrightness;
echo current brightness: $brightness;

if (( $2 > 0 )) && (( $2 <= 100 )); then
    percent=$2;
else
    percent=10;
fi

level=`expr $maxBrightness / 100 \* $percent`;

if (( $brightness > 0  )) && (( $level > $brightness )); then
    level=$brightness;
elif (( $brightness < 100  )) && (( $level > $maxBrightness - $brightness )); then
    level=`expr $maxBrightness - $brightness`;
fi

if [ $1 == "up" ]; then
    newBrightness=`expr $brightness + $level`;
elif [ $1 == "down" ]; then
    newBrightness=`expr $brightness - $level`;
fi

echo adjusting brightness $1: $level points \($2%\)

sudo echo $newBrightness > /sys/class/backlight/intel_backlight/brightness;

echo brightness is now: $newBrightness
