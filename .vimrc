" *** Editing ***
"
set backspace=indent,eol,start " obligatory backspace setting

set textwidth=80 " the 'stuck in the 80s console width' wrap settings
set wrapmargin=80

set nowrap " turn off soft wrapping

" formatoptions (see: fo-table for more goodies)
set formatoptions+=b " wrap at whitespace

set formatoptions+=c " wrap comments with leading comment char
set formatoptions+=r " same on enter
set formatoptions+=o " same on 'o'
set formatoptions+=j " join combines comments
set formatoptions+=q " 'gq' formats comments as well

set formatoptions+=n " numbered list wrapping

" *** Backups et al. ***
"

" get out of my directories!
set backupdir-=.
set dir-=.

set backupdir^=~/.vim/backup
set dir^=~/.vim/tmp//

" stop polluting my system with .netrwhist files!
let g:netrw_home = "~/.vim/"

" *** Undo ***
"
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif

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

	if has('gui_win32')
		set guifont=Inconsolata:h10
	endif
endif

" *** Look and feel ***
"

if has('title')
	set title
endif

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
set listchars=tab:⋅·,trail:~

" *** Autocmds *** " 
if has('autocmd')

	filetype plugin indent on

	augroup web
		au BufRead,BufNewFile *.{html,js,css}
\			set sts=2 sw=2 ts=2 expandtab
	augroup end

	" apply autocmds to specific directory (uni assignments)
	augroup oua
		au BufRead,BufEnter */OUA/CPT121/*.java
\			set sw=4 ts=4 et sa ff=dos
		au BufRead,BufEnter */OUA/CPT120/*.jy
\			set filetype=python sw=2 ts=2 et sa ff=dos
	augroup end

	augroup templates
		au!
		au BufNewFile *.* call LoadTemplates(expand("<afile>:e"))
	augroup end

endif

fun LoadTemplates (ext)

	let l:templates = reverse(split(glob($HOME.'/.vim/templates/*.'.a:ext), '\n'))

	if len(l:templates)

		for tmpl in l:templates
			execute '0r '.tmpl
		endfor

		normal Go
	endif
endfun

" Language specific settings

let g:rust_recommended_style = 0

" Final

colors molokai

execute pathogen#infect()

filetype plugin indent on
syntax on
