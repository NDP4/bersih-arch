# Bersih - Utilitas Pembersih Sistem untuk Arch Linux

Utilitas sederhana untuk membersihkan sistem Arch Linux Anda.

## Fitur

- Membersihkan cache package manager (pacman, yay, paru)
- Menghapus paket yang tidak terpakai
- Membersihkan file sementara
- Berjalan pada arsitektur x86_64 dan ARM
- Mendukung Bash dan Zsh

## Pemasangan

### Menggunakan AppImage

1. Unduh rilis terbaru dari halaman [Releases](https://github.com/GANTI_DENGAN_USERNAME_ANDA/bersih/releases)
2. Jadikan file dapat dieksekusi:
   ```bash
   chmod +x Bersih.AppImage
   ```
3. Jalankan:
   ```bash
   ./Bersih.AppImage [OPSI]
   ```

### Pengembangan

1. Klon repositori:
   ```bash
   git clone https://github.com/NDP4/bersih-arch.git
   cd bersih
   ```
2. Jadikan script dapat dieksekusi:
   ```bash
   chmod +x bersih
   ```
3. Buat symbolic link untuk pengujian:
   ```bash
   sudo ln -s $(pwd)/bersih /usr/local/bin/bersih
   ```

## Penggunaan

```bash
bersih -h         # Menampilkan bantuan
bersih -update    # Membersihkan cache package manager
bersih -temp      # Membersihkan file sementara
bersih -deep      # Pembersihan mendalam"
bersih -all       # Membersihkan semuanya
```

## Dependensi

Sebelum menggunakan, pastikan telah menginstall:

- pv (untuk tampilan progress)

Install dengan:

```bash
sudo pacman -S pv
```

## Membuat AppImage

1. Pasang tools yang diperlukan:
   ```bash
   wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
   chmod +x appimagetool-x86_64.AppImage
   ```
2. Siapkan AppDir:
   ```bash
   mkdir -p AppDir/usr/bin
   cp bersih AppDir/usr/bin/
   ```
3. Buat AppImage:
   ```bash
   ./appimagetool-x86_64.AppImage AppDir Bersih.AppImage
   ```

## Pengujian

1. Pengujian pengembangan:

   ```bash
   ./bersih -h
   sudo ./bersih -update
   ./bersih -temp
   ```

2. Pengujian AppImage:
   ```bash
   ./Bersih.AppImage -h
   sudo ./Bersih.AppImage -update
   ./Bersih.AppImage -temp
   ```

## Lisensi

MIT
