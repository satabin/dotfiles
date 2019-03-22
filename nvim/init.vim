set nocompatible

filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'derekwyatt/vim-scala'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'satabin/hocon-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'arcticicestudio/nord-vim'
Plugin 'vifm/neovim-vifm'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tpope/vim-surround'

call vundle#end()

"set t_Co=256
set termguicolors
let g:nord_italic = 1
let g:nord_uniform_diff_background = 1
"let g:limelight_conceal_ctermfg = 'gray'
"let g:limelight_conceal_ctermfg = 240
"let g:limelight_conceal_guifg = 'DarkGray'
"let g:limelight_conceal_guifg = '#777777'
set laststatus=2

syn on
colorscheme nord
set sw=2
set ts=2
set expandtab
set nu rnu
set ai
set si
filetype plugin indent on
set cursorline
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

set nofoldenable
let g:LatexBox_Folding=0
let g:LatexBox_build_dir = "build"
let g:LatexBox_quickfix=2

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

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"<F7> for word case toggle & <F8> for word capitalization
"Normal mode mappings:
nmap <F7> mzg~iw`z
nmap <F8> mzgUiw`z

"Insert mode mappings:
imap <F7> _<Esc>mza<C-Right><Esc>bg~iw`zi<Del>
imap <F8> _<Esc>mza<C-Right><Esc>bgUiw`zi<Del>

" search and replace word under the cursor
:nnoremap <Leader>sr :%s/\<<C-r><C-w>\>/

let g:airline_powerline_fonts = 0
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*/target/*,*/out/*,*/node_modules/*,*.aux,*.fls,*.log,*.out,*.toc,*/output/*

set nohlsearch
tnoremap <Esc> <C-\><C-n>

" use scala indentation for doc comments
let g:scala_scaladoc_indent = 1

command Explore :e %:p:h
