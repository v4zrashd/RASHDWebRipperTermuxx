#!/usr/bin/env bash
# V4Z WEB RIPPER — installer for Termux / Linux
set -e

REPO="v4zrashd/RASHDWebRipperTermuxx"
BIN_DIR="${PREFIX:-/usr/local}/bin"
BIN="$BIN_DIR/v4zrip"

echo "=============================================="
echo "  V4Z WEB RIPPER — installer"
echo "=============================================="

if ! command -v python3 >/dev/null 2>&1; then
  echo "[*] Installing python3..."
  if command -v pkg >/dev/null 2>&1; then
    pkg update -y && pkg install -y python
  elif command -v apt-get >/dev/null 2>&1; then
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
echo "    Join: https://t.me/rashdteem"
