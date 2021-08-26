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
syntax enable
colorscheme iceberg
