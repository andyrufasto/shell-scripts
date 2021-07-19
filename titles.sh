#!/bin/sh

ls *mp3 > songs.txt
sed 's/.mp3//;s/_/ /g;s/^/"/;s/$/"/' songs.txt > titles.txt
paste titles.txt songs.txt | sed 's/^/id3 -t /g'| sh
rm songs.txt titles.txt



