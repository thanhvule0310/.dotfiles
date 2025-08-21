#!/bin/bash

shopt -s extglob dotglob
case "$1" in
--backup)
  echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Backup"
  rm -rf !(.git|.github|helpers|Makefile|.gitignore|dotfiles.sh|.|..)

  cp -r ~/.gtkrc-2.0 .
  cp -r ~/.config/gtk-3.0 .
  cp -r ~/.config/gtk-4.0 .
  cp -r ~/.config/alacritty .
  cp -r ~/.config/ghostty .
  cp -r ~/.config/nvim .
  cp -r ~/.config/bat .
  cp -r ~/.config/htop .
  cp ~/.config/starship.toml .
  cp ~/.gitconfig .
  cp ~/.zshrc .
  cp ~/.prettierrc.yaml .
  cp ~/.tmux.conf .

  # Hyprland
  cp -r ~/.config/hypr .
  cp -r ~/.config/waybar .
  cp -r ~/.config/swaync .
  cp -r ~/.config/wofi .

  echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"
  ;;
--restore)
  echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Set environment variables"
  sudo tee -a /etc/environment <<END
FREETYPE_PROPERTIES="cff:no-stem-darkening=0"
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
END
  echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"

  echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Restore config files"

  cp -r ./.gtkrc-2.0 ~/
  cp -r ./gtk-3.0 ~/.config
  cp -r ./gtk-4.0 ~/.config
  cp -r ~/.config/gtk-4.0 .
  cp -r ./alacritty ~/.config
  cp -r ./ghostty ~/.config
  cp -r ./bat ~/.config
  cp -r ./nvim ~/.config
  cp -r ./htop ~/.config
  cp -r ./lazygit ~/.config
  cp ./.gitconfig ~/
  cp ./.tmux.conf ~/
  cp ./.prettierrc.yaml ~/
  cp ./starship.toml ~/.config

  # Hyprland
  cp -r ./hypr ~/.config/hypr
  cp -r ./waybar ~/.config/waybar
  cp -r ./swaync ~/.config/swaync
  cp -r ./wofi ~/.config/wofi

  sudo mv ./helpers/fonts/* /usr/share/fonts/

  echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"

  echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Enhance Audio"
  sudo cp ./helpers/files/increase_rtc /usr/bin/
  sudo cp ./helpers/files/increase_rtc.service /etc/systemd/system/
  sudo systemctl enable --now increase_rtc.service

  sudo tee /etc/sysctl.d/90-swappiness.conf <<END
vm.swappiness = 10
END

  sudo tee /etc/sysctl.d/90-max_user_watches.conf <<END
fs.inotify.max_user_watches = 600000
END

  sudo setpci -v -d *:* latency_timer=b0
  echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"
  ;;

*)
  echo "ERROR: Invalid option!"
  ;;
esac
