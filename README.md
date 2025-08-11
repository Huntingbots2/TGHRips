# MPD DASH Video Downloader

A simple, cross-platform tool to download videos from MPD/DASH streams.  
Supports downloading and merging video/audio streams into a single MP4 file.  
Includes setup scripts for Android (Termux) users.

## Features

- Download video from MPD/DASH URLs
- Merges audio and video tracks
- Command-line interface (Python)
- Android/Termux support via helper script

## Requirements

- Python 3.7+
- [ffmpeg](https://ffmpeg.org/) (must be installed and in PATH)
- [streamlink](https://streamlink.github.io/)
- (Optional for Android) [N_m3u8DL-RE](https://github.com/nilaoda/N_m3u8DL-RE), mp4decrypt, aria2

## Installation

```bash
git clone https://github.com/Huntingbots2/TGHRips.git
cd TGHRips
pip install -r requirements.txt
```

### For Termux (Android)

Run the setup script to install all required tools:
```bash
chmod +x setup-termux.sh
./setup-termux.sh
```

## Usage

```bash
python downloader.py <MPD_URL> [output_filename.mp4]
```

Example:
```bash
python downloader.py https://example.com/path/to/manifest.mpd video.mp4
```

## Disclaimer

- This tool is for educational purposes only.
- Downloading copyrighted or protected content may violate laws.

## License

MIT
