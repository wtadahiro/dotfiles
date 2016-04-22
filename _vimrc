set tabstop=4 shiftwidth=4 softtabstop=4

set showtabline=4
set expandtab
set autoindent 
set nu
set cursorline

" show full-size space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/


" neobandle
if has('vim_starting')
  "set runtimepath
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" initialize
call neobundle#begin(expand('~/.vim/bundle/'))

" plugins to be installed
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()
filetype plugin indent on


" color schem
colorscheme jellybeans
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

" set alias
:command Tr NERDTree
