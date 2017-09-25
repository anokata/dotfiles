#pwd to dotfiles
D=.
# if pwd not is dotfiles; check cd ~/dotfiles

deploy_common:
	cp ./.bashrc ~/

deploywork: deploy_common
	touch ~/.work.sig
	cat ./work/backup/crontab | crontab -
	mkdir ~/workprojects || true
	mkdir ~/backups || true

# install arch/mint/cent packages
# make list of packages: common to home/work and system, spec for home-work/systems

deployhome: deploy_common
	touch ~/.home.sig

