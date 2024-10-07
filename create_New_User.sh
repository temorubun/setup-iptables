#!/bin/bash

# Membuat user baru dengan username "agung"
username="agung"
password="agung"

# Menambah user
sudo useradd -m -s /bin/bash $username

# Mengatur password untuk user baru
echo "$username:$password" | sudo chpasswd

# Memberikan hak akses sudo kepada user
sudo usermod -aG wheel $username

# Menambahkan user ke sudoers secara eksplisit jika belum ada
if ! sudo grep -q "^$username " /etc/sudoers; then
    echo "$username ALL=(ALL) ALL" | sudo tee -a /etc/sudoers
fi

# Menampilkan informasi
echo "User $username telah dibuat, ditambahkan ke grup wheel, dan memiliki akses sudo."
