" VIM CONFIGURATION FILE
" AUTHOR: NITISH LOBO

set shell=/bin/bash
runtime macros/matchit.vim
let $PATH='/usr/local/bin:' . $PATH

" PLUGINS
set rtp+=$HOME/vimfiles/plugin/Vundle.vim/      " Use Vundle to manage plugins
call vundle#begin('$HOME/vimfiles/plugin/')
Plugin 'Vundle.vim'                   " Use Vundle to manage vundle plug-in
Plugin 'vim-fugitive'                     " Plugin for git
call vundle#end()
filetype plugin indent on

" COLOURS
set background=dark   " Alternative: light
colorscheme torte
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" GENERAL SETTINGS
:au FocusLost * :wa       " Auto-save when window is switched
set ttyfast               " For smooth scrolling
set lazyredraw            " For screen not to be redrawn while excuting macros
set nocompatible          " Use Vim settings, rather then Vi settings
set showcmd               " Display incomplete commands

set number                " Show line numbering
set numberwidth=5         " Maximum digits to be used in the line numbering
set ruler                 " Show the cursor position all the time
set backspace=2           " Backspace deletes like most programs in insert mode

set autoindent            " Use indentation of previous line
set smartindent           " Use intelligent indentation
set tabstop=4             " Tab width is 4 spaces
set shiftwidth=4          " Indent also with 4 spaces
set expandtab             " Expand tabs to spaces
set textwidth=80          " Wrap line after 80 chars

set incsearch             " Do incremental searching
set hlsearch              " Highlight matches
set smartcase             " Over-ride 'ignorecase' if search pattern contains upper-case
set ignorecase            " Ignore the case of searched term
set laststatus=2          " Always display the status line

set ttimeout              " Reduce timeout after <ESC> is recieved.
set ttimeoutlen=20
set notimeout

set undodir=~/.vim/undo/  " Persistent undo
set undofile
set undolevels=1000
set undoreload=10000

set list listchars=tab:»·,trail:·  " Display extra whitespace

" LEADER MAPPINGS
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Gpush<CR>

map <F10> :NERDTreeToggle<CR>   " Toggle nerdtree with F10
map <F9> :NERDTreeFind<CR>      " Current file in nerdtree

" Always split windows vertically
set splitright
set diffopt+=vertical
silent! set splitvertical
if v:errmsg != ''
  cabbrev split vert split
  cabbrev hsplit split
  cabbrev help vert help
  noremap <C-w>] :vert botright wincmd ]<CR>
  noremap <C-w><C-]> :vert botright wincmd ]<CR>
else
  cabbrev hsplit hor split
endif

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" FILE SPECIFING SETTINGS
let g:html_indent_tags = 'li\|p'     " Treat <li> and <p> tags like the block tags they are
let g:jsx_ext_required = 0           " Allow jsx highlighting/indenting in .js files

" DEFAULT CONFIG FILE FOLLOWS
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
