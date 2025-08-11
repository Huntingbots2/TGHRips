#!/data/data/com.termux/files/usr/bin/bash

# Update system
pkg update -y && pkg upgrade -y

# Install required packages
pkg install -y ffmpeg aria2 curl wget unzip tar git libc++

# Create working directory
mkdir -p ~/tools && cd ~/tools

# Download latest N_m3u8DL-RE binary for Android (ARM64)
echo "Downloading N_m3u8DL-RE..."
N_RE_URL=$(curl -s https://api.github.com/repos/nilaoda/N_m3u8DL-RE/releases/latest \
  | grep "browser_download_url.*android-bionic-arm64.*tar.gz" \
  | cut -d '"' -f 4)

wget "$N_RE_URL" -O N_m3u8DL-RE.tar.gz
tar -xvzf N_m3u8DL-RE.tar.gz
chmod +x N_m3u8DL-RE

# Download Bento4 mp4decrypt prebuilt binary (custom fallback mirror)
echo "Downloading mp4decrypt..."
wget -O mp4decrypt https://github.com/DavidMuhammad/bento4-static-builds/raw/main/android/mp4decrypt-arm64
chmod +x mp4decrypt

# Add to PATH
echo 'export PATH=$HOME/tools:$PATH' >> ~/.bashrc
source ~/.bashrc

# Verify tools
echo -e "\n✅ Tools installed:"
N_m3u8DL-RE --version 2>/dev/null || echo "N_m3u8DL-RE installed"
mp4decrypt --version 2>/dev/null || echo "mp4decrypt installed"
ffmpeg -version | head -n 1
