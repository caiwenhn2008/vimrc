let mapleader = " "

let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'
nnoremap <leader>sv :source $MYVIMRC<CR>
:set clipboard=unnamed

:set cmdheight=1

:set number
:set relativenumber
set mouse=a
set guicursor=a:blinkwait5-blinkon5-blinkoff5

map gf :edit <cfile><cr>

" noremap ; :
" noremap Q :q<CR>
" noremap S :w<CR>

set showmode
set showcmd
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
:set wrap linebreak
set fo-=t   " don't automatically wrap text when typing
highlight ColorColumn ctermbg=233

" Useful  2 settings
set history=700
set undolevels=700

set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers

set nobackup
set nowritebackup
set noswapfile

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink


" 1 tab to 2 space for ruby
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab



"in order to switch between buffers with unsaved change
set hidden

" hightlight column and line
set cursorline
" set cursorcolumn
" Highlight current line
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
set cindent

autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4


autocmd BufWritePre * :%s/\s\+$//e


