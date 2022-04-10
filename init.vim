"~/.config/nvim/init.vim
"pip3 install autopep
let mapleader = " "

" set foldmethod=syntax
" set foldenable
" set foldlevel=0
" set foldnestmax=10
" syn region foldImports start=/\(\n\?import.\+;\n\)\+/ end=+^\s*$+ transparent fold keepend
" autocmd FileType java :set fmr=/**,*/ fdm=marker fdc=1
" syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
" syn region foldJavadoc start=+/\*+ end=+\*/+ transparent fold keepend extend


source ~/.config/nvim/coc.vim
source ~/.config/nvim/which_key.vim

nnoremap <leader>sv :source $MYVIMRC<CR>
:set clipboard=unnamed

:set number
:set relativenumber
set mouse=a
set guicursor=a:blinkwait5-blinkon5-blinkoff5

map gf :edit <cfile><cr>

noremap ; :
noremap Q :q<CR>
" noremap <C-q> :qa<CR>
noremap S :w<CR>

set showmode
set showcmd
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
:set wrap linebreak
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

call plug#begin(stdpath('data') . 'vimplug')

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysiw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc & gcgc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'

Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'aloussase/telescope-gradle.nvim'
Plug 'dhruvmanila/telescope-bookmarks.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fannheyward/telescope-coc.nvim'

Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

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
Plug 'antoinemadec/coc-fzf'

Plug 'ap/vim-buftabline'

Plug 'liuchengxu/vim-which-key'
" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
autocmd! User vim-which-key call which_key#register(',', 'g:which_key_map')

Plug 'puremourning/vimspector'

Plug 'sheerun/vim-polyglot'
Plug 'unblevable/quick-scope'
Plug 'kshenoy/vim-signature'
Plug 'wfxr/minimap.vim'
Plug 'j5shi/CommandlineComplete.vim'
Plug 'diepm/vim-rest-console'
call plug#end()

:set ft=rest

cmap <c-p> <Plug>CmdlineCompleteBackward
cmap <c-n> <Plug>CmdlineCompleteForward

let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
let g:qs_max_chars=150

let g:airline_theme='simple'

nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

:colorscheme gruvbox
" :colorscheme onehalfdark

autocmd FileType * map <buffer> <F2> :w<CR>:exec '!gradle run '<CR>
autocmd FileType * map <buffer> <F3> :w<CR>:exec '!./gradlew test'<CR>
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <F6> :w<CR>:exec '!python3 -m unittest ' shellescape(@%, 1)<CR>

" nmap <leader>gj :diffget //3<CR>
" nmap <leader>gf :diffget //2<CR>


map <Leader>3 Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" python run config
nnoremap   <silent>   <F7>    :FloatermNew! --position=topright python3 % <CR>
nnoremap   <silent>   <F8>    :FloatermNew! --position=topright ipython <CR>


nmap <leader>ca  <Plug>(coc-codeaction)
nmap <F9> :CocOutline<CR>

nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   <leader>i  :FloatermNew --height=0.9 --width=0.8 lazygit<CR>

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nnoremap <silent><nowait> <leader>ds :<C-u>VimspectorShowOutput<cr>
nnoremap <silent><nowait> <leader>de :<C-u>VimspectorReset<cr>
nnoremap <silent><nowait> <leader>dj :<C-u>CocCommand java.debug.vimspector.start<cr>

let g:coc_fzf_preview = 'down:50%'
let g:coc_fzf_opts=['--layout=reverse']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
" let g:coc_fzf_preview_fullscreen=1
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fl :BLines<CR>
nnoremap <silent> <leader>fm :Marks<CR>

" mappings
nnoremap <silent> <space>a       :<C-u>Telescope coc diagnostics<CR>
nnoremap <silent> <space>aa      :<C-u>Telescope coc workspace_diagnostics<CR>
nnoremap <silent> <space>c       :<C-u>Telescope coc commands<CR>
nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>s       :<C-u>Telescope coc workspace_symbols<CR>
nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>

nnoremap <silent> <space><space> :<C-u>Telescope<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>t  <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
local telescope = require('telescope')
telescope.setup {
  defaults = {
      layout_config = {
          prompt_position = "top",
          width=0.9,
          height=0.8,
    },
  },
  pickers = {
    live_grep = {
        layout_config = {
          prompt_position = "top",
        }
    }
  },
  extensions = {
    bookmarks = {
      selected_browser = 'chrome',
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
telescope.load_extension('gradle')
telescope.load_extension('bookmarks')
telescope.load_extension('fzf')
telescope.load_extension('coc')
EOF

