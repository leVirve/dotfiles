
"------------------------------------------------------------------------------
" Install vundle automatically
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
"------------------------------------------------------------------------------
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

set nocompatible              " be iMproved, required
filetype off                  " required



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugin on GitHub repo
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

Plugin 'scrooloose/nerdtree'
let g:molokai_original = 1

Bundle 'jistr/vim-nerdtree-tabs'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" General Settings
set nocompatible " not compatible with the old-fashion vi mode
set bs=2  " allow backspacing over everything in insert mode
set history=50    " keep 50 lines of command line history
set ruler " show the cursor position all the time
set autoread " auto read when file is changed from outside

" set status line
set laststatus=2
set t_Co=256

syntax on
set number

set linespace=1.2
set expandtab
set shiftwidth=4
set softtabstop=4

set clipboard=unnamed " yank to the system register (*) by default

set wildchar=<TAB>  " start wild expansion in the command line using <TAB>
set wildmenu    " wild char completion menu
                " ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc
set autoindent  " auto indentation
set incsearch   " incremental search
set nobackup    " no *~ backup files
set copyindent  " copy the previous indentation on autoindenting
set ignorecase  " ignore case when searching
set smartcase   " ignore case if search pattern is all
                " lowercase,case-sensitive otherwise
set smarttab    " insert tabs on the start of a line according to context


colorscheme molokai

"---------------------------------------------------------------------------
"" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1



map <Leader>n <plug>NERDTreeTabsToggle<CR>


" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

