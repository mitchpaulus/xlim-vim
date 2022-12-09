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
syntax keyword XlimFunction filter sum min max sumif countif ln log10 exp sin cos asin acos atan sinh cosh tanh asinh acosh atanh
syntax keyword XlimKeyword if then else to by in val header noheader template is end
syntax keyword XlimBoolean true false TRUE FALSE True False
syntax keyword XlimOperator and or
syntax region XlimUnit start="{" end="}"
syntax region XlimComment start="--" end="$" contains=XlimComment
syntax region XlimFile start="`" end="`"

syntax region XlimRegex start="r/" end="/"

" Note that using \zs to start match doesn't seem to work like the lookbehind
syntax match XlimTemplateApply /\(^ *[^ ]\+ \+is \+\)\@<=[^ ]\+/
syntax match XlimTemplateName /\(template *\)\@<=[^ ]\+/

syntax match XlimUserFunction /\v[a-zA-Z0-9_]+\ze *:/

highlight default link XlimComment Comment
highlight default link XlimKeyword Keyword
highlight default link XlimBoolean Constant
highlight default link XlimOperator Operator
highlight default link XlimFunction Function
highlight default link XlimUserFunction Function
highlight default link XlimTemplateApply Function
highlight default link XlimTemplateName Function
highlight default link XlimBoolean Boolean
highlight default link XlimUnit Type
highlight default link XlimFile String
highlight default link XlimRegex String

let b:current_syntax = "xlim"
