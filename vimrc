""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Vundle
"

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1

let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')

if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone git@github.com:VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  " Add your bundles here
  "" Color schemes
  Plugin 'flazz/vim-colorschemes'
  "" Files
  Plugin 'scrooloose/nerdtree'
  Plugin 'kien/ctrlp.vim'
  Plugin 'vim-syntastic/syntastic' "uber awesome syntax and errors highlighter
  Plugin 'tpope/vim-fugitive' "So awesome, it should be illegal

  "...All your other bundles...
  if iCanHazVundle == 0
    echo "Installing Vundles, please ignore key map error messages"
    echo ""
    :PluginInstall
  endif

call vundle#end()  "must be last

filetype plugin indent on " load filetype plugins/indent settings
syntax on                      " enable syntax

" Setting up Vundle - the vim plugin bundler end

colorscheme xterm16

