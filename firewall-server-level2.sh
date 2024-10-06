# Set default policies to DROP for OUTPUT and ACCEPT for INPUT
sudo iptables -P OUTPUT DROP  # Menetapkan kebijakan default untuk lalu lintas keluar menjadi DROP (blokir semua kecuali yang diizinkan).
sudo iptables -P INPUT ACCEPT  # Menetapkan kebijakan default untuk lalu lintas masuk menjadi ACCEPT (izinkan semua kecuali yang diblokir).

# Izinkan lalu lintas dari loopback (localhost)
sudo iptables -A INPUT -i lo -j ACCEPT  # Izinkan semua lalu lintas masuk dari interface loopback (127.0.0.1).
sudo iptables -A OUTPUT -o lo -j ACCEPT  # Izinkan semua lalu lintas keluar dari interface loopback.

# Izinkan semua lalu lintas ICMP (untuk ping)
sudo iptables -A INPUT -p icmp -j ACCEPT  # Izinkan lalu lintas ICMP masuk (seperti ping).
sudo iptables -A OUTPUT -p icmp -j ACCEPT  # Izinkan lalu lintas ICMP keluar.

# Izinkan koneksi TCP pada port 7031 (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 7031 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP baru dan yang sudah terhubung ke port 7031 (masuk).
sudo iptables -A OUTPUT -p tcp --dport 7031 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP baru dan yang sudah terhubung dari port 7031 (keluar).

# Izinkan koneksi UDP pada port 7031 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 7031 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung ke port 7031 (masuk).
sudo iptables -A OUTPUT -p udp --dport 7031 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung dari port 7031 (keluar).

# Izinkan koneksi HTTP (port 80) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP HTTP baru dan yang sudah terhubung ke port 80 (masuk).
sudo iptables -A OUTPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP HTTP baru dan yang sudah terhubung dari port 80 (keluar).

# Izinkan koneksi UDP pada port 80 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung ke port 80 (masuk).
sudo iptables -A OUTPUT -p udp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung dari port 80 (keluar).

# Izinkan koneksi HTTPS (port 443) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP HTTPS baru dan yang sudah terhubung ke port 443 (masuk).
sudo iptables -A OUTPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP HTTPS baru dan yang sudah terhubung dari port 443 (keluar).

# Izinkan koneksi UDP pada port 443 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung ke port 443 (masuk).
sudo iptables -A OUTPUT -p udp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung dari port 443 (keluar).

# Izinkan koneksi SSH (port 22) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi SSH baru dan yang sudah terhubung ke port 22 (masuk).
sudo iptables -A OUTPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi SSH baru dan yang sudah terhubung dari port 22 (keluar).

# Izinkan koneksi UDP pada port 22 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung ke port 22 (masuk).
sudo iptables -A OUTPUT -p udp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung dari port 22 (keluar).

# Izinkan koneksi MySQL (port 3306) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP MySQL baru dan yang sudah terhubung ke port 3306 (masuk).
sudo iptables -A OUTPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP MySQL baru dan yang sudah terhubung dari port 3306 (keluar).

# Izinkan koneksi UDP pada port 3306 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung ke port 3306 (masuk).
sudo iptables -A OUTPUT -p udp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung dari port 3306 (keluar).

# Izinkan koneksi RPC (port 111) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 111 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP RPC baru dan yang sudah terhubung ke port 111 (masuk).
sudo iptables -A OUTPUT -p tcp --dport 111 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP RPC baru dan yang sudah terhubung dari port 111 (keluar).

# Izinkan koneksi UDP pada port 111 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 111 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung ke port 111 (masuk).
sudo iptables -A OUTPUT -p udp --dport 111 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung dari port 111 (keluar).

# Izinkan koneksi CUPS (port 631) (masuk dan keluar)
sudo iptables -A INPUT -p tcp --dport 631 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP CUPS baru dan yang sudah terhubung ke port 631 (masuk).
sudo iptables -A OUTPUT -p tcp --dport 631 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi TCP CUPS baru dan yang sudah terhubung dari port 631 (keluar).

# Izinkan koneksi UDP pada port 631 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 631 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung ke port 631 (masuk).
sudo iptables -A OUTPUT -p udp --dport 631 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung dari port 631 (keluar).

# Izinkan koneksi DHCP (port 68) (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 68 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP DHCP baru dan yang sudah terhubung ke port 68 (masuk).
sudo iptables -A OUTPUT -p udp --dport 68 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP DHCP baru dan yang sudah terhubung dari port 68 (keluar).

# Izinkan koneksi UDP pada port 615 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 615 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung ke port 615 (masuk).
sudo iptables -A OUTPUT -p udp --dport 615 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung dari port 615 (keluar).

# Izinkan koneksi UDP pada port 618 (masuk dan keluar)
sudo iptables -A INPUT -p udp --dport 618 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung ke port 618 (masuk).
sudo iptables -A OUTPUT -p udp --dport 618 -m state --state NEW,ESTABLISHED -j ACCEPT  # Izinkan koneksi UDP baru dan yang sudah terhubung dari port 618 (keluar).

# Izinkan koneksi UDP pada port 32768 dan 33410 (masuk dan keluar)
sudo iptables -A INPUT -p udp --sport 32768 -j ACCEPT  # Izinkan koneksi UDP yang berasal dari port 32768 (masuk).
sudo iptables -A OUTPUT -p udp --dport 33410 -j ACCEPT  # Izinkan koneksi UDP yang ditujukan ke port 33410 (keluar).

# Izinkan koneksi yang sudah ada (ESTABLISHED, RELATED) pada semua port
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT  # Izinkan lalu lintas masuk dari koneksi yang sudah ada atau terkait.
sudo iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT  # Izinkan lalu lintas keluar dari koneksi yang sudah ada atau terkait.

# Simpan aturan iptables agar tetap berlaku setelah reboot (CentOS)
sudo service iptables save  # Simpan semua aturan iptables agar tidak hilang setelah restart sistem.
