#!/bin/sh
# ZeroHost installer for macOS (Apple Silicon) and Linux (x86_64, aarch64). No root needed.
#   curl -fsSL https://raw.githubusercontent.com/epx-ducky/zerohost-install/main/install.sh | sh
set -eu
BASE="https://github.com/epx-ducky/zerohost-install/releases/latest/download"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

OS="$(uname -s)"; ARCH="$(uname -m)"
if [ "$OS" = "Darwin" ]; then
    [ "$ARCH" = "arm64" ] || { echo "ZeroHost braucht einen Mac mit Apple-Chip (M1 oder neuer)."; exit 1; }
    echo "Lade ZeroHost für macOS …"
    curl -fL --progress-bar -o "$TMP/ZeroHost.dmg" "$BASE/ZeroHost-macos-arm64.dmg"
    MNT="$(hdiutil attach -nobrowse -readonly "$TMP/ZeroHost.dmg" | tail -1 | awk -F'\t' '{print $NF}')"
    DEST=/Applications
    [ -w "$DEST" ] || { DEST="$HOME/Applications"; mkdir -p "$DEST"; }
    rm -rf "$DEST/ZeroHost.app"
    cp -R "$MNT/ZeroHost.app" "$DEST/"
    hdiutil detach -quiet "$MNT"
    echo "Installiert: $DEST/ZeroHost.app – starte …"
    open "$DEST/ZeroHost.app"
    echo "Beim ersten Start lädt ZeroHost das passende Modell (rund 12–15 GB). Das Dashboard öffnet sich im Browser."
elif [ "$OS" = "Linux" ]; then
    case "$ARCH" in x86_64|aarch64) ;; *) echo "Nicht unterstützt: $ARCH"; exit 1 ;; esac
    echo "Lade ZeroHost für Linux ($ARCH) …"
    curl -fL --progress-bar -o "$TMP/zh.tar.gz" "$BASE/zerohost-linux-$ARCH.tar.gz"
    tar -xzf "$TMP/zh.tar.gz" -C "$TMP"
    "$TMP/zerohost/install.sh" "$@"
    echo "Start: zerohost-app   (Dashboard auf http://127.0.0.1:8420)"
else
    echo "Für Windows: install.ps1 (siehe README)."; exit 1
fi
