#!/bin/bash

# Nama file konfigurasi
CONFIG_FILE="/etc/sysconfig/network-scripts/ifcfg-eth0"

# Periksa apakah file konfigurasi sudah ada
if [ -f "$CONFIG_FILE" ]; then
    echo "File konfigurasi sudah ada, membackup file lama."
    cp $CONFIG_FILE $CONFIG_FILE.bak
fi

# Buat file konfigurasi baru
echo "Membuat file konfigurasi untuk eth0..."
cat <<EOL > $CONFIG_FILE
DEVICE=eth0
BOOTPROTO=none
ONBOOT=yes
IPADDR=192.168.3.251
NETMASK=255.255.255.0
GATEWAY=192.168.3.1
EOL

# Tampilkan isi file konfigurasi
echo "File konfigurasi dibuat:"
cat $CONFIG_FILE

# Restart layanan jaringan
echo "Merestart layanan jaringan..."
service network restart

# Verifikasi konfigurasi
echo "Verifikasi konfigurasi:"
ifconfig eth0
