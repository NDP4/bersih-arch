#!/bin/bash

# Lokasi instalasi
INSTALL_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons/hicolor/256x256/apps"

# Periksa apakah AppImage ada
if [ ! -f "Bersih-x86_64.AppImage" ]; then
    echo "Error: Bersih-x86_64.AppImage tidak ditemukan"
    exit 1
fi

# Buat direktori jika belum ada
mkdir -p "$INSTALL_DIR"
mkdir -p "$DESKTOP_DIR"
mkdir -p "$ICON_DIR"

# Salin dan rename AppImage
cp "Bersih-x86_64.AppImage" "$INSTALL_DIR/bersih"
chmod +x "$INSTALL_DIR/bersih"

# Buat symlink jika belum ada
if [ ! -L "/usr/local/bin/bersih" ]; then
    sudo ln -s "$INSTALL_DIR/bersih" "/usr/local/bin/bersih"
fi

# Buat desktop entry
cat > "$DESKTOP_DIR/bersih.desktop" << EOF
[Desktop Entry]
Name=Bersih
Exec=bersih
Icon=bersih
Type=Application
Categories=System;Utility;
Comment=Utilitas Pembersih Sistem untuk Arch Linux
Terminal=true
EOF

# Salin icon
cp "AppDir/bersih.png" "$ICON_DIR/bersih.png"

# Tambahkan ke PATH jika belum ada
if ! grep -q "$INSTALL_DIR" "$HOME/.bashrc"; then
    echo "export PATH=\$PATH:$INSTALL_DIR" >> "$HOME/.bashrc"
fi

if ! grep -q "$INSTALL_DIR" "$HOME/.zshrc" 2>/dev/null; then
    echo "export PATH=\$PATH:$INSTALL_DIR" >> "$HOME/.zshrc" 2>/dev/null
fi

# Update database desktop
update-desktop-database "$DESKTOP_DIR" 2>/dev/null

# Tambahkan ke PATH dan reload shell
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.profile"
source "$HOME/.profile"

echo "Bersih telah terinstall!"
echo "Coba jalankan: bersih -h"
