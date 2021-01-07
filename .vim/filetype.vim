augroup filetypedetect
	au BufRead,BufNewFile *.cpp setfiletype cpp
	au BufRead,BufNewFile *.h setfiletype cpp
	au BufRead,BufNewFile *.yaml setfiletype ansible
	au BufRead,BufNewFile *.yml setfiletype ansible
augroup END
