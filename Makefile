install: create-symlinks

CURRENT_PATH=$(shell pwd)

create-symlinks:
	cd ~/ && rm -f .vimrc && ln -s $(CURRENT_PATH)/_vimrc .vimrc;
	cd ~/ && rm -f .zshrc && ln -s $(CURRENT_PATH)/_zshrc .zshrc;
	cd ~/ && rm -f .tmux.conf && ln -s $(CURRENT_PATH)/_tmux.conf .tmux.conf;
