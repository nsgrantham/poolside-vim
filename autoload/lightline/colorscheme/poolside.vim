" Vim Lightline File
" Maintained: https://github.com/nsgrantham/poolside-vim/blob/main/autoload/lightline/colorscheme/poolside.vim
" Based On:   https://github.com/dracula/vim/blob/master/autoload/lightline/colorscheme/dracula.vim
" License:    MIT License

let s:black    = g:poolside#palette.bg
let s:gray     = g:poolside#palette.selection
let s:white    = g:poolside#palette.fg
let s:darkblue = g:poolside#palette.comment
let s:cyan     = g:poolside#palette.cyan
let s:green    = g:poolside#palette.green
let s:orange   = g:poolside#palette.orange
let s:purple   = g:poolside#palette.purple
let s:red      = g:poolside#palette.red
let s:yellow   = g:poolside#palette.yellow

if exists('g:lightline')

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
  let s:p.normal.left = [ [ s:black, s:purple ], [ s:cyan, s:gray ] ]
  let s:p.normal.right = [ [ s:black, s:purple ], [ s:white, s:darkblue ] ]
  let s:p.inactive.right = [ [ s:black, s:darkblue ], [ s:white, s:black ] ]
  let s:p.inactive.left =  [ [ s:cyan, s:black ], [ s:white, s:black ] ]
  let s:p.insert.left = [ [ s:black, s:green ], [ s:cyan, s:gray ] ]
  let s:p.replace.left = [ [ s:black, s:red ], [ s:cyan, s:gray ] ]
  let s:p.visual.left = [ [ s:black, s:orange ], [ s:cyan, s:gray ] ]
  let s:p.normal.middle = [ [ s:white, s:gray ] ]
  let s:p.inactive.middle = [ [ s:white, s:gray ] ]
  let s:p.tabline.left = [ [ s:darkblue, s:gray ] ]
  let s:p.tabline.tabsel = [ [ s:cyan, s:black ] ]
  let s:p.tabline.middle = [ [ s:darkblue, s:gray ] ]
  let s:p.tabline.right = copy(s:p.normal.right)
  let s:p.normal.error = [ [ s:red, s:black ] ]
  let s:p.normal.warning = [ [ s:yellow, s:black ] ]

  let g:lightline#colorscheme#poolside#palette = lightline#colorscheme#flatten(s:p)

endif

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0: