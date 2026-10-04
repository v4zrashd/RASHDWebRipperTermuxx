#!/usr/bin/env bash
# V4Z WEB RIPPER — one-command setup for Termux / Linux
# Run:  curl -fsSL https://raw.githubusercontent.com/v4zrashd/RASHDWebRipperTermuxx/main/install.sh | bash
# Does everything: package update+upgrade, Python install, phone
# storage setup, and the v4zrip tool install. Menu mode included:
# just type  v4zrip  and it asks for the link.
# Ripped sites auto-save to Download/V4Z-Rips on the phone.
set -e

REPO="v4zrashd/RASHDWebRipperTermuxx"
BIN_DIR="${PREFIX:-/usr/local}/bin"
BIN="$BIN_DIR/v4zrip"

echo "=============================================="
echo "  V4Z WEB RIPPER — one-command setup"
echo "=============================================="

if command -v pkg >/dev/null 2>&1; then
  export DEBIAN_FRONTEND=noninteractive
  echo "[*] Updating all Termux packages (can take a few minutes)..."
  if ! pkg update -y </dev/null; then
    echo "[!] Mirror not responding — switching to the official Termux mirror..."
    echo "deb https://packages-cf.termux.dev/apt/termux-main stable main" \
      > "$PREFIX/etc/apt/sources.list"
    pkg update -y </dev/null
  fi
  pkg upgrade -y -o Dpkg::Options::="--force-confold" </dev/null || \
    echo "[!] Some packages skipped upgrade — continuing anyway."
  echo "[*] Installing python..."
  pkg install -y python </dev/null
  if [ ! -d "$HOME/storage" ]; then
    echo "[*] Setting up phone storage access..."
    echo "    -> When Android asks, tap ALLOW (one time only)."
    termux-setup-storage </dev/null || true
  fi
elif ! command -v python3 >/dev/null 2>&1; then
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y python3
  else
    echo "[!] python3 not found. Please install python3 first."
    exit 1
  fi
fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "[!] Python still missing. Run:  termux-change-repo"
  echo "    pick any mirror, then run this installer command again."
  exit 1
fi

echo "[*] Downloading v4zrip..."
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/v4zrip" -o "$BIN"
chmod +x "$BIN"

echo ""
echo "[+] DONE! Now just run:"
echo "    v4zrip"
echo ""
echo "    It will ask for the website link — that's it."
echo "    Ripped sites auto-save to: Download/V4Z-Rips (phone storage)"
echo "    Join: https://t.me/rashdteem"
