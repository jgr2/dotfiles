
set title
set number
set showmode
set showcmd

set mouse=a
set ruler

set autoread
set history=1000

set winwidth=85
set winheight=45

set modeline

syntax on
filetype plugin on

set bg=dark

"colors jellybeans
"set bg=dark

hi Normal ctermbg=NONE ctermfg=256
hi NonText ctermbg=NONE
hi IncSearch cterm=NONE
hi LineNr ctermbg=none ctermfg=11
hi SpecialKey ctermbg=none ctermfg=188

hi StatusLine cterm=NONE ctermbg=24
hi StatusLineNC cterm=NONE ctermbg=25
hi VertSplit cterm=NONE ctermbg=24


" *** Searching ***

set incsearch
"set hlsearch

" *** Indentation ***
set cindent

"set ts=8
"set sw=8

set noexpandtab

filetype plugin indent on

set list listchars=tab:\ \ ,trail:~

set nowrap
set linebreak

" *** Undo ***
"
set undodir=~/.vim/backups
set undofile

" *** Files ***

au BufRead,BufNewFile *.md set ft=markdown

au BufRead,BufNewFile *.{html,js,css} set nocindent autoindent sw=4 ts=4 noexpandtab

