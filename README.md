# ffmpeg
These scripts are used to download a real time stream. Just run the script and don't need to touch anything. It's automatic. If the stream crash, the script loop until the stream come back.


## What's ffmpeg ?
ffmpeg is a very powerful command line video encoder and reader software. There are GUIs, but here I will be talking about the command line.

## How it's works ?
Go to a stream, and take the m3u8 link of the stream. 2 ways : 
-   Go to page's source code, in network heading, search "m3u8" and you find the link ending by m3u8.
-   Use browser's extension "Video DownloadHelper", and on stream page, it show the link.

(An m3u8 file is a playlist file used by various audio and video playback programs. It contains a path or URL to a media file or folder of media files.)

## Installation

Debian et Ubuntu

```sh
sudo apt-get update && sudo apt-get install ffmpeg
```

From official GIT
```sh
git clone git://git.ffmpeg.org/ffmpeg/
cd ffmpeg
git clone git://git.ffmpeg.org/libswscale/
```

Windows

https://www.ffmpeg.org/download.html
