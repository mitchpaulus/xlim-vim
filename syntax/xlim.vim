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
" Can use command
" printf 'syntax keyword XlimFunction %s' (xlim --functions | textjoin ' ')
syntax keyword XlimFunction filter sum max min min2 max2 sumif countif ln log10 exp sin cos asin acos atan sinh cosh tanh asinh acosh atanh floor ceiling abs round sqrt K C F R inv idx size
syntax keyword XlimKeyword if then else to by in val header noheader template is end let fn import st
syntax keyword XlimBoolean true false TRUE FALSE True False
syntax keyword XlimOperator and or
syntax keyword XlimLoopDefer loop defer

" These must be before the longer match with contents.
" This allows for strucutre units to have the intial '{' and '}' highlighted,
" while not highlighting the other parts. Ex:
" func_taking_struct: param { [x: {m}, y: {m}] } = param.x + param.y
syntax match XlimUnit "{"
syntax match XlimUnit "}"
" Match units like { m/s }, everything between { and }, can't include newlines
" or ':' or '[' or ']' characters, non-greedy
syntax match XlimUnit "{[^:[]\{-}}"

" syntax region XlimUnit start="\v(\{| )" end="\v(\}| |$)"
syntax region XlimComment start="--" end="$"
syntax region XlimFile start="`" end="`"

syntax region XlimGenOptPlaceholder start="%" end="%\|$"

syntax region XlimRegex start="\<r/" end="/\|$"

syntax region XlimString start=+"+ skip=+\\"+ end=+"\|$+

" Note that using \zs to start match doesn't seem to work like the lookbehind
syntax match XlimTemplateApply /\(^ *[^ ]\+ \+is \+\)\@<=[^ ]\+/
syntax match XlimTemplateName /\(^\s*template \+\)\@<=[^ ]\+/

syntax match XlimUserFunction /\v[a-zA-Z0-9_]+\ze *:/

highlight default link XlimComment Comment
highlight default link XlimKeyword Keyword
highlight default link XlimLoopDefer Special
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
highlight default link XlimGenOptPlaceholder Identifier
highlight default link XlimString String

let b:current_syntax = "xlim"
