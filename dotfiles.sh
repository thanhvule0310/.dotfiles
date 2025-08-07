#!/bin/bash

shopt -s extglob dotglob
case "$1" in
--backup)
  echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Backup"
  rm -rf !(.git|.github|helpers|Makefile|.gitignore|dotfiles.sh|.|..)

  cp -r ~/.config/alacritty .
  cp -r ~/.config/nvim .
  cp -r ~/.config/bat .
  cp -r ~/.config/htop .
  cp ~/.config/starship.toml .
  cp ~/.gitconfig .
  cp ~/.zshrc .
  cp ~/.prettierrc.yaml .
  cp ~/.tmux.conf .

  echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"
  ;;
--restore)
  echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Set environment variables"
  sudo tee -a /etc/environment <<END
GTK_IM_MODULE="ibus"
QT_IM_MODULE="ibus"
XMODIFIERS="@im=ibus"
QT4_IM_MODULE="ibus"
CLUTTER_IM_MODULE="ibus"
GLFW_IM_MODULE="ibus"
FREETYPE_PROPERTIES="cff:no-stem-darkening=0"
END
  echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"

  echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Restore config files"
  cp -r ./alacritty ~/.config
  cp -r ./bat ~/.config
  cp -r ./nvim ~/.config
  cp -r ./htop ~/.config
  cp -r ./lazygit ~/.config
  cp ./.gitconfig ~/
  cp ./.tmux.conf ~/
  cp ./.prettierrc.yaml ~/
  cp ./starship.toml ~/.config
  echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"

  echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Remap Gnome Keybindings"
  gsettings set org.gnome.shell.app-switcher current-workspace-only true
  for i in {1..9}; do
    echo "$i"
    gsettings set org.gnome.shell.keybindings "switch-to-application-$i" "['']"
    gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-$i" "['<Super>$i']"
    gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-$i" "['<Super><Shift>$i']"
  done
  echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"

  echo -e "\\033[0;34m\\033[1m ▽\\033[0m\\033[1m Enhance Perfomance"
  sudo pacman -Syyu
  sudo pacman -S tuned
  sudo systemctl enable --now tuned.service
  sudo tuned-adm profile latency-performance
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

  sudo grub-mkconfig -o /boot/grub/grub.cfg
  echo -e "\\033[0;32m\\033[1m ✓\\033[0m\\033[1m Done"
  ;;

*)
  echo "ERROR: Invalid option!"
  ;;
esac
