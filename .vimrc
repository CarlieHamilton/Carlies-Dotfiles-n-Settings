set nocompatible
filetype off

" set runtime path to to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/vader.vim'
Plugin 'dracula/vim'
Plugin 'tpope/vim-surround'
Plugin 'wakatime/vim-wakatime'
Plugin 'johngrib/vim-game-snake'

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

function! s:exercism_tests()
  if expand('%:e') == 'vim'
    let testfile = printf('%s/%s.vader', expand('%:p:h'),
          \ tr(expand('%:p:h:t'), '-', '_'))
    if !filereadable(testfile)
      echoerr 'File does not exist: '. testfile
      return
    endif
    source %
    execute 'Vader' testfile
  else
    let sourcefile = printf('%s/%s.vim', expand('%:p:h'),
          \ tr(expand('%:p:h:t'), '-', '_'))
    if !filereadable(sourcefile)
      echoerr 'File does not exist: '. sourcefile
      return
    endif
    execute 'source' sourcefile
    Vader
  endif
endfunction

autocmd BufRead *.{vader,vim}
      \ command! -buffer Test call s:exercism_tests()
