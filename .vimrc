" Vim configuration file "
set nocompatible
filetype off
" This is necessary to get vundle working and allow it to manage plugins
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/Vundle.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, this should go before any other plugin
Plugin 'VundleVim/Vundle.vim'

" Plugins go down here
" Keep Plugin commands between vundle#begin/end.
Plugin 'sheerun/vim-polyglot'
Plugin 'preservim/nerdtree'
Plugin 'raimondi/delimitmate'
Plugin 'vim-airline/vim-airline'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" enable syntax "
syntax on

" show status bar
set laststatus=2

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" enable line numbers "
set number

" highlights a column of current line after 80column width has been reached"
:highlight ColorColumn ctermbg=magenta
:call matchadd('colorColumn', '\%81v', 100)

"set cursorline 
":highlight cursorline cterm=bold ctermbg=black
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" enable highlight search pattern "
set hlsearch
" stop search highlight until next search pattern
" set nohlsearch
" set highlighting to the inverse
"set invhlsearch

" enable smartcase search sensitivity "
set ignorecase
set smartcase

" Indentation using spaces "
" tabstop:	width of tab character
" softtabstop:	fine tunes the amount of whitespace to be added
" shiftwidth:	determines the amount of whitespace to add in normal mode
" expandtab:	when on use space instead of tab
" textwidth:	text wrap width
" autoindent:	autoindent in new line
set tabstop	=4
"set softtabstop	=4
set shiftwidth	=4
set textwidth	=79
"set expandtab
set autoindent

" Intelligent indentation for C
set smartindent
set cindent

" set's expand tab for python files onlys
autocmd FileType python setlocal expandtab

" file type indent for python
autocmd BufWritePre *.py : filetype indent on

" show the matching part of pairs [] {} and () "
set showmatch

" remove trailing whitespace from Python and C files "
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.c :%s/\s\+$//e

" enable color themes "
if (has("termguicolors"))
    set termguicolors
endif
if (!has("gui_running"))
	set term=xterm-256color
	set t_Co=256
endif
" enable true colors support "
set termguicolors
" Vim colorscheme "
"colorscheme evening
"colorscheme koehler
"colorscheme onedark
set background=dark
colorscheme gruvbox

" Set line movement with shift/alt + K,J "
" one line down "
nnoremap <S-j> :m .+1<CR>==
" one line up "
nnoremap <S-k> :m .-2<CR>==
"inoremap <S-j> <Esc>:m .+1<CR>==gi
"inoremap <S-k> <Esc>:m .-2<CR>==gi
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"-------------------------------------------------------------"
"Bonus. " Find & Replace (if you use the ignorecase, smartcase these are mandatory) "
"            :%s/<find>/<replace>/g   "replace global (e.g. :%s/mass/grass/g)"
"            :%s/<find>/<replace>/gc  "replace global with confirmation"
"            :%s/<find>/<replace>/gi  "replace global case insensitive"
"            :%s/<find>/<replace>/gI  "replace global case sensitive"
"            :%s/<find>/<replace>/gIc "replace global case sensitive with confirmation"

"        " Vim (book)marks "
"            mn     "replace n with a word A-Z or number 0-9"
"            :'n     "go to mark n"
"            :`.     "go to the last change"
"            :marks  "show all declared marks"
"            :delm n "delete mark n"

"        " Delete range selection "
"            :<line_number>,<line_number>d "(e.g. :2,10d deletes lines 2-10)"

"        " LaTeX shortcuts "
"            nnoremap <F1> :! pdflatex %<CR><CR>
"            nnoremap <F2> :! bibtex $(echo % \| sed 's/.tex$//') & disown<CR><CR>
"            nnoremap <F3> :! evince $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
"            nnoremap <F4> :! rm *.log *.aux *.out *.blg & disown<CR><CR>
