#!/bin/bash

# Nama file konfigurasi
CONFIG_FILE="/etc/network/interfaces"
NM_CONFIG="/etc/NetworkManager/conf.d/10-eth0.conf"

# Backup file konfigurasi jika belum ada backup
if [ ! -f "$CONFIG_FILE.bak" ]; then
    echo "Membackup file konfigurasi lama."
    cp $CONFIG_FILE $CONFIG_FILE.bak
else
    echo "Backup file konfigurasi sudah ada."
fi

# Bersihkan duplikasi konfigurasi eth0 dan tambahkan konfigurasi baru
echo "Membersihkan konfigurasi duplikat dan menambahkan konfigurasi untuk eth0..."
sed -i '/auto eth0/,+3d' $CONFIG_FILE  # Hapus konfigurasi lama untuk eth0

cat <<EOL >> $CONFIG_FILE

# Konfigurasi eth0
auto eth0
iface eth0 inet static
    address 192.168.4.120
    netmask 255.255.255.0
    gateway 192.168.4.250
EOL

# Tampilkan isi file konfigurasi setelah diedit
echo "File konfigurasi telah diperbarui:"
cat $CONFIG_FILE

# Hapus pengaturan NetworkManager untuk eth0 jika ada
echo "Menghapus pengaturan NetworkManager untuk eth0..."
nmcli connection delete eth0 2>/dev/null

# Nonaktifkan eth0 di NetworkManager
echo "Menonaktifkan NetworkManager untuk eth0..."
cat <<EOL > $NM_CONFIG
[keyfile]
unmanaged-devices=interface-name:eth0
EOL

# Restart layanan NetworkManager dan networking
echo "Merestart layanan NetworkManager..."
sudo systemctl restart NetworkManager
sudo ifdown eth0 2>/dev/null && sudo ifup eth0 2>/dev/null  # Restart interface eth0

# Jika ifdown/ifup gagal, restart layanan jaringan sepenuhnya
if [ $? -ne 0 ]; then
    echo "ifdown/ifup gagal, mencoba merestart layanan jaringan sepenuhnya..."
    sudo systemctl restart networking
fi

# Verifikasi konfigurasi
echo "Verifikasi konfigurasi:"
ifconfig eth0

# Pastikan NetworkManager tidak mengelola eth0 lagi
echo "Menonaktifkan NetworkManager sepenuhnya jika masih ada konflik..."
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
