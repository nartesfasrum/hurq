# hurq

A cronnable script for archiving YouTube channels to [IPFS](https://ipfs.io/).

Standard disclaimers apply - I am not liable for loss of data, copyright violation, etc. 

Note that this script explicitly deletes existing ipfs shares as it runs; please take this into account and act accordingly.

## prereqs

- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [go-ipfs](https://github.com/ipfs/go-ipfs)

Make sure you have your IPFS node [initialised](https://docs.ipfs.io/how-to/command-line-quick-start/#initialize-the-repository).

## run

`--channel-id` is the UID YouTube uses for identifying channels, typically a string following another string (one of 3 types: a `/channel/`, a `/c/`, or a `/user/`).

`--channel-type` is the type of channel to downloaded from:

 - 0 for `channel-id`s from the `/channel/` URL
 - 1 for `channel-id`s from the `/c/` URL
 - 2 for `channel-id`s from the `/user/` URL

Examine the URL to find which `channel-type` is necessary.

`--path` is the working directory hurq will store its files in.

Ensure hurq.sh has the execute permission set.

Run hurq.sh. The hash of the directory the archived channel lives in will be output to `hurq-hash.txt` in the `--path` directory specified.

### examples

Download the [BatzorigVaanchig](https://www.youtube.com/c/BatzorigVaanchig) channel:

`./hurq.sh --channel-id BatzorigVaanchig --channel-type 1 --path /home/nartesfasrum/Videos/`
