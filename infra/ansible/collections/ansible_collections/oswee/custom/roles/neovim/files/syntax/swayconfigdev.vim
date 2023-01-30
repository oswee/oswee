if exists("b:current_syntax")
  finish
en

" :help syntax

scriptencoding utf-8

" Error
" syn match swayconfigError /.*/

" Todo
syn keyword swayconfigTodo TODO FIXME XXX contained

" Comment
" Comments are started with a # and can only be used at the beginning of a line
syn match swayconfigComment /^\s*#.*$/ contains=swayconfigTodo

syn keyword swayconfigSetKeyword set
syn keyword swayconfigOutputKeyword output
syn keyword swayconfigIncludeKeyword include
syn keyword swayconfigInputKeyword input
syn keyword swayconfigKeywordExecAlways exec_always
syn match swayconfigString /\(['"]\)\(.\{-}\)\1/
" syn match swayconfigSet /^\s*set\s\+.*$/ contains=swayConfigVariable,swayConfigSetKeyword,swayConfigColor,swayConfigString
" syn match swayconfigInclude include contains=swayconfigIncludeKeyword
syn region swayconfigBlock start="{" end="}" fold transparent contains=swayconfigSetKeyword,swayconfigString,swayconfigComment

let b:current_syntax = "swayconfig"
hi! def link swayconfigError                           Error
hi! def link swayconfigTodo                            Todo
hi! def link swayconfigComment                         Comment
hi! def link swayconfigSetKeyword                      Function
hi! def link swayconfigOutputKeyword                   Keyword
hi! def link swayconfigIncludeKeyword                  Include
hi! def link swayconfigString                          String
hi! def link swayconfigBlock                           Structure
hi! def link swayconfigKeywordExecAlways               Keyword
hi! def link swayconfigInputKeyword                    Keyword
