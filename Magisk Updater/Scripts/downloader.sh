#!/data/data/com.termux/files/usr/bin/bash


GH_API="https://api.github.com"
GH_REPO="$GH_API/repos/topjohnwu/Magisk"
GH_LATEST="$GH_REPO/releases/latest"

Release_URL="$GH_LATEST |  $(grep "browser_download_url.*apk")"
URL_FILTER="$(cut -d : -f 2,3 | tr -d \" | tr -d " ")"
Magisk_APK="$Release_URL | $(grep -i "Magisk" | $URL_FILTER)"
Stub_APK="$Release_URL | $(grep -i "stub" | $URL_FILTER)"

CHECK_URL="$(curl --output /dev/null --silent --head --fail "$1")"
GET_URL="$(curl -sL "$1")"
DOWNLOADER="$(wget -O "$GET_URL")"

WORK_DIR="/storage/emulated/0/Download/Magisk_Updater/"
WORK_TMP="$WORK_DIR/.tmp/"
BIN_DIR="$WORK_DIR/bin/"
RAMDISK_DIR="$WORK_DIR/ramdisk/"
BUILD_SCRIPT="$WORK_DIR/rpi-magisk.sh"
