set nocompatible " be iMproved, required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Behavior & Formatting

set autoindent        " Indent at the same level of the previous line
set copyindent        " Copy the previous indentation on autoindenting
set shiftwidth=2      " Use indents of x spaces
set expandtab         " Tabs are spaces, not tabs
set tabstop=2         " An indentation every four columns
set softtabstop=2     " Let backspace delete indent
set nojoinspaces      " Prevents inserting two spaces after punctuation on a join (J)
set splitright        " Puts new vsplit windows to the right of the current
set splitbelow        " Puts new split windows to the bottom of the current
set pastetoggle=<C-p> " pastetoggle (sane indentation on pastes)

set wrap            " Soft-wrap lines longer than window width.
set colorcolumn=100 " Show wrap boundary for manual wrapping.
set number          " Show line numbers.

set history=1000    " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set title           " change the terminal's title
set visualbell      " don't beep
set noerrorbells    " don't beep

set nobackup
set noswapfile

" Auto-update file when changed
set autoread

let mapleader='\' " Map leader key

" -- Vim UI --
syntax enable
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set cursorline                  " Highlight current line
set laststatus=2

" Tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Window Naviation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Folding
set foldenable          " enable folding
set foldmethod=indent   " fold method
set foldlevel=50
set foldlevelstart=50   " open most folds by default
set foldnestmax=50      " 50 nested fold max
set foldcolumn=0
nnoremap <space> za     " space open/close folds

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" Quickly edit/reload the vimrc file                                                                
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Resize window (width)
nmap <leader>] :vertical resize +25<CR>
nmap <leader>[ :vertical resize -25<CR>

" Resize window (height)
nmap <leader>} :resize +25<CR>
nmap <leader>{ :resize -25<CR>

" Close all tabs except the current one
nmap <leader>ct :tabonly<CR>

" Toggle location list
nmap <leader>l :lopen<CR>
nmap <leader>cl :lclose<CR>

" Write ("Save") file
nmap <leader>/w :w<CR>

" Quite ("Exit") file
nmap <leader>/q :q<CR>

" Reload file (:edit | :e)
nmap <leader>/r :e<CR>

" Clear search
nmap <leader>/ :let @/ = ""<CR>

" Enable mouse support
set mouse=a

" Fluid side-scroll
set sidescroll=1

" Enable clipboard support
set clipboard=unnamed

" Spell check
" ]s — move to the next mispelled word
" [s — move to the previous mispelled word
" zg — add a word to the dictionary
" zug — undo the addition of a word to the dictionary
" z= — view spelling suggestions for a mispelled word
set spell
set spelllang=en_us
set spellfile=~/.vim/spell/en.add

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin installation via Vundle

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set wildignore-=doc
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Setup NERDTree
Plugin 'scrooloose/nerdtree.git'

" Setup NERDTree Tabs
Plugin 'jistr/vim-nerdtree-tabs'

" Setup NERDCommenter
Plugin 'scrooloose/nerdcommenter.git'

" Setup solarized theme
Plugin 'altercation/vim-colors-solarized.git'

" Setup monokai theme
" cp ~/.vim/bundle/colour-schemes/vim/colors/* ~/.vim/colors/
Plugin 'sickill/vim-monokai'

" rtp : runtime path
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'matchit.zip'

Plugin 'Townk/vim-autoclose'

" Setup syntastic
Plugin 'scrooloose/syntastic'

" CTRL-P - Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'

" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration

" Powerline
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" Theme
colorscheme monokai

" NERDTree
if isdirectory(expand("~/.vim/bundle/nerdtree"))
    map <leader>d :NERDTreeTabsToggle<CR>
    let NERDTreeShowBookmarks=0
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_console_startup=1
    let g:NERDTreeWinSize=25
endif

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" Show Syntastic error list
map <leader>e :Errors<CR>

" CTRL-P
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:50'
let g:ctrlp_extensions = ['buffertag']
" Make CtrlP load 100x faster by making it skip files inside .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
map <leader>t :CtrlPBufTag<CR>
