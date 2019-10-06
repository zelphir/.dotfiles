SHELL = /bin/bash
nvim ?= nvim
XDG_CACHE_HOME ?= $(HOME)/.cache
DOTFILES = $(HOME)/.dotfiles
DOTBOT = $(DOTFILES)/dotbot/bin/dotbot -d $(DOTFILES)

default: install

link:
	@$(DOTBOT) -c configs/link.conf.yaml

install: link
	@git submodule update --init --recursive dotbot
	@$(DOTBOT) -c configs/setup.conf.yaml

update: link
	@$(DOTBOT) -c configs/update.conf.yaml

uninstall:
	rm -rf $(DOTFILES)
