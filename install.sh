#!/usr/bin/env bash
# V4Z WEB RIPPER — one-command installer for Termux / Linux
# Updates Termux packages, installs Python, sets up phone storage,
# and installs v4zrip. Ripped sites auto-save to Download/V4Z-Rips.
set -e

REPO="v4zrashd/RASHDWebRipperTermuxx"
BIN_DIR="${PREFIX:-/usr/local}/bin"
BIN="$BIN_DIR/v4zrip"

echo "=============================================="
echo "  V4Z WEB RIPPER — installer"
echo "=============================================="

if command -v pkg >/dev/null 2>&1; then
  export DEBIAN_FRONTEND=noninteractive
  echo "[*] Updating all Termux packages (this can take a few minutes)..."
  if ! pkg update -y </dev/null; then
    echo "[!] Package update failed — your Termux mirror may be down."
    echo "    Fix: run  termux-change-repo  , pick another mirror,"
    echo "    then run this installer again."
    exit 1
  fi
  pkg upgrade -y -o Dpkg::Options::="--force-confold" </dev/null
  echo "[*] Installing python..."
  pkg install -y python </dev/null
  if [ ! -d "$HOME/storage" ]; then
    echo "[*] Setting up phone storage access..."
    echo "    -> When Android asks, tap ALLOW (one time only)."
    termux-setup-storage || true
  fi
elif ! command -v python3 >/dev/null 2>&1; then
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y python3
  else
    echo "[!] python3 not found. Please install python3 first."
    exit 1
  fi
fi

echo "[*] Downloading v4zrip..."
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/v4zrip" -o "$BIN"
chmod +x "$BIN"

echo ""
echo "[+] Installed! Run it with:"
echo "    v4zrip https://example.com"
echo ""
echo "    Ripped sites auto-save to: Download/V4Z-Rips (phone storage)"
echo "    Join: https://t.me/rashdteem"
