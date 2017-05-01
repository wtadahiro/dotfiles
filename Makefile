all: init

CURRENT_PATH=$(shell pwd)

help:
	@echo "make install #=> Create symlinks to home directory"
	@echo "make update  #=> Fetch changes for this repo"
	@echo "make deploy  #=> Create symlinks to home directory"

deploy:
	bash ./scripts/deploy.sh

update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

init: update deploy

# create so file
.PHONY: vim
vim:
	cd vim/bundle/vimproc.vim && make CC=gcc;
