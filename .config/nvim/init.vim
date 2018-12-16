"                         _           
"   _ __   ___  _____   _(_)_ __ ___  
"  | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
"  | | | |  __/ (_) \ V /| | | | | | |
"  |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"


" Load Pathogen for plugins
execute pathogen#infect()

" Basic stuff
syntax on
filetype plugin indent on
set smartindent
set smarttab 
set nu relativenumber 
set clipboard=unnamedplus 
set tabstop=4
set shiftwidth=4

" Basic colorscheme
hi LineNr 			ctermfg=3
hi CursorLineNr 	ctermfg=11
hi Visual 						ctermbg=8
hi Search 						ctermbg=8
hi SpellBad 		ctermfg=0 	ctermbg=1 	cterm=underline
hi SpellCap 		ctermfg=0 	ctermbg=2 	cterm=underline
hi SpellRare 		ctermfg=0 	ctermbg=3 	cterm=underline
hi SpellLocal 		ctermfg=0 	ctermbg=5 	cterm=underline

" Lightline
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'biual',
	\ 'active': {
	\ 'left': [  [ 'mode' ],
	\            [ 'readonly', 'filename', 'gitbranch' ],
	\            [ 'modified' ] ],
        \ 'right': [ [ 'filetype', 'fileencoding' ],
	\            [ 'percent' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'gitbranch#name'
	\ },
	\ }


" Disable changing cursor to line
set guicursor=
autocmd OptionSet guicursor noautocmd set guicursor=


" Tab Managment
map <C-o> :tabnew<CR>
map <C-d> :tabclose<CR>
map <C-k> :tabprev<CR>
map <C-j> :tabnext<CR>


" Deoplete, autocompletion
call deoplete#enable()

" Colors
highlight Pmenu ctermbg=0 ctermfg=4 guibg=#0a0a30 guifg=#226ebf
highlight PmenuSel ctermbg=8 ctermfg=4 guibg=#10105b guifg=#226ebf
highlight PmenuSbar ctermbg=0 guibg=#0a0a30

" Complete with <TAB>
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}


" Open Ranger, file manager
map <C-\> :RangerEdit<CR>


" Spell-check (English US and Polish)
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F7> :setlocal spell! spelllang=pl<CR>


" Toggle Goyo, distraction free mode
map <F8> :Goyo<CR>


" Toggle Pencil, wrapping text
map <F9> :PencilSoft<CR>
map <F10> :PencilHard<CR>
