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

" *** Searching ***

set incsearch
"set hlsearch

" *** Indentation ***

set softtabstop=0

set noexpandtab

set tabstop=8
set shiftwidth=8

set autoindent

" gvim settings: make gvim look more like a terminal

set guioptions-=m " turn off menu
set guioptions-=M " don't even source menu script
set guioptions-=T " no toolbar
set guioptions-=c " console dialogs

" eliminate scrollbars, with extreme prejudice
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

set guicursor+=a:blinkon0 " remove stupid blinking cursor
set guicursor+=a:block    " cursor is always a block cursor

syntax on

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

" latexsuite stuff
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Turn off all jellybeans background colors for transparent terminal
" ------------------------------------------------------------------

" where turning off background colors would leave the text invisible
" on a dark background I've used the original background color for 
" the foreground
let g:jellybeans_overrides = {
\	'Normal': {
\		'256ctermbg': 'none',
\	},
\	'LineNr': {
\		'256ctermbg': 'none',
\	},
\	'NonText': {
\		'256ctermbg': 'none',
\	},
\	'SpecialKey': {
\		'256ctermbg': 'none',
\	},
\	'CursorLine': {
\		'256ctermbg': 'none',
\		'attr': 'bold',
\	},
\	'MatchParen': {
\		'256ctermbg': 'none',
\		'attr': 'bold',
\	},
\	'ErrorMsg': {
\		'256ctermbg': 'none',
\	},
\	'IncSearch': {
\		'256ctermbg': 'none',
\		'attr': 'bold',
\	},
\	'StatusLine': {
\		'256ctermbg': 'none',
\		'256ctermfg': 'none',
\	},
\	'StatusLineNC': {
\		'256ctermbg': 'none',
\		'256ctermfg': '240',
\	},
\	'VertSplit': {
\		'256ctermbg': 'none',
\	},
\	'Visual': {
\		'256ctermbg': 'none',
\		'256ctermfg': '240',
\	},
\	'Folded': {
\		'256ctermbg': 'none',
\	},
\	'FoldColumn': {
\		'256ctermbg': 'none',
\	},
\	'DiffAdd': {
\		'256ctermbg': 'none',
\		'256ctermfg': '22',
\	},
\	'DiffChange': {
\		'256ctermbg': 'none',
\		'256ctermfg': '24',
\	},
\	'DiffDelete': {
\		'256ctermbg': 'none',
\		'256ctermfg': '52',
\	},
\	'DiffText': {
\		'256ctermbg': 'none',
\		'256ctermfg': '81',
\	},
\	'SignColumn': {
\		'256ctermbg': 'none',
\	},
\	'Conceal': {
\		'256ctermbg': 'none',
\	},
\	'SpellBad': {
\		'256ctermbg': 'none',
\		'256ctermfg': '88',
\	},
\	'SpellCap': {
\		'256ctermbg': 'none',
\		'265ctermfg': '20'
\	},
\	'SpellRare': {
\		'256ctermbg': 'none',
\		'256ctermfg': '53',
\	},
\	'SpellLocal': {
\		'256ctermbg': 'none',
\		'256ctermfg': '23',
\	},
\	'Pmenu': {
\		'256ctermbg': 'none',
\		'256ctermfg': '240',
\	},
\	'PmenuSel': {
\		'256ctermbg': 'none',
\		'256ctermfg': '254',
\	},
\	'PmenuSbar': {
\		'256ctermbg': 'none',
\	},
\	'PmenuThumb': {
\		'256ctermbg': 'none',
\	},
\	'TabLine': {
\		'256ctermbg': 'none',
\		'256ctermfg': '145',
\	},
\	'TabLineSel': {
\		'256ctermbg': 'none',
\		'256ctermfg': '254',
\	},
\	'CursorColumn': {
\		'256ctermbg': 'none',
\	},
\	'ColorColumn': {
\		'256ctermbg': 'none',
\	},
\	'Error': {
\		'256ctermbg': 'none',
\		'256ctermfg': '9',
\	},
\	'DbgCurrent': {
\		'256ctermbg': 'none',
\		'256ctermfg': '25',
\	},
\	'DbgBreakPt': {
\		'256ctermbg': 'none',
\		'256ctermfg': '53',
\	},
\	'IndentGuidesOdd': {
\		'256ctermbg': 'none',
\		'256ctermfg': '235',
\	},
\	'IndentGuidesEven': {
\		'256ctermbg': 'none',
\		'256ctermfg': '234',
\	},
\	'PreciseJumpTarget': {
\		'256ctermbg': 'none',
\	},
\}

let g:jellybeans_background_color_256="none"

colors jellybeans
