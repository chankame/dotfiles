#!/bin/sh

cd `dirname $0`
DOTFILES_DIR=`pwd`

git submodule update --init

for f in .??*
do
	[ "$f" = '.git' ] && continue
	[ "$f" = '.DS_Store' ] && continue
	swp=${f##*.}
	[ "$swp" = 'swp' ] && continue

	ln -fsv $DOTFILES_DIR/$f ~
done
