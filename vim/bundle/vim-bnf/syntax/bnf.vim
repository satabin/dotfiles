" Vim syntax file
" Language: BNF
" Maintainer: Lucas Satabin
" Latest Revision: 14 November 2012

if version < 600
 syntax clear
elseif exists("b:current_syntax") && b:current_syntax == "bnf"
 finish
endif

syn match bnfRule /[a-zA-Z_][a-zA-Z0-9_]*/ nextgroup=bnfProd skipwhite skipempty

syn match bnfProd /::=/ nextgroup=bnfDef skipwhite skipempty

syn match bnfIdent contained /[a-zA-Z_][a-zA-Z0-9_]*/

syn match bnfPunctuation contained /?\|+\|*/

syn region bnfTerminal contained start=+"+ end=+"+ skip=+\\"+

syn cluster bnfDef contains=bnfIdent,bnfPunctuation,bnfGroup,bnfTerminal

syn region bnfComment containedin=ALL start=/(\*/ end=/\*)/ contains=bnfComment extend keepend

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_coq_syntax_inits")
 if version < 508
  let did_coq_syntax_inits = 1
  command -nargs=+ HiLink hi link <args>
 else
  command -nargs=+ HiLink hi def link <args>
 endif

 HiLink bnfRule Identifier
 HiLink bnfProd Special
 HiLink bnfIdent Identifier
 HiLink bnfPunctuation Special
 HiLink bnfTerminal String
 HiLink bnfComment Comment

 delcommand HiLink
endif

let b:current_syntax = "bnf"
