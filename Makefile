#pwd to dotfiles
D=.
# if pwd not is dotfiles; check cd ~/dotfiles
WORKDIR=~/workprojects

deploy_common:
	cp ./configs/.bashrc ~/
	source ./bashconf.sh

deploywork: deploy_common
	touch ~/.work.sig
	cat ./work/backup/crontab | crontab -
	mkdir $(WORKDIR) || true
	mkdir ~/backups || true

# install arch/mint/cent packages
# make list of packages: common to home/work and system, spec for home-work/systems
_install_centos:
	yum install `cat ./system_setup/centos_packs | tr '\n' ' '` -y

_work_portal:
	ssh-keyscan bitbucket.mosreg.ru >> ~/.ssh/known_hosts
	ssh-keyscan github.com >> ~/.ssh/known_hosts
	git clone ssh://git@bitbucket.mosreg.ru:7999/sup/self-support.git $(WORKDIR)/support
	git clone ssh://git@bitbucket.mosreg.ru:7999/sup/qasite.git $(WORKDIR)/qa
	git clone ssh://git@bitbucket.mosreg.ru:7999/sup/mosreg-survey.git $(WORKDIR)/feedback

deployhome: deploy_common
	touch ~/.home.sig

