set tabstop=2 shiftwidth=2 softtabstop=2

set showtabline=2
set tabstop =2
set autoindent 
set nu


highlight SpecialKey guibg=#222222 cterm=underline ctermfg=darkgrey

augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#000000
autocmd InsertLeave * highlight StatusLine guifg=#000000 guibg=#ccdc90
augroup END

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

set statusline+=Name:%F\ %=Enc:%{&fileencoding}\ Line:[%l/%L]

