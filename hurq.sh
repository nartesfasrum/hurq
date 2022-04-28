#!/bin/bash

ARGS=$(getopt -a --options c:t:p: --long "channel-id:,channel-type:,path:" -- "$@")
eval set -- "$ARGS"

while true; do
	case "$1" in
		-c|--channel-id)
			CHANNEL_ID="$2"
			echo $CHANNEL_ID
			shift 2;;
		-t|--channel-type)
			CHANNEL_TYPE="$2"
			echo $CHANNEL_TYPE
			shift 2;;
		-p|--path)
			HURQ_PATH="$2"
			echo $HURQ_PATH
			shift 2;;
		--)
			break;;
		*)
			printf "Unknown option %s\n" "$1"
			exit 1;;
	esac
done

CACHE_PATH=$HURQ_PATH/$CHANNEL_ID/downloaded-videos.txt
HASH_PATH=$HURQ_PATH/$CHANNEL_ID/hurq-hash.txt
VIDEO_PATH=$HURQ_PATH/$CHANNEL_ID/videos

mkdir -p $HURQ_PATH
mkdir -p $VIDEO_PATH

if [[ $(ipfs pin ls --type recursive) ]]
then
	ipfs pin ls --type recursive | cut -d' ' -f1 | xargs -n1 ipfs pin rm
	ipfs repo gc
fi

if [[ -f "$HASH_PATH" ]]
then
	rm $HASH_PATH
fi

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
