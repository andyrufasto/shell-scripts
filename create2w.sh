#!/bin/sh -x

image=$(readlink -f "$1")
base="${image%.*}"
ext="${image##*.}"

HEIGHT_FULL=$(magick identify $image | awk '{print $3}' | cut -f 1 -d 'x')
WIDTH_FULL=$(magick identify $image | awk '{print $3}' | cut -f 2 -d 'x')

HEIGHT_HALF=$(expr $HEIGHT_FULL / 2 )
WIDTH_HALF=$(expr $WIDTH_FULL / 2)


convert $image -crop "$HEIGHT_HALF"x"$WIDTH_FULL"+00 "$base"_l."$ext"
convert $image -crop "$HEIGHT_HALF"x"$WIDTH_FULL"+"$HEIGHT_HALF" "$base"_r."$ext"

convert "$base"_l."$ext" -resize 1920x1080 "$base"_sl."$ext"
convert "$base"_r."$ext" -resize 1366x768 "$base"_sr."$ext"

rm "$base"_l."$ext"
rm "$base"_r."$ext"

convert "$base"_sl."$ext" "$base"_sr."$ext" +append "$base"_2m."$ext"

rm "$base"_sl."$ext"
rm "$base"_sr."$ext"

