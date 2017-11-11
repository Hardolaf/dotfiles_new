" Allow vim to break compatibility with vi
set nocompatible " Must be first as it changes other options

" Setup vim-plug if not installed
"" Load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

" Setting up Vundle - the vim plugin bundler
" let iCanHazVundle=1

" let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')

" if !filereadable(vundle_readme)
"  echo "Installing Vundle.."
"  echo ""
"  silent !mkdir -p ~/.vim/bundle
"  silent !git clone git@github.com:VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
"  let iCanHazVundle=0
"endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set rtp+=~/.vim/bundle/Vundle.vim/
" call vundle#begin()
call plug#begin('~/.vim/plugged')

  "Plugin 'VundleVim/Vundle.vim'
  " Add your bundles here
  "" Color schemes
  Plug 'flazz/vim-colorschemes'

  " Syntax
  Plug 'tpope/vim-git', { 'for': 'git'}
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'suoto/vim-hdl', { 'for': 'vhdl' }

  " Completion
  Plug 'mattn/emmet-vim', { 'for': 'html' }

  " Make % match xml tags
  Plug 'tmhedberg/matchit', { 'for': ['html', 'xml'] }

  " Make tab handle all completions
  Plug 'ervandew/supertab'

  " Syntastic: Code linting errors
  Plug 'scrooloose/syntastic'

  " Fancy statusline
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Fuzzy file opener
  Plug 'ctrlpvim/ctrlp.vim'

  " Make commenting easier
  Plug 'tpope/vim-commentary'

  " Navigate files in a sidebar
  Plug 'scrooloose/nerdtree'

  " Split and join lines of code intelligently
  Plug 'AndrewRadev/splitjoin.vim'

  " Only show cursorline in the current window
  Plug 'vim-scripts/CursorLineCurrentWindow'

  " Split navigation that works with tmux
  Plug 'christoomey/vim-tmux-navigator'

  " Change brackets and quotes
  Plug 'tpope/vim-surround'

  " Make vim-surround repeatable with .
  Plug 'tpope/vim-repeat'

  " Git from within vim
  Plug 'tpope/vim-fugitive'

  " Show git status in the gutter
  Plug 'airblade/vim-gitgutter'

  " Python completion and tag navigation
  Plug 'davidhalter/jedi-vim', { 'for': 'python' }

  "" Project discovery
  Plug 'airblade/vim-rooter'

  "...All your other bundles...
"  if iCanHazVundle == 0
"    echo "Installing Vundles, please ignore key map error messages"
"    echo ""
"    :PluginInstall
"  endif

filetype plugin indent on " required
call plug#end()

"call vundle#end()  "must be last

filetype plugin indent on " load filetype plugins/indent settings
syntax on                 " enable syntax

" Setting up Vundle - the vim plugin bundler end

colorscheme hybrid

" Set up rooter for finding the root of the root of every project
"" Resolve symbolic links
let g:rooter_resolve_links = 1
"" Patterns to identify the root directory
let g:rooter_patterns = ['Rakefile', '.git', '.git/', '.svn']

"" Automatically set current working directory
autocmd BufEnter * :Rooter


