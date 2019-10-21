SHELL = /bin/bash
DOTFILES = $(HOME)/.dotfiles
DOTBOT := $(shell command -v dotbot 2> /dev/null)

default: install

install-dotbot:
ifndef DOTBOT
	@pip install dotbot
endif

link:
	@dotbot -d $(CURDIR) -c configs/link.conf.yaml

install: install-dotbot link
	@git submodule update --init --recursive dotbot
	@dotbot -d $(CURDIR) --plugin-dir dotbot-brewfile -c configs/install.conf.yaml

update: link
	@dotbot -d $(CURDIR) --plugin-dir dotbot-brewfile -c configs/update.conf.yaml

uninstall:
	@pip uninstall dotbot
	rm -rf $(DOTFILES)
