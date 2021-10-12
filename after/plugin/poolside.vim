if poolside#should_abort()
  finish
endif

" Fzf: {{{
if exists('g:loaded_fzf') && ! exists('g:fzf_colors')
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Search'],
    \ 'fg+':     ['fg', 'Normal'],
    \ 'bg+':     ['bg', 'Normal'],
    \ 'hl+':     ['fg', 'PoolsideOrange'],
    \ 'info':    ['fg', 'PoolsidePurple'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'PoolsideGreen'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'],
    \}
endif
"}}}
" ALE: {{{
if exists('g:ale_enabled')
  hi! link ALEError              PoolsideErrorLine
  hi! link ALEWarning            PoolsideWarnLine
  hi! link ALEInfo               PoolsideInfoLine

  hi! link ALEErrorSign          PoolsideRed
  hi! link ALEWarningSign        PoolsideOrange
  hi! link ALEInfoSign           PoolsideCyan

  hi! link ALEVirtualTextError   Comment
  hi! link ALEVirtualTextWarning Comment
endif
" }}}
" CtrlP: {{{
if exists('g:loaded_ctrlp')
  hi! link CtrlPMatch     IncSearch
  hi! link CtrlPBufferHid Normal
endif
" }}}
" GitGutter / gitsigns: {{{
if exists('g:loaded_gitgutter')
  hi! link GitGutterAdd    DiffAdd
  hi! link GitGutterChange DiffChange
  hi! link GitGutterDelete DiffDelete
endif
if has('nvim-0.5') && luaeval("pcall(require, 'gitsigns')")
  " https://github.com/lewis6991/gitsigns.nvim requires nvim > 0.5
  " has('nvim-0.5') checks >= 0.5, so this should be future-proof.
  hi! link GitSignsAdd      DiffAdd
  hi! link GitSignsAddLn    DiffAdd
  hi! link GitSignsAddNr    DiffAdd
  hi! link GitSignsChange   DiffChange
  hi! link GitSignsChangeLn DiffChange
  hi! link GitSignsChangeNr DiffChange
  hi! link GitSignsDelete   DiffDelete
  hi! link GitSignsDeleteLn DiffDelete
  hi! link GitSignsDeleteNr DiffDelete
endif
" }}}
" Tree-sitter: {{{
" The nvim-treesitter library defines many global highlight groups that are
" linked to the regular vim syntax highlight groups. We only need to redefine
" those highlight groups when the defaults do not match the poolside
" specification.
" https://github.com/nvim-treesitter/nvim-treesitter/blob/master/plugin/nvim-treesitter.vim
if exists('g:loaded_nvim_treesitter')
  " # Misc
  hi! link TSPunctSpecial Special
  " # Constants
  hi! link TSConstMacro Macro
  hi! link TSStringEscape Character
  hi! link TSSymbol PoolsidePurple
  hi! link TSAnnotation PoolsideYellow
  hi! link TSAttribute PoolsideGreenItalic
  " # Functions
  hi! link TSFuncBuiltin PoolsideCyan
  hi! link TSFuncMacro Function
  hi! link TSParameter PoolsideOrangeItalic
  hi! link TSParameterReference PoolsideOrange
  hi! link TSField PoolsideOrange
  hi! link TSConstructor PoolsideCyan
  " # Keywords
  hi! link TSLabel PoolsidePurpleItalic
  " # Variable
  hi! link TSVariableBuiltin PoolsidePurpleItalic
  " # Text
  hi! link TSStrong PoolsideFgBold
  hi! link TSEmphasis PoolsideFg
  hi! link TSUnderline Underlined
  hi! link TSTitle PoolsideYellow
  hi! link TSLiteral PoolsideYellow
  hi! link TSURI PoolsideYellow
  " HTML and JSX tag attributes. By default, this group is linked to TSProperty,
  " which in turn links to Identifer (white).
  hi! link TSTagAttribute PoolsideGreenItalic
endif
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
