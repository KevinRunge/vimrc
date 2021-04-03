" Needs to be first
set nocompatible

" vim-plug
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'derekwyatt/vim-fswitch'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/landscape.vim'
call plug#end()

" ----- General -----
set backspace=indent,eol,start      " Backspace behaviour 
set ruler                           " Ruler 
set number                          " Line numbers
set showcmd
set incsearch                       " Enable incremental search
set hlsearch                        " Enable highlight search
set belloff=all                     " Disable annoying bell sounds

syntax on

" ----- NERDTree settings -----
let NERDTreeShowBookmarks = 1       " Show the bookmarks table
let NERDTreeShowHidden = 1          " Show hidden files
let NERDTreeShowLineNumbers = 0     " Hide line numbers
let NERDTreeMinimalMenu = 1         " Use the minimal menu (m)
let NERDTreeWinPos = "left"         " Panel opens on the left side
let NERDTreeWinSize = 31            " Set panel width to 31 columns

" ------ fswitch settings -----
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h let b:fswitchdst = 'cpp,c'

" ----- indentLine settings -----
let g:indentLine_char = '¦'

" ----- Tab settings -----
set tabstop=4                       " How many columns of whitespace is a tab 
set shiftwidth=4                    " How many columns of whitespace is indentation level
set expandtab

" ----- Splitting ------
set termwinsize=12x0                " new terminal will be 12 lines
set splitbelow                      " always split below
set mouse=a                         " allow mouse drag on window borders

" ----- Color Scheme -----
" set background=dark               " dark mode
colorscheme landscape               " set theme
"

" ----- Simplified Build system -----

" Ensure the buffer for building code opens in a new view
set switchbuf=useopen,split
 
" error message formats
" Microsoft MSBuild
set errorformat+=\\\ %#%f(%l\\\,%c):\ %m
" Microsoft compiler: cl.exe
set errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
" Microsoft HLSL compiler: fxc.exe
set errorformat+=\\\ %#%f(%l\\\,%c-%*[0-9]):\ %#%t%[A-z]%#\ %m
 
function! DoBuildBatchFile()
    " build.bat
    set makeprg=build
    " Make sure the output doesnt interfere with anything
    silent make
    " Open the output buffer
    copen
    echo 'Build Complete'
endfunction


" ---- Key bindings -----
" let g:AutoPairsShortcutToggle = '<C-P>'  TODO - good key binding
nmap <C-\> :vsplit <bar> :wincmd l <bar> :FSRight<CR>
nmap <F2> :NERDTreeToggle<CR>                       
" Set F7 to build. 
nnoremap <F7> :call DoBuildBatchFile()<CR>
"Go to next error
nnoremap <F6> :cn<CR>
"Go to previous error
nnoremap <F5> :cp<CR>
