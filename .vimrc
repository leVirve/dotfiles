" Install Vim-Plug automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'itchyny/lightline.vim'
"Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tmhedberg/SimpylFold'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdcommenter'
Plug 'python-mode/python-mode'
Plug 'w0rp/ale'

call plug#end()


"------------------------------------------------------------------------------
" Plugin settings
"------------------------------------------------------------------------------

let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%: %code%] %s [%severity%]'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['✗ %d', '⚠ %d', '✔ OK']
let g:ale_linters = {'python': ['pylint']}

let g:pymode_python = 'python3'
let g:pymode_lint = 0  " ALE
let g:pymode_folding = 0  " SimplyFold
let g:pymode_virtualenv = 0
let g:pymode_run = 0
let g:pymode_breakpoint = 0
let g:pymode_options = 0
let g:pymode_doc = 0
let g:pymode_rope = 0
let g:pymode_debug = 0

let g:NERDTreeWinSize=30


"------------------------------------------------------------------------------
" Appearance
"------------------------------------------------------------------------------
if has("termguicolors")
    " fix bug for vim
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum

    " enable true color
    "set termguicolors
endif

color nord
syntax on

set number
set cursorline      " highlight current line
set cursorcolumn    " highlight current column line
"set hlsearch        " highlight all search results
"set laststatus=2    " always show status line

"hi CursorLine   cterm=NONE
"hi CursorLine   cterm=NONE ctermbg=17 ctermfg=NONE

"hi Pmenu ctermfg=4 ctermbg=7
"hi PmenuSel ctermfg=7 ctermbg=3


"------------------------------------------------------------------------------
" Settings
"------------------------------------------------------------------------------

" General Settings
set noswapfile      " no *.sw* files
set nobackup        " no *~ backup files
set autoread        " auto read when file is changed from outside
set history=50      " keep 50 lines of command line history

" Space and Tab
set tabstop=4       " tabstop
set shiftwidth=4    " tabsize=4 when formatting
set softtabstop=4   " tabsize=4 for edit
set expandtab       " turn <tab> into <spaces>
set bs=2            " allow backspacing over everything in insert mode

set clipboard=unnamed " yank to the system register (*) by default
set wildchar=<TAB>  " start wild expansion in the command line using <TAB>
set wildmenu        " wild char completion menu
set wildignore=*.o,*.class,*.pyc
                    " ignore these files while expanding wild chars
"set autoindent      " auto indentation
"set incsearch       " incremental search
"set copyindent      " copy the previous indentation on autoindenting
"set ignorecase      " ignore case when searching
"set smartcase       " ignore case if search pattern is all
                    "" lowercase,case-sensitive otherwise
"set smarttab        " insert tabs on the start of a line according to context

" Folding
set foldmethod=indent   " folded by indent
set nofoldenable    " not folded as startup
set foldnestmax=2   " the methods of classes are folded, but internal
                    " statements aren't
au BufWinLeave * silent mkview  " save the folding status
au BufRead * silent loadview    " reload the folding status


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

" open NERDTree if there's no openning file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close the NERDTree when exit vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

imap jj <ESC>

let mapleader=","
map <Leader>n :NERDTreeToggle<CR>
" fzf panel
nnoremap <silent> <C-p> :Files<CR>
" folding
nnoremap <space> za
" tagbar
nmap <F8> :TagbarToggle<CR>

"---------------------------------------------------------------------------
" Individual settings
"---------------------------------------------------------------------------
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
