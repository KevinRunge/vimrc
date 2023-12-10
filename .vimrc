" Needs to be first
set nocompatible

" Lets default to English
language messages C

" vim-plug
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'tomasr/molokai'
Plug 'dracula/vim'
Plug 'shanzi/autoheader'
call plug#end()

" ----- General -----
set backspace=indent,eol,start      " Backspace behaviour 
set ruler                           " Ruler 
set number                          " Line numbers
set showcmd
set incsearch                       " Enable incremental search
set hlsearch                        " Enable highlight search
set belloff=all                     " Disable annoying bell sounds
set cursorline                      " Highlight current cursor line

syntax on

" ----- NERDTree settings -----
let NERDTreeShowBookmarks = 1       " Show the bookmarks table
let NERDTreeShowHidden = 1          " Show hidden files
let NERDTreeShowLineNumbers = 0     " Hide line numbers
let NERDTreeMinimalMenu = 1         " Use the minimal menu (m)
let NERDTreeWinPos = "left"         " Panel opens on the left side
let NERDTreeWinSize = 31            " Set panel width to 31 columns

" ----- indentLine settings -----
let g:indentLine_char = '¦'

" ----- Tab settings -----
set tabstop=4                       " How many columns of whitespace is a tab 
set softtabstop=4                   " see multiple spaces as tab stop so <BS> does the right thing
set shiftwidth=4                    " How many columns of whitespace is indentation level
set expandtab                       " convert tab to white spaces
set autoindent                      " indent the new line just as the line just typed
" ----- Splitting ------
set termwinsize=12x0                " new terminal will be 12 lines
set splitbelow                      " always split below
set mouse=a                         " allow mouse drag on window borders

" ----- Color Scheme -----
" set background=dark               " dark mode
colorscheme dracula                 " set theme

" ---- AutoHeader ---- 
" Uses a customized version of AutoHeader which adds a copyright notice
let g:autoHEADER_default_author="Kevin Runge"

" ---- Key bindings -----
" let g:AutoPairsShortcutToggle = '<C-P>'  TODO - good key binding
nmap <C-\> :vsplit <CR>
nmap <F2> :NERDTreeToggle<CR>
" jump to split plane
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
" use ii to exit insert mode
inoremap ii <Esc>

" Python specific mappings
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
