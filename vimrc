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
let mapleader = "\<Space>"
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

" }}}-------------------------------------------------------------------------
"   Configure My Plugins                                                  {{{
" ----------------------------------------------------------------------------

" Jump thought errors with :lnext and :lprev
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Return to last edit position when opening files, except git commit message
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Ctrl-P
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache|pip_download_cache|wheel_cache)$',
  \ 'file': '\v\.(png|jpg|jpeg|gif|DS_Store|pyc)$',
  \ 'link': '',
  \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
" Wait to update results (This should fix the fact that backspace is so slow)
let g:ctrlp_lazy_update = 1
" Show as many results as our screen will allow
let g:ctrlp_match_window = 'max:1000'

" CtrlP like mapings for opening quick fixes in new splits
let g:qfenter_vopen_map = ['<C-v>']
let g:qfenter_hopen_map = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_topen_map = ['<C-t>']

" Set up rooter for finding the root of the root of every project
"" Resolve symbolic links
let g:rooter_resolve_links = 1
"" Patterns to identify the root directory
let g:rooter_patterns = ['Rakefile', '.git', '.git/', '.svn/']

"" Automatically set current working directory
autocmd BufEnter * :Rooter

" }}}-------------------------------------------------------------------------
"   Custom filetypes                                                      {{{
" ----------------------------------------------------------------------------

" Auto detect filetype
autocmd BufRead,BufNewFile *.md,*.markdown set filetype=markdown
autocmd BufRead,BufNewFile *.lytex set filetype=tex
autocmd BufRead,BufNewFile ~/dotfiles/ssh/config set filetype=sshconfig
autocmd BufRead,BufNewFile *.git/config,.gitconfig,.gitmodules,gitconfig set ft=gitconfig
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd BufNewFile,BufRead .eslintrc set filetype=javascript
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufRead,BufNewFile *.py setlocal foldmethod=indent

" Override what is done in /vim/bundle/scss-syntax.vim/ftdetect/scss.vim
" This should prevent duplicate snippets
autocmd BufRead,BufNewFile *.scss set filetype=scss


" }}}-------------------------------------------------------------------------
"   Custom mappings                                                       {{{
" ----------------------------------------------------------------------------

" When pasting, refill the default register with what you just pasted
xnoremap p pgvy

" Repurpose arrow keys to navigating windows
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" To encourage the use of <C-[np]> instead of the arrow keys in ex mode, remap
" them to use <Up/Down> instead so that they will filter completions
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Navigate using displayed lines not actual lines
nnoremap j gj
nnoremap k gk

" Make Y consistent with D
nnoremap Y y$

" Reselect visual block after indent/outdent: http://vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Allow saving of files as sudo when I forgot to start vim using sudo.
" Seems to have a problem where Vim sees that the file has changed and tries to
" reload it. When it does it thinks the file is blank (but it's not really).
cmap w!! %!sudo tee > /dev/null %

" Nobody ever uses "Ex" mode, and it's annoying to leave
noremap Q <nop>

" }}}-------------------------------------------------------------------------
"   Undo, Backup and Swap file locations                                  {{{
" ----------------------------------------------------------------------------

" Don't leave .swp files everywhere. Put them in a central place
set directory=$HOME/.vim/swapdir//
set backupdir=$HOME/.vim/backupdir//
if exists('+undodir')
    set undodir=$HOME/.vim/undodir
    set undofile
endif

" }}}-------------------------------------------------------------------------
"   If there is a per-machine local .vimrc, source it here at the end     {{{
" ----------------------------------------------------------------------------

if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" }}}-------------------------------------------------------------------------
"                                                                         {{{
" ----------------------------------------------------------------------------

set exrc
set secure

" }}}-------------------------------------------------------------------------

