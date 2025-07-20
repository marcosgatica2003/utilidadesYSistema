autocmd BufNewFile *.c,*.h 0r ~/.vim/templates/template.c
autocmd BufNewFile *.cpp,*.hpp 0r ~/.vim/templates/template.cpp
autocmd BufNewFile *.ino 0r ~/.vim/templates/template.ino
autocmd BufNewFile *.tex 0r ~/.vim/templates/template.tex
autocmd BufNewFile *.h 0r ~/.vim/templates/template.h
autocmd FileType tex setlocal spell spelllang=es
autocmd Syntax tex,c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax tex,c,cpp,vim,xml,html,xhtml,perl normal zR
