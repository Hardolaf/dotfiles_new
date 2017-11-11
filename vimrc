" ----------------------------------------------------------------------
"  .vimrc                                                            {{{
" ----------------------------------------------------------------------

" Allow vim to break compatibility with vi
set nocompatible " Must be first as it changes other options

" Set filetype to off
filetype off

" }}}-------------------------------------------------------------------
"  Plugin                                                            {{{
" ----------------------------------------------------------------------

" Set up the Plug plugin mnager and plugins
source ~/.vim/config/plug.vim

" }}}-------------------------------------------------------------------
"  General Settings                                                 {{{
" ----------------------------------------------------------------------

" Set the leader key
" let mapleader = '\<Space>'
" set notimeout

" Setup all files to be treated as UTF-8 by default
set encoding=utf-8
" Set spelling on
set spell
" Set spelling language
set spelllang=en_us
" Custome spell file
"set spellfile=~/.vim/spell/en.utf-8.add
" Ban background buffers
set nohidden
" Indicate fast terminal connection
set ttyfast
" Allow backspace over autoindent, line breaks, starts of insert
set backspace=indent,eol,start
" Fix some node watching tools
set backupcopy=yes
" Remove welcome screen
set shortmess+=I
" No .swp warning
set shortmess+=A
" Set history length
set history=50
" Disable unsafe commands in the local .vimrc file
set secure

" }}}-------------------------------------------------------------------
"  Visual Settings                                                  {{{
" ----------------------------------------------------------------------

" Control area (may be superseded by vim-airline)
"" Show partial command in the last line of the screen.
set showcmd
"" Command completion
set wildmenu
"" List all matches and complete till longest common string
set wildmode=list:longest
"" The last window will have a status line
set laststatus=2
"" Don't show the mode in the last line of the screen as this is handled
"" by vim-airline
set noshowmode
"" Show the line and column number of the cursor
set ruler
"" Don't update the screen while executing macros and commands
set lazyredraw

"" Command line autocomplete is case insensitive; keep vim consistent with
"" the command line. Only enable if supported.
if exists("&wildingorecase")
  set wildignorecase
endif

" Buffer Area Visuals
"" Maintain 7 lines at the bottom at minimum
set scrolloff=7
"" Use visual, not beep for the bell
set visualbell
"" Highlight the current line
set cursorline
"" Set line numbers
set number
"" Soft wrap at the window width
set wrap
"" Break the line on words
set linebreak
"" Break line at just under 80 characters
set textwidth=79

"" Highlight the column after `textwidth`
if exists('+colorcolumn')
  set colorcolumn=+1
endif

"" Width of the line number column (probably won't go over 9,999)
set numberwidth=4

" Show fold column, fold by markers
"" Don't show the folding gutter/column
set foldcolumn=0
"" Fold on {{{ }}}
set foldmethod=marker
"" Open 20 levels of folding when opening a file
set foldlevelstart=20

"" Open folds under the following conditions
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo,jump

"" Highlight tabs and trailing spaces
set listchars=tab:▸\ ,trail:•
"" Make whitespace characters visible
set list

" Splits
"" Open splits below and to the right
set splitbelow
set splitright


" Function to trim trailing white space
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Character meaning when present in 'formatoptions'
" ------ ---------------------------------------
" c Auto-wrap comments using textwidth, inserting the current comment leader automatically.
" q Allow formatting of comments with "gq".
" r Automatically insert the current comment leader after hitting <Enter> in Insert mode.
" t Auto-wrap text using textwidth (does not apply to comments)
" n Recognize numbered lists
" 1 Don't break line after one-letter words
" a Automatically format paragraphs
set formatoptions=cqrn1

" Colors
"" Enable syntax highlighting
syntax enable
"" Enable 256 colors
set t_Co=256
colorscheme hybrid

let g:airline_theme='zenburn'

" When completing, fill with the longest common string
" Auto select the first option
set completeopt=longest,menuone

" Printing options
set printoptions=header:0,duplex:long,paper:letter,syntax:n
" header:0                  Do not print a header
" duplex:long (default)     Print on both sides (when possible), bind on long
" syntax:n                  Do not use syntax highlighting.

" }}}-------------------------------------------------------------------------
"   Style for terminal vim
" ----------------------------------------------------------------------------

" Don't show the airline separators
" The angle bracket defaults look fugly
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_powerline_fonts=0
set mouse+=a  " Add mouse support for 'all' modes, may require iTerm
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" }}}-------------------------------------------------------------------------
"   Search                                                                {{{
" ----------------------------------------------------------------------------

" Show search results as we type
set incsearch
" Show matching brackets
set showmatch
" Highlight search results
set hlsearch

" Use regex for searches
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
" Ignore case when searching
set ignorecase
" Don't ignore case if we have a capital letter
set smartcase

" }}}-------------------------------------------------------------------------
"   Tabs                                                                  {{{
" ----------------------------------------------------------------------------

" Show a tab as four spaces
set tabstop=4
" Reindent is also four spaces
set shiftwidth=4
" When hit <tab> use four columns
set softtabstop=4
" Create spaces when I type <tab>
set expandtab
" Round indent to multiple of 'shiftwidth'.
set shiftround
" Put my cursor in the right place when I start a new line
set autoindent
" Rely on file plugins to handle indenting
filetype plugin indent on

" }}}-------------------------------------------------------------------------
"   Custom commands                                                       {{{
" ----------------------------------------------------------------------------

" Faster save/quite/close
nmap <silent> <Leader>w :update<CR>
nmap <silent> <Leader>q :quit<CR>
nmap <silent> <Leader>c :bdelete<CR>
nmap <silent> <Leader>n :cnext<CR>
nmap <silent> <Leader>p :cprevious<CR>

" Trim trailing white space
nmap <silent> <Leader>t :call StripTrailingWhitespaces()<CR>

" Move current window to the far left using full height
nmap <silent> <Leader>h <C-w>H
" Move current window to the far right using full height
nmap <silent> <Leader>l <C-w>L
" Move current window to the top using full width
nmap <silent> <Leader>k <C-w>K
" Move current window to the bottom using full width
nmap <silent> <Leader>j <C-w>J

nmap <silent> <Leader>d :YcmCompleter GoToDefinition<CR>

" Clear search highlights
nnoremap <leader><space> :nohlsearch<cr>

" Set up rooter for finding the root of the root of every project
"" Resolve symbolic links
let g:rooter_resolve_links = 1
"" Patterns to identify the root directory
let g:rooter_patterns = ['Rakefile', '.git', '.git/', '.svn/']

"" Automatically set current working directory
autocmd BufEnter * :Rooter

" }}}-------------------------------------------------------------------------

