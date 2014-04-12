" pathogen loads all installed plugins
call pathogen#infect()

syn on
colorscheme elflord
set sw=2
set ts=2
set expandtab
set nu
set ai
set si
filetype plugin indent on
set cursorline
set cursorcolumn
" enable use of the mouse
set mouse=a
" list completion alternatives
set wildmode=list:longest

" word wrapping
set wrap
set linebreak
set nolist

" TeX flavor
"let g:tex_flavor='latex'

" no automatic check for scala in syntastic
let g:syntastic_mode_map = {}
let g:syntastic_mode_map['passive_filetypes'] = ['scala']

set nofoldenable
let g:LatexBox_Folding=0
let g:LatexBox_viewer = 'zathura'

" allow toggling between local and default mode
function TabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
  else
    set sw=2
    set ts=2
    set sts=2
    set expandtab
  endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z

"<F7> for word case toggle & <F8> for word capitalization
"Normal mode mappings:
nmap <F7> mzg~iw`z
nmap <F8> mzgUiw`z

"Insert mode mappings:
imap <F7> _<Esc>mza<C-Right><Esc>bg~iw`zi<Del>
imap <F8> _<Esc>mza<C-Right><Esc>bgUiw`zi<Del>

" search and replace word under the cursor
:nnoremap <Leader>sr :%s/\<<C-r><C-w>\>/

