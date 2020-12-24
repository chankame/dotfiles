#!/bin/sh

cd `dirname $0`
DOTFILES_DIR=`pwd`

for f in .??*
do
	[ "$f" = '.git' ] && continue
	[ "$f" = '.DS_Store' ] && continue
	[ "$f##*." = 'swp' ] && continue

	ln -fsv $DOTFILES_DIR/$f ~
done
