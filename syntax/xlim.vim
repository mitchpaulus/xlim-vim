" Vim syntax file
" Language:	   xlim
" Maintainer:  Mitchell T. Paulus
" Last Change: 2022-11-23
" Remark:      xlim prgoramming language.

" See 44.12 Portable syntax file layout
if exists("b:current_syntax")
    echom "Exited early"
    echom b:current_syntax
    finish
endif

" keywords
syntax keyword XlimFunction sum max min filter sumif countif exp
syntax keyword XlimKeyword if then else to by in val header noheader
syntax keyword XlimBoolean true false TRUE FALSE True False
syntax keyword XlimOperator and or
syntax region XlimUnit start="{" end="}"
syntax region XlimComment start="--" end="$" contains=XlimComment
syntax region XlimFile start="`" end="`"

highlight default link XlimComment Comment
highlight default link XlimKeyword Keyword
highlight default link XlimBoolean Constant
highlight default link XlimOperator Operator
highlight default link XlimFunction Function
highlight default link XlimBoolean Boolean
highlight default link XlimUnit Type
highlight default link XlimFile String

let b:current_syntax = "xlim"
