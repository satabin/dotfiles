" pathogen loads all installed plugins
call pathogen#infect()

syn on
colorscheme evening
set sw=2
set ts=2
set expandtab
set nu
set ai
set si
filetype plugin indent on
set cursorline
" enable use of the mouse
set mouse=a

" word wrapping
set wrap
set linebreak
set nolist

" TeX flavor
let g:tex_flavor='latex'

" no automatic check for scala in syntastic
let g:syntastic_mode_map = {}
let g:syntastic_mode_map['passive_filetypes'] = ['scala']
