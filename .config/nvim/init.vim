"
"                         _
"   _ __   ___  _____   _(_)_ __ ___
"  | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"  | | | |  __/ (_) \ V /| | | | | | |
"  |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"


" Load vim-plug for plugins
call plug#begin('~/.config/nvim/bundle')

	Plug 'https://github.com/Shougo/deoplete.nvim'
		Plug 'https://github.com/Shougo/deoplete-clangx'
		Plug 'https://github.com/deoplete-plugins/deoplete-jedi'
		Plug 'https://github.com/Shougo/neoinclude.vim'
	Plug 'https://github.com/junegunn/goyo.vim'
	Plug '~/.config/nvim/bundle/i3-vim-syntax'
	Plug 'https://github.com/itchyny/lightline.vim'
		Plug '~/.config/nvim/bundle/lightline-biual'
	Plug 'https://github.com/rafaqz/ranger.vim'
	Plug 'https://github.com/vim-python/python-syntax'
	Plug 'https://github.com/romainl/vim-cool'
	Plug 'https://github.com/tpope/vim-commentary'
	Plug 'https://github.com/bfrg/vim-cpp-modern'
	Plug 'https://github.com/itchyny/vim-gitbranch'
	Plug 'https://github.com/tpope/vim-surround'
	Plug 'https://github.com/tpope/vim-repeat'
	Plug 'https://github.com/reedes/vim-pencil'
	Plug 'https://github.com/tpope/vim-speeddating'

call plug#end()


" Basic stuff
syntax on
filetype plugin indent on
set smartindent
set smarttab
set nu relativenumber
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set bg=light

" Colorscheme
hi LineNr           ctermfg=3
hi CursorLineNr     ctermfg=11
hi Statement        ctermfg=3
hi Visual                       ctermbg=8
hi Search                       ctermbg=8
hi SpellBad         ctermfg=0   ctermbg=1   cterm=underline
hi SpellCap         ctermfg=0   ctermbg=2   cterm=underline
hi SpellRare        ctermfg=0   ctermbg=3   cterm=underline
hi SpellLocal       ctermfg=0   ctermbg=5   cterm=underline
hi Pmenu            ctermbg=0   ctermfg=4
hi PmenuSel         ctermbg=8   ctermfg=4
hi PmenuSbar        ctermbg=0
hi DiffAdd          ctermbg=2   ctermfg=0
hi DiffChange       ctermbg=4   ctermfg=0
hi DiffDelete       ctermbg=1   ctermfg=0
let g:python_highlight_all = 1

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
map <C-h> :tabprev<CR>
map <C-l> :tabnext<CR>
map <S-j> :tabnext<CR>
map <S-k> :tabprev<CR>

" Man pages!
map <S-m> :Man<CR>

" Deoplete, autocompletion
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
set completeopt-=preview

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
