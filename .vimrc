" *** Autocmds *** " 
if has('autocmd')

	filetype plugin indent on

	augroup markdown
		au BufRead,BufNewFile *.md set ft=markdown
	augroup end

	augroup web
		au BufRead,BufNewFile *.{html,js,css}
\			set sts=2 sw=2 ts=2 expandtab
	augroup end

	" apply autocmds to specific directory (uni assignments)
	augroup oua
		au BufRead,BufEnter */OUA/CPT121/*.java
\			set sts=4 sw=4 ts=4 expandtab ff=dos
		au BufRead,BufEnter */OUA/CPT120/*.jy
\			set filetype=python sts=2 sw=2 ts=2 expandtab ff=dos
	augroup end
	augroup xresourcesd
		au BufRead,BufEnter ~/.Xresources.d/*
\			set ft=xdefaults
	augroup end

endif

" *** Undo ***
"
set undodir=~/.vim/backups
set undofile

" *** Searching ***
"
if has('extra_search')
	set incsearch
	set hlsearch

	" bind Ctrl+_ to :nohl - clear highlight from hlsearch
	map <C-_> :nohl<CR>
endif

" *** Gvim ***
"

" gvim settings: make gvim look more like a terminal
if has('gui_running')

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
endif

" *** Look and feel ***
"

if has('title')
	set title
endif

set nowrap

set number

set showmode

if has('cmdline_info')
	set showcmd
	set ruler
endif

if has('wildmenu')
	set wildmenu
endif

set mouse=a

set winwidth=85
set winheight=55

if has('verspplit')
	set splitright " Everything splits right
endif

set list
set listchars=tab:>-,trail:~

" Turn off all jellybeans background colors for transparent terminal
" ------------------------------------------------------------------

" where turning off background colors would leave the text invisible
" on a dark background I've used the background color picked by jellybeans
" for the the foreground.
"
" NOTE:
"	Setting the background of StatusLine and StatusLineNC to none
"	seems to result in a bug in which the space of the status line
"	is filled with carets- very annoying!
"
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
\		'256ctermbg': '236',
\		'256ctermfg': 'none',
\	},
\	'StatusLineNC': {
\		'256ctermbg': '234',
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
\	'Comment': {
\		'256ctermfg': '145',
\	},
\}

let g:jellybeans_background_color_256="none"

colors jellybeans

syntax on
