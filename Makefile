.DEFAULT_GOAL := sync

backup:
	@./dotfiles.sh --backup

restore:
	@./dotfiles.sh --restore

npm:
	npm i -g npm neovim

ssh:
	ssh-keygen -t ed25519 -C "thanhvule0310@gmail.com"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed25519
	wl-copy <~/.ssh/id_ed25519.pub

zsh/omz:
	./helpers/omz.sh

zsh/plugins:
	./helpers/zsh_plugins.sh
