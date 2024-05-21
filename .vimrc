" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

augroup BinaryXXD
  autocmd!
  autocmd BufReadPre *.bin let &binary=1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r
  autocmd BufWritePre * endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END
filetype plugin indent on
hi Comment ctermfg=46
hi NonText ctermfg=196
hi SpecialKey ctermfg=8
set background=dark
set clipboard+=unnamed
set encoding=utf-8
set fileencodings=utf-8,eucjp,cp932
set fileformats=unix,dos,mac
set hlsearch
set incsearch
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set mouse=a
set nocompatible
set noexpandtab
set nowrap
set number
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" ファイルエンコーディング(設定されていない場合はエンコーディング)
set statusline+=[ENC=%{&fileencoding?&fileencoding:&encoding}]
" ファイルフォーマット(改行コード)
set statusline+=[FF=%{&fileformat}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2
syntax enable
colorscheme iceberg
