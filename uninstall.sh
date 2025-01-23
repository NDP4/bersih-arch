#!/bin/bash

# Lokasi instalasi
INSTALL_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons/hicolor/256x256/apps"

# Hapus file aplikasi
rm -f "$INSTALL_DIR/bersih"
rm -f "$DESKTOP_DIR/bersih.desktop"
rm -f "$ICON_DIR/bersih.png"

# Update database desktop
update-desktop-database "$DESKTOP_DIR" 2>/dev/null

echo "Bersih telah dihapus dari sistem"
echo "Silakan hapus baris PATH di .bashrc atau .zshrc jika diperlukan"
