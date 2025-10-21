# dotfiles

## インストール方法
バックアップは~/dotfiles/backup/ディレクトリ下に保存されます。
```
cd ~ && curl https://raw.githubusercontent.com/chankame/dotfiles/master/install.sh | sh
```

## アップデート方法
```
cd ~/dotfiles && sh deploy.sh
```

## vim

### ddu
```
yay -S deno
```

### coc.nvim
```
yay -S nodejs npm
yay -S clang
yay -S omnisharp-roslyn
cd ~/dotfiles/.vim/pack/plugins/opt/coc.nvim
npm ci
:CocInstall coc-clangd
:CocInstall coc-omnisharp
:CocList extensions
```
