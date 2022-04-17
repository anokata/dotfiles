install:
	echo 'source ~/dotfiles/linux/.bashrc' >> ~/.bashrc
	echo 'source ~/dotfiles/linux/.env' >> ~/.profile
config:
	cp ~/dotfiles/linux/.@(!(.|))  ~/
	cp ~/dotfiles/linux/* ~/.config # TODO: not dot
	#ln configs: tmux bspcwmrc ...
	# configs/vimsetup
	nvim -c :PlugInstall
	sudo npm install -g prettier-eslint-cli
