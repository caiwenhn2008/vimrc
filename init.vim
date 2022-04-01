"~/.config/nvim/init.vim
"pip3 install autopep
let mapleader = ","

source ~/.config/nvim/coc.vim
source ~/.config/nvim/which_key.vim

:set clipboard=unnamed

:set number
:set relativenumber
set mouse=a

map gf :edit <cfile><cr>

noremap ; :
noremap Q :q<CR>
" noremap <C-q> :qa<CR>
noremap S :w<CR>

set showmode
set showcmd
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
"set colorcolumn=200
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
" set cursorline
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


call plug#begin(stdpath('data') . 'vimplug')

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysiw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc & gcgc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'

Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" <C-x> go to file selection as a split
" <C-v> go to file selection as a vsplit
" <C-t> go to a file in a new tab

Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

" Plug 'mileszs/ack.vim'
" let g:ackprg = 'ag --nogroup --nocolor --column'

Plug 'justinmk/vim-sneak'

Plug '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup

Plug 'glepnir/dashboard-nvim'
let g:dashboard_default_executive ='fzf'

Plug 'christoomey/vim-tmux-navigator'

Plug 'honza/vim-snippets'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ap/vim-buftabline'

Plug 'liuchengxu/vim-which-key'
" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
autocmd! User vim-which-key call which_key#register(',', 'g:which_key_map')

Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation

Plug 'puremourning/vimspector'

Plug 'sheerun/vim-polyglot'
call plug#end()


" let g:vimspector_enable_mappings = 'HUMAN'


let g:airline_theme='simple'
" :map <F4> :Ack<CR>

nnoremap <leader>t <cmd>FloatermNew<cr>

" nnoremap <leader>f <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope git_files<cr>
" nnoremap <leader>fi <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nmap <F3> :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nmap <F9> :TagbarToggle<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

:colorscheme gruvbox
" :colorscheme onehalfdark

autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <F6> :w<CR>:exec '!python3 -m unittest ' shellescape(@%, 1)<CR>

autocmd FileType * map <buffer> <F2> :w<CR>:exec '!gradle run '<CR>
autocmd FileType * map <buffer> <F3> :w<CR>:exec '!./gradlew test'<CR>

nmap <leader>1 :CocFix<CR>

nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

nnoremap <leader>sv :source $MYVIMRC<CR>

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" python run config
nnoremap   <silent>   <F7>    :FloatermNew! --position=topright python3 % <CR>
nnoremap   <silent>   <F8>    :FloatermNew! --position=topright ipython <CR>


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

nmap <leader>ca  <Plug>(coc-codeaction)

nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   <F10>   :FloatermNew lazygit<CR>
nnoremap   <silent>   <leader>gi  :FloatermNew --height=0.99 --width=0.99 lazygit<CR>
tnoremap   <silent>   <F10>   <C-\><C-n>:FloatermNew lazygit<CR>

"fzf
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fo :Files /<CR>
nnoremap <silent> <leader>fs :Rg<CR>
nnoremap <silent> <leader>fb  :Buffers<CR>
nnoremap <silent> <leader>fl :BLines<CR>
nnoremap <silent> <leader>fm  :Marks<CR>
nnoremap <silent> <leader>fc :Commands<CR>
nnoremap <silent> <F1> :Helptags<CR>

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nnoremap <silent><nowait> <leader>ds :<C-u>VimspectorShowOutput<cr>
nnoremap <silent><nowait> <leader>de :<C-u>VimspectorReset<cr>
nnoremap <silent><nowait> <leader>dj :<C-u>CocCommand java.debug.vimspector.start<cr>

nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
