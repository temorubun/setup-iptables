#!/bin/bash

# Buat direktori /etc/iptables jika belum ada
if [ ! -d /etc/iptables ]; then
    sudo mkdir -p /etc/iptables
    echo "Direktori /etc/iptables dibuat."
fi

# Hapus semua aturan iptables yang ada
sudo iptables -F

# Atur kebijakan default untuk memblokir semua koneksi yang masuk
sudo iptables -P INPUT DROP

# Izinkan koneksi TCP pada port 7031
sudo iptables -A INPUT -p tcp --dport 7031 -j ACCEPT

# Izinkan koneksi UDP pada port 7031
sudo iptables -A INPUT -p udp --dport 7031 -j ACCEPT

# Izinkan koneksi HTTP (port 80)
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Izinkan koneksi HTTPS (port 443)
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Izinkan koneksi SSH (port 22)
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Izinkan koneksi FTP (port 21)
sudo iptables -A INPUT -p tcp --dport 21 -j ACCEPT

# Izinkan koneksi SMTP (port 25)
sudo iptables -A INPUT -p tcp --dport 25 -j ACCEPT

# Izinkan koneksi POP3 (port 110)
sudo iptables -A INPUT -p tcp --dport 110 -j ACCEPT

# Izinkan koneksi IMAP (port 143)
sudo iptables -A INPUT -p tcp --dport 143 -j ACCEPT

# Izinkan koneksi POP3S (port 995)
sudo iptables -A INPUT -p tcp --dport 995 -j ACCEPT

# Izinkan koneksi IMAPS (port 993)
sudo iptables -A INPUT -p tcp --dport 993 -j ACCEPT

# Izinkan koneksi MySQL (port 3306)
sudo iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

# Izinkan koneksi PostgreSQL (port 5432)
sudo iptables -A INPUT -p tcp --dport 5432 -j ACCEPT

# Izinkan koneksi yang sudah ada atau terkait
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Izinkan lalu lintas dari loopback (localhost)
sudo iptables -A INPUT -i lo -j ACCEPT

# Izinkan semua koneksi keluar
sudo iptables -P OUTPUT ACCEPT

# Simpan aturan iptables
sudo sh -c "iptables-save > /etc/iptables/rules.v4"
echo "Aturan iptables disimpan di /etc/iptables/rules.v4."

echo "Aturan iptables berhasil diterapkan dan disimpan."
