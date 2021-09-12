"" Author: George Kastrinis <george.kast@gmail.com>
"" Vim Highlighting: http://vimdoc.sourceforge.net/htmldoc/syntax.html
"" Vim Include: http://vimdoc.sourceforge.net/htmldoc/syntax.html#:syn-include

set expandtab
set tabstop=2
set shiftwidth=2

syn match ppLineStart "#"
syn match ppKeyword /include\|if defined\|elif defined\|define\|defined\|ifdef\|ifndef\|if\|elif\|else\|endif/
syn region ppDirective start=/^#/ end=/$/ skip=/\\\n/ contains=ALL
syn region ppMacro start=/\a[[:alnum:]:_]*Macro\(@\a\+\)\?(/ end=/)/ keepend extend contains=lbEnclParen,lbStage,lbStageErr
syn region ppOpt start=/\a[[:alnum:]:_]*Opt\(@\a\+\)\?(/ end=/)/ keepend extend contains=lbEnclParen,lbStage,lbStageErr
syn region ppOpt start=/Opt\a[[:alnum:]:_]*\(@\a\+\)\?(/ end=/)/ keepend extend contains=lbEnclParen,lbStage,lbStageErr
syn region ppCons start=/cons[:]\a[[:alnum:]:_]*\(@\a\+\)\?\[/ end=/]/ keepend extend contains=lbEnclBrack,lbStage,lbStageErr
syn match javadoc /@author/ contained
syn match deepDoopId /\.global/
syn match deepDoopKey /component\|command\|as\|copyto/
syn match deepDoopAllKey /\*/


hi link ppLineStart Todo
hi link ppKeyword Todo
hi link ppDirective Special
hi link javadoc SpecialComment
hi link ppMacro Todo
hi link ppOpt Special
hi link ppCons Special
hi link deepDoopId Identifier
hi link deepDoopKey Keyword
hi link deepDoopAllKey Identifier


"" Set the current syntax name
let b:current_syntax = "doop" 
