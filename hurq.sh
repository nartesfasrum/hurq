#!/bin/bash

source config.sh

CACHE_PATH=$HURQ_PATH/downloaded-videos.txt
HASH_PATH=$HURQ_PATH/hurq-hash.txt
VIDEO_PATH=$HURQ_PATH/videos

if [[ $(ipfs pin ls --type recursive) ]]
then
	ipfs pin ls --type recursive | cut -d' ' -f1 | xargs -n1 ipfs pin rm
	ipfs repo gc
fi

if [[ -f "$HASH_PATH" ]]
then
	rm $HASH_PATH
fi

mkdir -p $VIDEO_PATH

if [ "$CHANNEL_TYPE" = "0" ]
then
	CHANNEL_URL=https://www.youtube.com/channel/$CHANNEL_ID/videos
	CHANNEL_DIR="${VIDEO_PATH}/${CHANNEL_ID}"
	yt-dlp -S "+res:720,ext" -ciw --download-archive $CACHE_PATH $CHANNEL_URL -P $VIDEO_PATH -o '%(channel_id)s/%(title)s.%(ext)s'
fi
if [ "$CHANNEL_TYPE" = "1" ]
then
	CHANNEL_URL=https://www.youtube.com/c/$CHANNEL_ID/videos
	CHANNEL_DIR="${VIDEO_PATH}/${CHANNEL_ID}"
	yt-dlp -S "+res:720,ext" -ciw --download-archive $CACHE_PATH $CHANNEL_URL -P $VIDEO_PATH -o '%(channel)s/%(title)s.%(ext)s'
fi
if [ "$CHANNEL_TYPE" = "2" ]
then
	CHANNEL_URL=https://www.youtube.com/user/$CHANNEL_ID/videos
	CHANNEL_DIR="${VIDEO_PATH}/${CHANNEL_ID}"
	yt-dlp -S "+res:720,ext" -ciw --download-archive $CACHE_PATH $CHANNEL_URL -P $VIDEO_PATH -o '%(channel)s/%(title)s.%(ext)s'
fi

ipfs add -r $CHANNEL_DIR
ipfs pin ls --type recursive > $HASH_PATH
