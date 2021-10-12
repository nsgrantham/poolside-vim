" Vim Autoload File
" Maintained: https://github.com/nsgrantham/poolside-vim/blob/main/autoload/poolside.vim
" Based On:   https://github.com/dracula/vim/blob/master/autoload/dracula.vim
" License:    MIT License

" Palette: {{{

let g:poolside#palette           = {}
let g:poolside#palette.fg        = ['#f2eded', 253]

let g:poolside#palette.bglighter = ['#535285', 238]
let g:poolside#palette.bglight   = ['#474670', 237]
let g:poolside#palette.bg        = ['#353454', 236]
let g:poolside#palette.bgdark    = ['#2B2A44', 235]
let g:poolside#palette.bgdarker  = ['#1c1b2c', 234]

let g:poolside#palette.comment   = ['#7877ab',  61]
let g:poolside#palette.selection = ['#62619d', 239]
let g:poolside#palette.subtle    = ['#58578D', 238]

let g:poolside#palette.cyan      = ['#a3dffa', 117]
let g:poolside#palette.green     = ['#d7f4ab',  84]
let g:poolside#palette.orange    = ['#fad6a7', 215]
let g:poolside#palette.pink      = ['#df9dfa', 212]
let g:poolside#palette.purple    = ['#b1affa', 141]
let g:poolside#palette.red       = ['#f8b3b1', 203]
let g:poolside#palette.yellow    = ['#fad6a7', 228]

"
" ANSI
"
let g:poolside#palette.color_0  = '#7877ab'
let g:poolside#palette.color_1  = '#f5908d'
let g:poolside#palette.color_2  = '#c6ef88'
let g:poolside#palette.color_3  = '#f8c582'
let g:poolside#palette.color_4  = '#8d8af8'
let g:poolside#palette.color_5  = '#d378f8'
let g:poolside#palette.color_6  = '#7ed2f8'
let g:poolside#palette.color_7  = '#f2eded'
let g:poolside#palette.color_8  = '#7877ab'
let g:poolside#palette.color_9  = '#f8b3b1'
let g:poolside#palette.color_10 = '#d7f4ab'
let g:poolside#palette.color_11 = '#fad6a7'
let g:poolside#palette.color_12 = '#b1affa'
let g:poolside#palette.color_13 = '#df9dfa'
let g:poolside#palette.color_14 = '#a3dffa'
let g:poolside#palette.color_15 = '#f2eded'

" }}}

" Helper function that takes a variadic list of filetypes as args and returns
" whether or not the execution of the ftplugin should be aborted.
func! poolside#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'poolside'
        return 1
    elseif a:0 > 0 && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1)
        return 1
    endif
    return 0
endfunction

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0: