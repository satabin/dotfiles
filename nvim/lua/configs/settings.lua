vim.cmd([[set termguicolors]])
vim.cmd([[let g:nord_italic = 1]])
vim.cmd([[let g:nord_uniform_diff_background = 1]])
vim.cmd([[set laststatus=2]])
vim.cmd([[set noshowmode]])
vim.cmd([[filetype plugin on]])
vim.cmd([[syn on]])
vim.cmd([[colorscheme nord]])
vim.cmd([[set sw=2]])
vim.cmd([[set ts=2]])
vim.cmd([[set expandtab]])
vim.cmd([[set nu rnu]])
vim.cmd([[set ai]])
vim.cmd([[set si]])
vim.cmd([[set cursorline]])
vim.cmd([[set mouse=a]])
vim.cmd([[set wildmode=list:longest]])
vim.cmd([[set wrap]])
vim.cmd([[set linebreak]])
vim.cmd([[set nolist]])
vim.cmd([[set nofoldenable]])
vim.cmd([[let g:vimtex_fold_enabled=0]])
vim.cmd([[let g:vimtex_latexmk_build_dir='build']])
vim.cmd([[let g:vimtex_quickfix_mode=2]])

-- <F7> for word case toggle & <F8> for word capitalization
-- Normal mode mappings:
vim.cmd([[nmap <F7> mzg~iw`z]])
vim.cmd([[nmap <F8> mzgUiw`z]])
-- Insert mode mappings:
vim.cmd([[imap <F7> _<Esc>mza<C-Right><Esc>bg~iw`zi<Del>]])
vim.cmd([[imap <F8> _<Esc>mza<C-Right><Esc>bgUiw`zi<Del>]])

-- make search case sensitive only if search apttern contains an upper case
-- letter
vim.cmd([[set ignorecase]])
vim.cmd([[set smartcase]])

-- allow hidden buffer
vim.cmd([[set hidden]])

vim.cmd([[set shortmess=atI]])

-- reload files changed outside vim
vim.cmd([[set autoread]])

vim.cmd([[let g:airline_powerline_fonts = 1]])
vim.cmd([[let g:airline_theme='nord']])
vim.cmd([[let g:airline#extensions#tabline#enabled = 1]])

vim.cmd([[set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*/target/*,*/out/*,*/node_modules/*,*.aux,*.fls,*.log,*.out,*.toc,*/output/*]])

vim.cmd([[set nohlsearch]])
vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

-- use scala indentation for doc comments
vim.cmd([[let g:scala_scaladoc_indent = 1]])

vim.cmd([[command Explore :e %:p:h]])
-- disable netrw
vim.cmd([[let g:loaded_netrw = 1]])
vim.cmd([[let g:loaded_netrwPlugin = 1]])
-- replace netrw by vifm
vim.cmd([[let g:vifm_replace_netrw = 1]])
vim.cmd([[let g:vifm_replace_netrw_cmd = "Vifm"]])

vim.cmd([[
augroup packer_user_config
 autocmd!
 autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

-- Configuration for vim-scala
vim.cmd([[au BufRead,BufNewFile *.sbt set filetype=scala]])
vim.cmd([[let g:echodoc#enable_at_startup = 1]])
vim.cmd([[let g:echodoc#type = 'floating']])
