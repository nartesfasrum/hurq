# hurq

A cronnable script for archiving YouTube channels to [IPFS](https://ipfs.io/).

Standard disclaimers apply - I am not liable for loss of data, copyright violation, etc. 

Note that this script explicitly deletes existing ipfs shares as it runs; please take this into account and act accordingly.

## prereqs

- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [go-ipfs](https://github.com/ipfs/go-ipfs)

Make sure you have your IPFS node [initialised](https://docs.ipfs.io/how-to/command-line-quick-start/#initialize-the-repository).

## run

Copy `example-config.sh` to `config.sh` & set configuration variables as appropriate. Information on what each variable does is in the comments of `example-config.sh`.

Ensure hurq.sh has the execute permission set.

Run hurq.sh. The hash of the directory the archived channel lives in will be output to `~/hurq-hash.txt`.
