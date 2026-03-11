#!/data/data/com.termux/files/usr/bin/bash

MODULE="busybox-ndk"
MODULE_DIR="/data/adb/modules/$MODULE"

ZIP="UPDATE-Busybox.Installer.v1.36.1-ALL-signed.zip"
URL="https://raw.githubusercontent.com/IoT-VN/U-Desktop-root/main/busybox-ndk/$ZIP"
DL="/sdcard/Download/$ZIP"

echo "==== Checking Busybox module ===="

if su -c "[ -d $MODULE_DIR ]"; then
    echo "busybox-ndk already installed."
    exit 0
fi

echo "busybox-ndk not found."

echo "==== Downloading module ===="

pkg install -y wget > /dev/null 2>&1

wget -O "$DL" "$URL"

if [ ! -f "$DL" ]; then
    echo "Download failed."
    exit 1
fi

echo "Download complete:"
echo "$DL"

echo "==== Installing module via Magisk ===="

su -c "magisk --install-module $DL"

if [ $? -ne 0 ]; then
    echo "Magisk install failed."
    exit 1
fi

echo "Module installed successfully."

echo "==== Rebooting device ===="

su -c reboot
