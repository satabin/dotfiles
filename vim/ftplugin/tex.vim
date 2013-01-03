set iskeyword+=:
" default target is pdf
let g:Tex_DefaultTargetFormat = 'pdf'
" open with zathura
let g:Tex_ViewRuleComplete_ps = "zathura -s -x 'vim --servername SYNCTEX --remote +%{line} %{input}' $*.ps &> /dev/null &"
let g:Tex_ViewRuleComplete_pdf = "zathura -s -x 'vim --servername SYNCTEX --remote +%{line} %{input}' $*.pdf &> /dev/null &"
let g:Tex_ViewRuleComplete_dvi = "zathura -s -x 'vim --servername SYNCTEX --remote +%{line} %{input}' $*.dvi &> /dev/null &"
" enable SyncTeX
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=1 -interaction=nonstopmode $*'
" don't fold anything
let g:Tex_FoldedSections=""
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""
