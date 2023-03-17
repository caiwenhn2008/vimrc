call plug#begin(stdpath('data') . 'vimplug')

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysiw)
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

Plug 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1
Plug 'jiangmiao/auto-pairs'

Plug '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup

Plug 'christoomey/vim-tmux-navigator'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-i>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsEditSplit="vertical"

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'

Plug 'ap/vim-buftabline'

Plug 'liuchengxu/vim-which-key'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
autocmd! User vim-which-key call which_key#register(',', 'g:which_key_map')

Plug 'puremourning/vimspector'

Plug 'sheerun/vim-polyglot'
Plug 'unblevable/quick-scope'
Plug 'kshenoy/vim-signature'
Plug 'j5shi/CommandlineComplete.vim'
Plug 'mbbill/undotree'
Plug 'mtdl9/vim-log-highlighting'

Plug 'sindrets/diffview.nvim'

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'

Plug 'aloussase/telescope-maven-search'
Plug 'ThePrimeagen/harpoon'

Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'vim-test/vim-test'

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
Plug 'github/copilot.vim'
Plug 'dstein64/vim-startuptime'
call plug#end()


