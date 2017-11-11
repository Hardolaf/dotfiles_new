
" Setup vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

call plug#begin('~/.vim/plugged')

  " Color schemes
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

filetype plugin indent on " required
call plug#end()
