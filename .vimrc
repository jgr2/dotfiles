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

colors molokai

syntax on
