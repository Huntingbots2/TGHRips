import sys
import subprocess

def check_ffmpeg():
    try:
        subprocess.run(["ffmpeg", "-version"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        return True
    except FileNotFoundError:
        print("ffmpeg is not installed or not in PATH.")
        return False

def download_stream(mpd_url, output_file):
    cmd = [
        "streamlink",
        mpd_url,
        "best",
        "-o", output_file
    ]
    result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if result.returncode != 0:
        print("Download failed. Output:")
        print(result.stdout.decode())
        print(result.stderr.decode())
        sys.exit(1)
    else:
        print(result.stdout.decode())
        print(result.stderr.decode())

def main():
    if len(sys.argv) < 2:
        print("Usage: python bot.py <MPD_URL> [output_filename.mp4]")
        sys.exit(1)
    mpd_url = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else "output.mp4"

    if not check_ffmpeg():
        sys.exit(1)
    print(f"Downloading from: {mpd_url}")
    print(f"Saving to: {output_file}")
    download_stream(mpd_url, output_file)
    print("Download complete!")

if __name__ == "__main__":
    main()
