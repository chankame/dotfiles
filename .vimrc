" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if filereadable(expand("$HOME/dotfiles/submodule/grml-etc-core/etc/vim/vimrc"))
  source $HOME/dotfiles/submodule/grml-etc-core/etc/vim/vimrc
endif

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
" エンコーディング
set statusline+=[ENC=%{&encoding}]
set statusline+=[FENC=%{&fileencoding}]
" ファイルフォーマット(改行コード)
set statusline+=[FF=%{&fileformat}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2
syntax enable
colorscheme iceberg

" インデント
set autoindent
set smartindent
set cindent
set smarttab

augroup FileTypeIndent
  autocmd!
  filetype plugin on
  filetype indent on
  "sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtab
  autocmd FileType cs setlocal ts=4 sw=4 sts=4
  autocmd FileType css setlocal ts=4 sw=4 sts=4
  autocmd FileType go setlocal ts=4 sw=4 sts=4
  autocmd FileType html setlocal ts=4 sw=4 sts=4
  autocmd FileType javascript setlocal ts=4 sw=4 sts=4
  autocmd FileType php setlocal ts=4 sw=4 sts=4
  autocmd FileType sh setlocal ts=2 sw=2 sts=2 et
augroup END

let g:denops_disable_version_check = 1

if executable('deno')
  packadd denops.vim
  packadd ddu.vim
  packadd ddu-filter-matcher_substring
  packadd ddu-kind-file
  packadd ddu-source-file_rec
  packadd ddu-ui-ff

  call ddu#custom#patch_global(#{
    \   ui: 'ff',
    \   sources: [#{name: 'file_rec', params: {}}],
    \   sourceOptions: #{
    \     _: #{
    \       matchers: ['matcher_substring'],
    \     },
    \   },
    \   kindOptions: #{
    \     file: #{
    \       defaultAction: 'open',
    \     },
    \   }
    \ })
endif

if executable('node')
  packadd coc.nvim
endif
