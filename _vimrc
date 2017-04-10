set tabstop=4 shiftwidth=4 softtabstop=4

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.js,*.jsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

set showtabline=2
set expandtab
set autoindent
set smartindent
set nu
set cursorline
set backspace=indent,eol,start

let $DOTVIM = $HOME . '/.vim'

" show full-size space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" neobandle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" initialize
call neobundle#begin(expand('~/.vim/bundle/'))

" plugins to be installed
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'alvan/vim-closetag'
NeoBundle 'mattn/emmet-vim'
"NeoBundle 'scrooloose/syntastic'

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

" NERDTree
:command Tr NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-n> gt
let NERDTreeShowHidden=1

"NeoComplete
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#sources#dictionary#dictionaries = {
"  \ 'default': '',
"  \ 'php' : $DOTVIM.'/dict/php.dict'
"  \ }

"neocomplcache
" -------------------------------------
let g:neocomplcache_enable_at_startup = 1
" distinguish UPPER from lower
let g:neocomplcache_smartcase = 1
" enable camelCase
let g:neocomplcache_enablecamelcasecompletion = 1
" enable under bar completion
let g:neocomplcache_enableunderbarcompletion = 1
" min length of completion target
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_plugincompletionlength = {
            \ 'keyword_complete' : 2,
            \ 'syntax_complete' : 2
            \ }
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ }

" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
" 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#close_popup()

"neosnippet key-map
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#snippets_directory= $DOTVIM.'/snippets/'


" quick run
" -------------------------------------
" initialize
let g:quickrun_config = {}
let g:quickrun_config['_'] = {}
let g:quickrun_config['_']['runner'] = 'vimproc'
let g:quickrun_config['_']['runner/vimproc/updatetime'] = 60
let g:quickrun_config['_']['split'] = ''
"let g:quickrun_config['_']['outputter'] = 'error'
"let g:quickrun_config['_']['outputter/error/success'] = 'buffer'
"let g:quickrun_config['_']['outputter/error/error'] = 'quickfix'
"let g:quickrun_config['_']['outputter/buffer/split'] = ':rightbelow'
"let g:quickrun_config['_']['outputter/buffer/close_on_empty'] = 1
"let g:quickrun_config['_']['hook/close_buffer/enable_empty_data'] = 1

" mocha
augroup QuickRunMocha
  autocmd!
" javascript
   autocmd BufWinEnter,BufNewFile *.spec.js,*.spec.jsx,*.spec.es6 silent! set filetype=javascript.unit
   let g:quickrun_config['javascript.unit'] = {}
   let g:quickrun_config['javascript.unit']['command'] ='./node_modules/.bin/mocha'
   let g:quickrun_config['javascript.unit']['cmdopt'] = ''
   let g:quickrun_config['javascript.unit']['exec'] = '%c %o %s'
augroup END

" vim-jsx
let g:jsx_ext_required = 0

" share clipboard
set clipboard+=unnamed

" open NERDTree automaticaly when any file is not selected
if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif

" syntastic
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

" highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Unite
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/unite<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>

" vim-closetag
let g:closetag_filenames = "*.html,*.jsx,*.tpl,*.xml"

try
  source ~/.vimrc_external
catch
endtry
