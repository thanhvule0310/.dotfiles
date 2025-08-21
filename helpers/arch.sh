echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Enable Chaotic AUR"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf >/dev/null
sudo pacman -Syyu
echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"

echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Install necessary packages"
sudo pacman -S git curl wget tmux zsh ripgrep vim htop fastfetch fd bat xdg-user-dirs base-devel cmake unzip ninja 7zip bluetui rustup jq devtools gcc cpio meson fnm hyprland hyprpaper swaync waybar wofi sxiv dolphin firefox mesa xf86-video-intel vulkan-intel wl-clipboard tuned
echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"

echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Install bob-nvim"
rustup default stable
cargo install --git https://github.com/MordechaiHadad/bob.git
echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"

xdg-user-dirs-update

sudo systemctl enable --now tuned.service
sudo tuned-adm profile latency-performance
