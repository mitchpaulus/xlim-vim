" Vim syntax file
" Language:	   xlim
" Maintainer:  Mitchell T. Paulus
" Last Change: 2022-09-06
" Remark:      xlim prgoramming language.

" See 44.12 Portable syntax file layout
if exists("b:current_syntax")
    echom "Exited early"
    echom b:current_syntax
    finish
endif

" keywords
syntax keyword XlimFunction sum max min

syntax region XlimUnit start="{" end="}"

highlight default link XlimUnit Type
highlight default link XlimFunction Function

let b:current_syntax = "xlim"
