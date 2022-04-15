# hurq

A cronnable script for archiving YouTube channels to [IPFS](https://ipfs.io/).

Standard disclaimers apply - I am not liable for loss of data, copyright violation, etc. 

Note that this script explicitly deletes existing ipfs shares as it runs; please take this into account and act accordingly.

## prereqs

- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [go-ipfs](https://github.com/ipfs/go-ipfs)

Make sure you have your IPFS node [initialised](https://docs.ipfs.io/how-to/command-line-quick-start/#initialize-the-repository).

## config

If the YouTube channel to be archived has a user ID, set `CHANNEL_TYPE` to 1 and set the `USER_ID` value to the user ID from the channel (e.g. vekchannel).

If the YouTube channel to be archived has a channel ID, set `CHANNEL_TYPE` to 0 and set the `CHANNEL_ID` value to the channel ID (e.g. UCDFD8RdIL2FxNfkKkus5RSQ).

## run

Set configuration variables as appropriate.

Ensure hurq.sh has the execute permission set.

Run hurq.sh. The hash of the directory the archived channel lives in will be output to `~/hurq-hash.txt`.
