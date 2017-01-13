install: deploy

CURRENT_PATH=$(shell pwd)

help:
	@echo "make install #=> Create symlinks to home directory"
	@echo "make update  #=> Fetch changes for this repo"
	@echo "make deploy  #=> Create symlinks to home directory"

deploy:
	cd ~/ && rm -f .vimrc && ln -s $(CURRENT_PATH)/_vimrc .vimrc;
	cd ~/ && rm -f .zshrc && ln -s $(CURRENT_PATH)/_zshrc .zshrc;
	cd ~/ && rm -f .tmux.conf && ln -s $(CURRENT_PATH)/_tmux.conf .tmux.conf;
	cd ~/ && rm -f .gitconfig && ln -s $(CURRENT_PATH)/_gitconfig .gitconfig;
	cd ~/ && rm -rf .vim/colors && ln -s $(CURRENT_PATH)/vim/colors .vim/colors;
	cd ~/ && rm -rf .vim/dict && ln -s $(CURRENT_PATH)/vim/dict .vim/dict;
	cd ~/ && rm -rf .vim/bundle && ln -s $(CURRENT_PATH)/vim/bundle .vim/bundle;
	cd ~/ && rm -rf .vim/snippets && ln -s $(CURRENT_PATH)/vim/snippets .vim/snippets;

update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

init: update deploy
