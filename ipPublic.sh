#!/bin/bash

# Nama file konfigurasi untuk eth2
CONFIG_FILE="/etc/sysconfig/network-scripts/ifcfg-eth2"

# Periksa apakah file konfigurasi sudah ada
if [ -f "$CONFIG_FILE" ]; then
    echo "File konfigurasi sudah ada, membackup file lama."
    cp $CONFIG_FILE $CONFIG_FILE.bak
fi

# Buat file konfigurasi baru untuk eth2
echo "Membuat file konfigurasi untuk eth2..."
cat <<EOL > $CONFIG_FILE
DEVICE=eth2
BOOTPROTO=none
ONBOOT=yes
IPADDR=160.19.84.83
NETMASK=255.255.255.0
GATEWAY=160.19.84.1  # Sesuaikan gateway sesuai dengan konfigurasi jaringan Anda
EOL

# Tampilkan isi file konfigurasi
echo "File konfigurasi dibuat:"
cat $CONFIG_FILE

# Restart layanan jaringan
echo "Merestart layanan jaringan..."
service network restart

# Verifikasi konfigurasi
echo "Verifikasi konfigurasi:"
ifconfig eth2
