set nocompatible " be iMproved, required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Notes
" - :map and :noremap are recursive and non-recursive versions of the various mapping commands
" - Vim is a modal editor. It has a [n]ormal mode, [v]isual mode and other modes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CHEATSHEET
" Fix Indent gg=G

let mapleader='\' " Map leader key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behavior & Formatting

set autoindent    " Indent at the same level of the previous line
set copyindent    " Copy the previous indentation on autoindenting
set shiftwidth=4  " Use indents of x spaces
set expandtab     " Tabs are spaces, not tabs
set tabstop=4     " An indentation every four columns
set softtabstop=4 " Let backspace delete indent
set nojoinspaces  " Prevents inserting two spaces after punctuation on a join (J)

set nowrap linebreak nolist " Soft-wrap lines longer than window width
set colorcolumn=100       " Show wrap boundary for manual wrapping (80 is recommended for reading - see typography)
let &colorcolumn=join(range(100,101),",")

nmap <leader>w :set wrap<CR>
nmap <leader>nw :set nowrap<CR>

set foldenable
set foldmethod=indent
set foldlevel=99
"set foldlevelstart=20
"set foldnestmax=20
"set foldcolumn=0

"let javaScript_fold=1     " JavaScript
"let perl_fold=1           " Perl
"let php_folding=1         " PHP
"let r_syntax_folding=1    " R
"let ruby_fold=1           " Ruby
"let sh_fold_enabled=1     " sh
"let vimsyn_folding='af'   " Vim script
"let xml_syntax_folding=1  " XML
nnoremap <space> za       " Key map to open/close folds


"set pastetoggle=<C-p> " Pastetoggle (sane indentation on pastes)
set history=1000      " Remember more commands and search history
set undolevels=1000   " Use many muchos levels of undo

set visualbell noerrorbells " Don't beep
set nobackup                " Avoid un-needed buffer backup
set noswapfile              " Avoid temporary files when editing
set autoread                " Auto-update file when changed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor Settings & Some Key Mapping

syntax enable
set synmaxcol=1000             " Boost performance with long lines
set number                     " Show line numbers
set backspace=indent,eol,start " Backspace for dummies
set linespace=0                " No extra spaces between rows
set incsearch                  " Find as you type search
set hlsearch                   " Highlight search terms
set winminheight=0             " Windows can be 0 line high
set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when uc present

" Code completion
set wildmenu                      " Show list instead of just completing
set wildmode=longest,list:longest " Command <Tab> completion, list matches, then longest common part, then all
set completeopt=menu,preview
set complete=.,b,u,]              " pull from keywords in the current file, other buffers (closed or still open), and from the current tags file

set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap too
set cursorline                 " Highlight current line
set laststatus=1

" Concealing 'markup' characters to improve readability
set conceallevel=2
set concealcursor=nc

set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current

" Tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Window Naviation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quickly edit/reload the vimrc file                                                                
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Resize window (width)
nmap <leader>] :vertical resize +10<CR>
nmap <leader>[ :vertical resize -10<CR>

" Resize window (height)
nmap <leader>} :resize +10<CR>
nmap <leader>{ :resize -10<CR>

" Close all tabs except the current one
nmap <leader>ct :tabonly<CR>

" toggle location list window
nmap <leader>l :lopen<cr>
nmap <leader>cl :lclose<cr>

" toggle quickfix list window
nmap <leader>f :copen<cr>
nmap <leader>cf :cclose<cr>

" Reload file (:edit | :e)
nmap <leader>r :e<CR>

" Clear search
nmap <leader>/ :let @/ = ""<CR>

" Enable mouse support
set mouse=a

" Fluid incremental side-scroll
set sidescroll=1 listchars=extends:…,precedes:…

" Enable clipboard support
set clipboard=unnamed

" Spell check
" ]s — move to the next mispelled word
" [s — move to the previous mispelled word
" zg — add a word to the dictionary
" zug — undo the addition of a word to the dictionary
" z= — view spelling suggestions for a mispelled word
" set spell
set spelllang=en_us
set spellfile=~/.vim/spell/en.add

" Set an appropriate title for the terminal session
set title
set titlestring=%t

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (Via Vundle)

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set wildignore-=doc
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

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
" Plugin 'sickill/vim-monokai'
Plugin 'crusoexia/vim-monokai'

" rtp : runtime path
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Find matching character
Plugin 'matchit.zip'

" An  auto-complete for  open-close pair  of  characters
Plugin 'Townk/vim-autoclose'

" Setup syntastic
Plugin 'scrooloose/syntastic'

" CTRL-P - Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'ctrlpvim/ctrlp.vim'

" Aligning text with Tabular
" (cmd :Tabularize /:)
Plugin 'godlygeek/tabular'

" Auto ctag generation
Plugin 'craigemery/vim-autotag'

" Run Ack in VIM
" @note Use :Ack! to avoid jumping to the first result automatically
Plugin 'mileszs/ack.vim'

" Indentation guides (especially useful if you convert tabs to spaces)
Plugin 'Yggdroot/indentLine'

" The pencil plugin aspires to make Vim as powerful a tool for writers
Plugin 'reedes/vim-pencil'

" Markdown syntax highlighting
Plugin 'plasticboy/vim-markdown'

Plugin 'leafgarland/typescript-vim'

" Better json highlighting
Plugin 'elzr/vim-json'

" Python code folding
Plugin 'tmhedberg/SimpylFold'

" GIT integration
Plugin 'tpope/vim-fugitive'

" Python PEP8 checking.
Plugin 'nvie/vim-flake8'

" Markdown Viewer
Plugin 'JamshedVesuna/vim-markdown-preview'

" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings

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

" Theme customization
highlight Normal ctermbg=234 guibg=#1c1c1c
highlight ColorColumn ctermbg=235 guibg=#262626
highlight LineNr ctermbg=234 guibg=#1c1c1c
highlight CursorLine ctermbg=235 guibg=#262626
highlight VertSplit ctermbg=NONE guibg=NONE
let g:indentLine_color_term=237

" NERDTree
if isdirectory(expand("~/.vim/bundle/nerdtree"))
    map <leader>d :NERDTreeTabsToggle<CR>
    let NERDTreeShowBookmarks=0
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_console_startup=1
    let g:NERDTreeWinSize=20
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
endif

" Syntastic
if isdirectory(expand("~/.vim/bundle/syntastic"))
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    
    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_loc_list_height=5
    let g:syntastic_auto_loc_list=1
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=1
    "let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
    let g:syntastic_javascript_checkers=['eslint']
    let g:syntastic_error_symbol='❌'
    let g:syntastic_style_error_symbol='⁉️'
    let g:syntastic_warning_symbol='⚠️'
    let g:syntastic_style_warning_symbol='💩'

    highlight link SyntasticErrorSign SignColumn
    highlight link SyntasticWarningSign SignColumn
    highlight link SyntasticStyleErrorSign SignColumn
    highlight link SyntasticStyleWarningSign SignColumn

    " Show Syntastic error list
    map <leader>e :Errors<CR>
endif

" CTRL-P
if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
    let g:ctrlp_map = '<leader>p'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:50'
    let g:ctrlp_extensions = ['buffertag']
    " Make CtrlP load 100x faster by making it skip files inside .gitignore
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    map <leader>t :CtrlPBufTag<CR>
endif

" Tabular
map <leader>a :Tabularize /

" Ctags
" @note The ;/ suffix directs vim to do an upward search
set tags=./.tags;~

" Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let vim_markdown_preview_github=0
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_temp_file=1

" Pencil
"augroup pencil
    "autocmd!
    "autocmd FileType markdown,mkd,md call pencil#init()
    ""autocmd FileType text,txt        call pencil#init({'wrap': 'hard'})
"augroup END
let g:pencil#autoformat=1
let g:pencil#textwidth=100
let g:pencil#conceallevel = 3     " 0=disable, 1=one char, 2=hide char, 3=hide all (def)
let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)

" JSON
let g:syntastic_json_checkers = ['jsonlint']
let g:vim_json_syntax_conceal = 0

" Folding
let g:SimpylFold_docstring_preview=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some Custom Goodies

command! -nargs=1 Tabspace :call TabSpace(<f-args>)

function! TabSpace(num)
    let &l:shiftwidth=a:num
    let &l:tabstop=a:num
    let &l:softtabstop=a:num
endfunction

" Show functions in file.
map <leader>@ :vimgrep /function\s\w/ % <bar> :copen<CR>

" Re-mapping keys
"inoremap <C-g> <C-x><C-o>
"set pastetoggle=<C-p>

" Python - highlight docstrings as comments, not string
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError

hi def link pythonDocstring pythonComment

" Remove multiple spaces in line
map <leader>fs :s/ \{2,}/ /<CR><leader>/<CR>

" Pretty JSON
command! -nargs=0 PrettyJSON :%!python -m json.tool

" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction
