set nocompatible
filetype off

" set runtime path to to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'

" all plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Vundle help
"  :PluginList    - lists configured plugins
"  :PluginInstall  - installs plugins; append `!` to update or just
"  :PluginUpdate
"  :PluginSearch foo    - searches for foo; append `!` to refresh local cache
"  :PluginClean      - confirms removal of unused plugins; append `!` to
"  auto-approve removal
"
"  see :h vundle for more details or wiki for FAQ
"  non-plugin stuff can go after this line

syntax on
set spell spelllang=en_au
colorscheme dracula
set number

" remap keys
inoremap kj <Esc>
