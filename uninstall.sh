#!/usr/bin/env bash
# V4Z WEB RIPPER — uninstaller for Termux / Linux
set -e

BIN_DIR="${PREFIX:-/usr/local}/bin"
BIN="$BIN_DIR/v4zrip"

if [ -f "$BIN" ]; then
  rm -f "$BIN"
  echo "[+] V4Z Web Ripper removed."
else
  echo "[!] v4zrip not found in $BIN_DIR"
fi
