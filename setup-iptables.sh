# Set default policies to DROP for OUTPUT and ACCEPT for INPUT
sudo iptables -P OUTPUT DROP
sudo iptables -P INPUT ACCEPT

# Izinkan lalu lintas dari loopback (localhost)
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# Izinkan semua lalu lintas ICMP (untuk ping)
sudo iptables -A INPUT -p icmp -j ACCEPT
sudo iptables -A OUTPUT -p icmp -j ACCEPT

# Izinkan koneksi TCP pada port 7031 (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 7031 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 7031 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi UDP pada port 7031 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 7031 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 7031 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi HTTP (port 80) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi UDP pada port 80 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi HTTPS (port 443) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi UDP pada port 443 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi SSH (port 22) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi UDP pada port 22 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi MySQL (port 3306) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi UDP pada port 3306 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi RPC (port 111) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 111 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 111 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi UDP pada port 111 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 111 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 111 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi CUPS (port 631) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 631 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 631 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi UDP pada port 631 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 631 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 631 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi DHCP (port 68) (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 68 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 68 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi UDP pada port 615 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 615 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 615 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi UDP pada port 618 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 618 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 618 -m state --state NEW,ESTABLISHED -j ACCEPT

# Izinkan koneksi UDP pada port 32768 dan 33410 (masuk dan keluar)
sudo iptables -A INPUT -p udp --sport 32768 -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 33410 -j ACCEPT

# Izinkan koneksi yang sudah ada (ESTABLISHED, RELATED) pada semua port
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Simpan aturan iptables agar tetap berlaku setelah reboot (CentOS)
sudo service iptables save
