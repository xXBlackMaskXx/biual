" Color Scheme  [ '#rrggbb', Xresources number]
let s:black =   [ '#0a0a30', 0 ]
let s:red =     [ '#aa2f46', 1 ]
let s:green =   [ '#2a9361', 2 ]
let s:yellow =  [ '#a0782e', 3 ]
let s:blue =    [ '#226ebf', 4 ]
let s:magenta = [ '#aa2f83', 5 ]
let s:cyan =    [ '#2a9392', 6 ]
let s:white =   [ '#9b9cb5', 7 ]
let s:darkgrey =[ '#10105b', 8 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" Airline have something like boxes, where you put plugins. So you have to
" change colors for all boxes individually. If you don't want to, you don't have
" to set different colors for different Vim modes, you can just comment them out.
" 
" Syntax:
" let s:p.mode.position    [[ s:foreground, s:background ], [ s:foreground, s:background ]]

" Normal
let s:p.normal.left =      [[ s:blue, s:darkgrey ], [ s:blue, s:black ], [ s:blue, s:black ]]
let s:p.normal.middle =    [[ s:blue, s:black ],    [ s:blue, s:black ], [ s:blue, s:black ]]
let s:p.normal.right =     [[ s:blue, s:darkgrey ], [ s:blue, s:black ], [ s:blue, s:black ]]
let s:p.normal.error =     [[ s:blue, s:darkgrey ]]
let s:p.normal.warning =   [[ s:black, s:yellow ]]

" Inactive
"let s:p.inactive.left =    [[ s:white, s:black ], [ s:white, s:black ], [ s:white, s:black ]]
"let s:p.inactive.middle =  [[ s:white, s:black ], [ s:white, s:black ], [ s:white, s:black ]]
"let s:p.inactive.right =   [[ s:white, s:black ], [ s:white, s:black ], [ s:white, s:black ]]

" Insert
"let s:p.insert.left =      [[ s:blue, s:darkgrey ], [ s:blue, s:black ], [ s:blue, s:black ]]
"let s:p.insert.middle =    [[ s:blue, s:black ],    [ s:blue, s:black ], [ s:blue, s:black ]]
"let s:p.insert.right =     [[ s:blue, s:darkgrey ], [ s:blue, s:black ], [ s:blue, s:black ]]

" Replace
"let s:p.replace.left =     [[ s:blue, s:darkgrey ], [ s:blue, s:black ], [ s:blue, s:black ]]
"let s:p.replace.middle =   [[ s:blue, s:black ],    [ s:blue, s:black ], [ s:blue, s:black ]] 
"let s:p.replace.right =    [[ s:blue, s:darkgrey ], [ s:blue, s:black ], [ s:blue, s:black ]]

" Visual
"let s:p.visual.left =      [[ s:blue, s:darkgrey ], [ s:blue, s:black ], [ s:blue, s:black ]]
"let s:p.visual.middle =    [[ s:blue, s:black ],    [ s:blue, s:black ], [ s:blue, s:black ]]
"let s:p.visual.right =     [[ s:blue, s:darkgrey ], [ s:blue, s:black ], [ s:blue, s:black ]]

" Tabs
let s:p.tabline.left =     [[ s:blue, s:black ]]
let s:p.tabline.tabsel =   [[ s:blue, s:darkgrey ]]
let s:p.tabline.middle =   [[ s:blue, s:black ]]
let s:p.tabline.right =    [[ s:blue, s:black ]]


let g:lightline#colorscheme#biual#palette = lightline#colorscheme#flatten(s:p)
