echo "Add Chaotic AUR"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf >/dev/null
sudo pacman -Syyu

sudo pacman -S mesa xf86-video-intel vulkan-intel
sudo pacman -S git curl wget tmux zsh ripgrep vim htop fastfetch fd bat xdg-user-dirs base-devel cmake unzip ninja 7zip bluetui rustup jq devtools gcc

sudo pacman -S hyprland hyprpaper swaync wofi sxiv dolphin

rustup default stable

xdg-user-dirs-update
