#!/bin/bash

USER_ID=
CHANNEL_ID=
CHANNEL_TYPE=1

CACHE=videos.txt
HASH_PATH=~/hurq-hash.txt
VIDEO_PATH=~/hurq/videos

ipfs pin ls --type recursive | cut -d' ' -f1 | xargs -n1 ipfs pin rm
ipfs repo gc

mkdir -p $VIDEO_PATH

if [ "$CHANNEL_TYPE" = "0" ]
then
	CHANNEL_URL=https://www.youtube.com/channel/$CHANNEL_ID/videos
	CHANNEL_DIR="${VIDEO_PATH}/${CHANNEL_ID}"
	yt-dlp -S "+res:720,ext" -ciw --download-archive $CACHE $CHANNEL_URL -P $VIDEO_PATH -o '%(channel_id)s/%(title)s.%(ext)s'
fi
if [ "$CHANNEL_TYPE" = "1" ]
then
	CHANNEL_URL=https://www.youtube.com/user/$USER_ID/videos
	CHANNEL_DIR="${VIDEO_PATH}/${USER_ID}"
	yt-dlp -S "+res:720,ext" -ciw --download-archive $CACHE $CHANNEL_URL -P $VIDEO_PATH -o '%(channel)s/%(title)s.%(ext)s'
fi

ipfs add -r $CHANNEL_DIR
ipfs pin ls --type recursive > $HASH_PATH
