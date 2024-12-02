let mapleader = "\<space>"

filetype plugin indent on
syntax on

set background=dark

set clipboard=unnamed
set number
set hidden
set ignorecase
set smartcase
set incsearch
set tabstop=4
set shiftwidth=4
set backspace=eol,start,indent
set nostartofline
set hlsearch
set autoindent
set expandtab
set ttimeout
set ttimeoutlen=50
set ruler

nnoremap ; A;<Esc>

nnoremap <cr> :noh<cr><cr>
nnoremap <Enter> o<Esc>
nnoremap <c-s> :wa<cr>

nnoremap <c-\> :split<cr>
nnoremap <c-\|> :vsplit<cr>

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

onoremap iq i"
vnoremap iq i"
onoremap aq a"
vnoremap aq a"
