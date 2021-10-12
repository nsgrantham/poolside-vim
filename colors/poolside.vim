
" Poolside Theme: {{{
"
" https://github.com/nsgrantham/poolside-vim
"
" Vim Colors File
" Maintained: https://github.com/nsgrantham/poolside-vim/blob/main/colors/poolside.vim
" Based On:   https://github.com/dracula/vim/blob/master/colors/dracula.vim
" License:    MIT License
" @author Neal Grantham
scriptencoding utf8
" }}}

" Configuration: {{{

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'poolside'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Palette: {{{2

let s:fg        = g:poolside#palette.fg

let s:bglighter = g:poolside#palette.bglighter
let s:bglight   = g:poolside#palette.bglight
let s:bg        = g:poolside#palette.bg
let s:bgdark    = g:poolside#palette.bgdark
let s:bgdarker  = g:poolside#palette.bgdarker

let s:comment   = g:poolside#palette.comment
let s:selection = g:poolside#palette.selection
let s:subtle    = g:poolside#palette.subtle

let s:cyan      = g:poolside#palette.cyan
let s:green     = g:poolside#palette.green
let s:orange    = g:poolside#palette.orange
let s:pink      = g:poolside#palette.pink
let s:purple    = g:poolside#palette.purple
let s:red       = g:poolside#palette.red
let s:yellow    = g:poolside#palette.yellow

let s:none      = ['NONE', 'NONE']

if has('nvim')
  for s:i in range(16)
    let g:terminal_color_{s:i} = g:poolside#palette['color_' . s:i]
  endfor
endif

if has('terminal')
  let g:terminal_ansi_colors = []
  for s:i in range(16)
    call add(g:terminal_ansi_colors, g:poolside#palette['color_' . s:i])
  endfor
endif

" }}}2
" User Configuration: {{{2

if !exists('g:poolside_bold')
  let g:poolside_bold = 1
endif

if !exists('g:poolside_italic')
  let g:poolside_italic = 1
endif

if !exists('g:poolside_underline')
  let g:poolside_underline = 1
endif

if !exists('g:poolside_undercurl')
  let g:poolside_undercurl = g:poolside_underline
endif

if !exists('g:poolside_inverse')
  let g:poolside_inverse = 1
endif

if !exists('g:poolside_colorterm')
  let g:poolside_colorterm = 1
endif

"}}}2
" Script Helpers: {{{2

let s:attrs = {
      \ 'bold': g:poolside_bold == 1 ? 'bold' : 0,
      \ 'italic': g:poolside_italic == 1 ? 'italic' : 0,
      \ 'underline': g:poolside_underline == 1 ? 'underline' : 0,
      \ 'undercurl': g:poolside_undercurl == 1 ? 'undercurl' : 0,
      \ 'inverse': g:poolside_inverse == 1 ? 'inverse' : 0,
      \}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  " Falls back to coloring foreground group on terminals because
  " nearly all do not support undercurl
  let l:special = get(a:, 3, ['NONE', 'NONE'])
  if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !has('gui_running')
    let l:fg[0] = l:special[0]
    let l:fg[1] = l:special[1]
  endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction

"}}}2
" Poolside Highlight Groups: {{{2

call s:h('PoolsideBgLight', s:none, s:bglight)
call s:h('PoolsideBgLighter', s:none, s:bglighter)
call s:h('PoolsideBgDark', s:none, s:bgdark)
call s:h('PoolsideBgDarker', s:none, s:bgdarker)

call s:h('PoolsideFg', s:fg)
call s:h('PoolsideFgUnderline', s:fg, s:none, [s:attrs.underline])
call s:h('PoolsideFgBold', s:fg, s:none, [s:attrs.bold])

call s:h('PoolsideComment', s:comment)
call s:h('PoolsideCommentBold', s:comment, s:none, [s:attrs.bold])

call s:h('PoolsideSelection', s:none, s:selection)

call s:h('PoolsideSubtle', s:subtle)

call s:h('PoolsideCyan', s:cyan)
call s:h('PoolsideCyanItalic', s:cyan, s:none, [s:attrs.italic])

call s:h('PoolsideGreen', s:green)
call s:h('PoolsideGreenBold', s:green, s:none, [s:attrs.bold])
call s:h('PoolsideGreenItalic', s:green, s:none, [s:attrs.italic])
call s:h('PoolsideGreenItalicUnderline', s:green, s:none, [s:attrs.italic, s:attrs.underline])

call s:h('PoolsideOrange', s:orange)
call s:h('PoolsideOrangeBold', s:orange, s:none, [s:attrs.bold])
call s:h('PoolsideOrangeItalic', s:orange, s:none, [s:attrs.italic])
call s:h('PoolsideOrangeBoldItalic', s:orange, s:none, [s:attrs.bold, s:attrs.italic])
call s:h('PoolsideOrangeInverse', s:bg, s:orange)

call s:h('PoolsidePink', s:pink)
call s:h('PoolsidePinkItalic', s:pink, s:none, [s:attrs.italic])

call s:h('PoolsidePurple', s:purple)
call s:h('PoolsidePurpleBold', s:purple, s:none, [s:attrs.bold])
call s:h('PoolsidePurpleItalic', s:purple, s:none, [s:attrs.italic])

call s:h('PoolsideRed', s:red)
call s:h('PoolsideRedInverse', s:fg, s:red)

call s:h('PoolsideYellow', s:yellow)
call s:h('PoolsideYellowItalic', s:yellow, s:none, [s:attrs.italic])

call s:h('PoolsideError', s:red, s:none, [], s:red)

call s:h('PoolsideErrorLine', s:none, s:none, [s:attrs.undercurl], s:red)
call s:h('PoolsideWarnLine', s:none, s:none, [s:attrs.undercurl], s:orange)
call s:h('PoolsideInfoLine', s:none, s:none, [s:attrs.undercurl], s:cyan)

call s:h('PoolsideTodo', s:cyan, s:none, [s:attrs.bold, s:attrs.inverse])
call s:h('PoolsideSearch', s:green, s:none, [s:attrs.inverse])
call s:h('PoolsideBoundary', s:comment, s:bgdark)
call s:h('PoolsideLink', s:cyan, s:none, [s:attrs.underline])

call s:h('PoolsideDiffChange', s:orange, s:none)
call s:h('PoolsideDiffText', s:bg, s:orange)
call s:h('PoolsideDiffDelete', s:red, s:bgdark)

" }}}2

" }}}
" User Interface: {{{

set background=dark

" Required as some plugins will overwrite
call s:h('Normal', s:fg, g:poolside_colorterm || has('gui_running') ? s:bg : s:none )
call s:h('StatusLine', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineNC', s:none, s:bglight)
call s:h('StatusLineTerm', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineTermNC', s:none, s:bglight)
call s:h('WildMenu', s:bg, s:purple, [s:attrs.bold])
call s:h('CursorLine', s:none, s:subtle)

hi! link ColorColumn  PoolsideBgDark
hi! link CursorColumn CursorLine
hi! link CursorLineNr PoolsideYellow
hi! link DiffAdd      PoolsideGreen
hi! link DiffAdded    DiffAdd
hi! link DiffChange   PoolsideDiffChange
hi! link DiffDelete   PoolsideDiffDelete
hi! link DiffRemoved  DiffDelete
hi! link DiffText     PoolsideDiffText
hi! link Directory    PoolsidePurpleBold
hi! link ErrorMsg     PoolsideRedInverse
hi! link FoldColumn   PoolsideSubtle
hi! link Folded       PoolsideBoundary
hi! link IncSearch    PoolsideOrangeInverse
call s:h('LineNr', s:comment)
hi! link MoreMsg      PoolsideFgBold
hi! link NonText      PoolsideSubtle
hi! link Pmenu        PoolsideBgDark
hi! link PmenuSbar    PoolsideBgDark
hi! link PmenuSel     PoolsideSelection
hi! link PmenuThumb   PoolsideSelection
hi! link Question     PoolsideFgBold
hi! link Search       PoolsideSearch
call s:h('SignColumn', s:comment)
hi! link TabLine      PoolsideBoundary
hi! link TabLineFill  PoolsideBgDark
hi! link TabLineSel   Normal
hi! link Title        PoolsideGreenBold
hi! link VertSplit    PoolsideBoundary
hi! link Visual       PoolsideSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   PoolsideOrangeInverse

" }}}
" Syntax: {{{

" Required as some plugins will overwrite
call s:h('MatchParen', s:green, s:none, [s:attrs.underline])
call s:h('Conceal', s:cyan, s:none)

" Neovim uses SpecialKey for escape characters only. Vim uses it for that, plus whitespace.
if has('nvim')
  hi! link SpecialKey PoolsideRed
  hi! link LspReferenceText PoolsideSelection
  hi! link LspReferenceRead PoolsideSelection
  hi! link LspReferenceWrite PoolsideSelection
  hi! link LspDiagnosticsDefaultInformation PoolsideCyan
  hi! link LspDiagnosticsDefaultHint PoolsideCyan
  hi! link LspDiagnosticsDefaultError PoolsideError
  hi! link LspDiagnosticsDefaultWarning PoolsideOrange
  hi! link LspDiagnosticsUnderlineError PoolsideErrorLine
  hi! link LspDiagnosticsUnderlineHint PoolsideInfoLine
  hi! link LspDiagnosticsUnderlineInformation PoolsideInfoLine
  hi! link LspDiagnosticsUnderlineWarning PoolsideWarnLine
else
  hi! link SpecialKey PoolsidePink
endif

hi! link Comment PoolsideComment
hi! link Underlined PoolsideFgUnderline
hi! link Todo PoolsideTodo

hi! link Error PoolsideError
hi! link SpellBad PoolsideErrorLine
hi! link SpellLocal PoolsideWarnLine
hi! link SpellCap PoolsideInfoLine
hi! link SpellRare PoolsideInfoLine

hi! link Constant PoolsidePurple
hi! link String PoolsideYellow
hi! link Character PoolsidePink
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

hi! link Identifier PoolsideFg
hi! link Function PoolsideGreen

hi! link Statement PoolsidePink
hi! link Conditional PoolsidePink
hi! link Repeat PoolsidePink
hi! link Label PoolsidePink
hi! link Operator PoolsidePink
hi! link Keyword PoolsidePink
hi! link Exception PoolsidePink

hi! link PreProc PoolsidePink
hi! link Include PoolsidePink
hi! link Define PoolsidePink
hi! link Macro PoolsidePink
hi! link PreCondit PoolsidePink
hi! link StorageClass PoolsidePink
hi! link Structure PoolsidePink
hi! link Typedef PoolsidePink

hi! link Type PoolsideCyanItalic

hi! link Delimiter PoolsideFg

hi! link Special PoolsidePink
hi! link SpecialComment PoolsideCyanItalic
hi! link Tag PoolsideCyan
hi! link helpHyperTextJump PoolsideLink
hi! link helpCommand PoolsidePurple
hi! link helpExample PoolsideGreen
hi! link helpBacktick Special

"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0 et: