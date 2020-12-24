#!/bin/sh

DOTFILES_DIR=`dirname $0`
cd $DOTFILES_DIR

for f in $DOTFILE_DIR.??*
do
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue
	[[ "$f" =~ \.swp$ ]] && continue

	ln -fsv $DOTFILES_DIR/$f ~
done
