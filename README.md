# hurq

A cronnable script for archiving YouTube channels to IPFS.

Standard disclaimers apply - I am not liable for loss of data, copyright violation, etc. 

Note that this script explicitly deletes existing ipfs shares as it runs; please take this into account and act accordingly.

## prereqs

- yt-dlp
- go-ipfs

Make sure you have your IPFS node initialised.

## config

If the YouTube channel to be archived has a user ID, set CHANNEL\_TYPE to 1 and set the USER\_ID value to the user ID from the channel (e.g. hickock45).

If the YouTube channel to be archived has a channel ID, set CHANNEL\_TYPE to 0 and set the CHANNEL\_ID value to the channel ID.
