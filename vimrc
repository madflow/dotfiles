set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set autoread
set background=dark
set nobackup
set encoding=utf-8
set pastetoggle=<F2>
set nocompatible              " be iMproved, required
filetype off                  " required
colorscheme monokai

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Bundle 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

