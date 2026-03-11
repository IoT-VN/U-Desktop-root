#!/data/data/com.termux/files/usr/bin/bash

MODULE_PATH="/data/adb/modules/busybox-ndk"
DOWNLOAD_PATH="/sdcard/Download/UPDATE-Busybox.Installer.v1.36.1-ALL-signed.zip"
URL="https://github.com/IoT-VN/U-Desktop-root/raw/refs/heads/main/busybox-ndk/UPDATE-Busybox.Installer.v1.36.1-ALL-signed.zip"

echo "Checking busybox-ndk module..."

su -c "ls /data/adb/modules" | grep -q "busybox-ndk"

if [ $? -ne 0 ]; then
    echo "busybox-ndk not found. Downloading..."

    pkg install -y wget > /dev/null 2>&1

    wget -O "$DOWNLOAD_PATH" "$URL"

    if [ -f "$DOWNLOAD_PATH" ]; then
        echo "Download completed:"
        echo "$DOWNLOAD_PATH"
    else
        echo "Download failed."
    fi
else
    echo "busybox-ndk already installed."
fi
