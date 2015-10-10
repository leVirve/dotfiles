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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kshenoy/vim-signature'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()            " required
filetype plugin indent on    " required


"------------------------------------------------------------------------------
" Plugin settings
"------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }
        " re-map keybinding of plugin vim-signature
        " https://github.com/yangyangwithgnu/use_vim_as_ide
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:solarized_termcolors=256


"------------------------------------------------------------------------------
" Settings
"------------------------------------------------------------------------------


" General Settings
syntax on

set number
set ruler           " show the cursor position all the time
set autoread        " auto read when file is changed from outside
set cursorline      " highlight current line
set cursorcolumn    " highlight current column line
set hlsearch        " highlight all search results

set expandtab       " turn <tab> into <spaces>
set shiftwidth=4    " tabsize=4 when formatting
set softtabstop=4   " tabsize=4 for edit
set foldmethod=indent   " folded by indent
set nofoldenable    " not folded as startup
set foldnestmax=2   " the methods of classes are folded, but internal
                    " statements aren't

set bs=2            " allow backspacing over everything in insert mode
set history=50      " keep 50 lines of command line history
set laststatus=2    " always show status line

set clipboard=unnamed " yank to the system register (*) by default
set wildchar=<TAB>  " start wild expansion in the command line using <TAB>
set wildmenu        " wild char completion menu
set wildignore=*.o,*.class,*.pyc
                    " ignore these files while expanding wild chars
set autoindent      " auto indentation
set incsearch       " incremental search
set nobackup        " no *~ backup files
set copyindent      " copy the previous indentation on autoindenting
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all
                    " lowercase,case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to context


"---------------------------------------------------------------------------
" Appearance & Themes
"---------------------------------------------------------------------------
set linespace=1.2
set background=dark
colorscheme solarized
"colorscheme Monokai
"colorscheme molakai
"colorscheme phd

hi CursorLine   cterm=NONE
"hi CursorLine   cterm=NONE ctermbg=17 ctermfg=NONE

hi Pmenu ctermfg=4 ctermbg=7
hi PmenuSel ctermfg=7 ctermbg=3

"---------------------------------------------------------------------------
"" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1


"---------------------------------------------------------------------------
" Keyboard settings
"---------------------------------------------------------------------------
let mapleader=","

map <Leader>n <plug>NERDTreeTabsToggle<CR>
imap jj <ESC>
nnoremap <space> za

" compile
map <F7> :make<CR>
map <F5> :make<CR>:!./a.out<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"---------------------------------------------------------------------------
" Individual settings
"---------------------------------------------------------------------------
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

