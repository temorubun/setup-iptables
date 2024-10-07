#!/bin/bash

# Nama file konfigurasi
CONFIG_FILE="/etc/network/interfaces"
NM_CONFIG="/etc/NetworkManager/conf.d/10-eth1.conf"

# Backup file konfigurasi jika belum ada backup
if [ ! -f "$CONFIG_FILE.bak" ]; then
    echo "Membackup file konfigurasi lama."
    cp $CONFIG_FILE $CONFIG_FILE.bak
else
    echo "Backup file konfigurasi sudah ada."
fi

# Bersihkan duplikasi konfigurasi eth1 dan tambahkan konfigurasi baru
echo "Membersihkan konfigurasi duplikat dan menambahkan konfigurasi untuk eth1..."
sed -i '/auto eth1/,+3d' $CONFIG_FILE  # Hapus konfigurasi lama untuk eth1

cat <<EOL >> $CONFIG_FILE

# Konfigurasi eth1
auto eth1
iface eth1 inet static
    address 192.168.4.136
    netmask 255.255.255.0
    gateway 192.168.4.250
EOL

# Tampilkan isi file konfigurasi setelah diedit
echo "File konfigurasi telah diperbarui:"
cat $CONFIG_FILE

# Hapus pengaturan NetworkManager untuk eth1 jika ada
echo "Menghapus pengaturan NetworkManager untuk eth1..."
nmcli connection delete eth1 2>/dev/null

# Nonaktifkan eth1 di NetworkManager
echo "Menonaktifkan NetworkManager untuk eth1..."
cat <<EOL > $NM_CONFIG
[keyfile]
unmanaged-devices=interface-name:eth1
EOL

# Restart layanan NetworkManager dan networking
echo "Merestart layanan NetworkManager..."
sudo systemctl restart NetworkManager
sudo ifdown eth1 2>/dev/null && sudo ifup eth1 2>/dev/null  # Restart interface eth1

# Jika ifdown/ifup gagal, restart layanan jaringan sepenuhnya
if [ $? -ne 0 ]; then
    echo "ifdown/ifup gagal, mencoba merestart layanan jaringan sepenuhnya..."
    sudo systemctl restart networking
fi

# Verifikasi konfigurasi
echo "Verifikasi konfigurasi:"
ifconfig eth1

# Pastikan NetworkManager tidak mengelola eth1 lagi
echo "Menonaktifkan NetworkManager sepenuhnya jika masih ada konflik..."
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
