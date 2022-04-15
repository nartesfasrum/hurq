#!/bin/bash

CHANNEL=https://www.youtube.com/user/hickok45/videos
CACHE=videos.txt

yt-dlp -S "+res:720,ext" -ciw --download-archive $CACHE $CHANNEL -o '%(channel)s/%(title)s.%(ext)s'
