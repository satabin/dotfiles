set nocompatible

filetype off

call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'derekwyatt/vim-scala'
Plug 'terryma/vim-multiple-cursors'
Plug 'lervag/vimtex'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'satabin/hocon-vim'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'arcticicestudio/nord-vim'
Plug 'vifm/neovim-vifm'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Shougo/echodoc.vim'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"set t_Co=256
set termguicolors
let g:nord_italic = 1
let g:nord_uniform_diff_background = 1
"let g:limelight_conceal_ctermfg = 'gray'
"let g:limelight_conceal_ctermfg = 240
"let g:limelight_conceal_guifg = 'DarkGray'
"let g:limelight_conceal_guifg = '#777777'
set laststatus=2
set noshowmode

filetype plugin on
syn on
colorscheme nord
set sw=2
set ts=2
set expandtab
set nu rnu
set ai
set si
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
let g:vimtex_fold_enabled=0
let g:vimtex_latexmk_build_dir='build'
let g:vimtex_quickfix_mode=2

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

" make search case sensitive only if search apttern contains an upper case
" letter
set ignorecase
set smartcase

" allow hidden buffer
set hidden

set shortmess=atI

" reload files changed outside vim
set autoread

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

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType json syntax match Comment +\/\/.\+$+

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> sgd :sp<CR><Plug>(coc-definition)
nmap <silent> vgd :vsp<CR><Plug>(coc-definition)
nmap <silent> tgd :vsp<CR><Plug>(coc-definition)<C-W>T
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs  :<C-u>CocCommand metals.go-to-super-method<cr>
nmap <silent> vgs  :vsp<CR>:<C-u>CocCommand metals.go-to-super-method<cr>
nmap <silent> sgs  :sp<CR>:<C-u>CocCommand metals.go-to-super-method<cr>
nmap <silent> sgr :sp<CR><Plug>(coc-references)
nmap <silent> vgr :vsp<CR><Plug>(coc-references)
nmap <silent> tgr :vsp<CR><Plug>(coc-references)<C-W>T
inoremap <silent><expr> <c-n> coc#refresh()

command Reformat :call CocAction('format')

command Doc :call <SID>show_documentation()

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>

nmap <leader>rn <Plug>(coc-rename)

set completeopt-=preview
set shortmess+=c
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu

let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 1
