#!/usr/bin/sh
#stream audio and video from lofi hip hop radio

url='https://youtu.be/5qap5aO4i9A'
quality=best
title='lofi hip hop radio'

youtube-dl -f $quality -o - "$url" 2>/dev/null |
	ffplay -window_title "$title" -i - >/dev/null 2>&1
