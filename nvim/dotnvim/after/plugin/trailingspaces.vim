" highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/ containedin=ALL
