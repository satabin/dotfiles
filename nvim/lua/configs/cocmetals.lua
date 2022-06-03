vim.cmd([[
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

command Doc :call s:show_documentation()

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
command Quickfix :CocAction('coc-fix-current')<CR>

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>
command Action :call CocActionAsync('codeLensAction')

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
]])
