#!/bin/sh

cd `dirname $0`
DOTFILES_DIR=`pwd`
BACKUP_DIR=$DOTFILES_DIR/backup/$(date +%Y%m%d%H%M%S)
mkdir -p "$BACKUP_DIR"

git submodule update --init

for f in .??*
do
	[ "$f" = '.git' ] && continue
	[ "$f" = '.DS_Store' ] && continue
	swp=${f##*.}
	[ "$swp" = 'swp' ] && continue

	if [ -e ~/$f ]; then
		mv ~/$f "$BACKUP_DIR/$f"
	fi

	ln -fsv $DOTFILES_DIR/$f ~
done
