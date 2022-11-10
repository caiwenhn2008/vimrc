"~/.config/nvim/init.vim
let mapleader = " "
"pip3 install ipdb pdbpp autopep8 wheel set foldenable

let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'
source ~/.config/nvim/coc.vim
source ~/.config/nvim/which_key.vim

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
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'

Plug 'aloussase/telescope-maven-search'
Plug 'ThePrimeagen/harpoon'

Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'vim-test/vim-test'

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
Plug 'github/copilot.vim'
call plug#end()

if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

nnoremap <F1> :UndotreeToggle<CR>
cmap <c-p> <Plug>CmdlineCompleteBackward
cmap <c-n> <Plug>CmdlineCompleteForward

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
let g:qs_max_chars=150

let g:airline_theme='simple'

nnoremap <leader>sv :source $MYVIMRC<CR>



" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

colorscheme gruvbox

map <leader>2  :Telescope maven_search query=
map <Leader>3 Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

nmap <leader>ca  <Plug>(coc-codeaction)

nnoremap   <silent>   <F2>   :!run %:r<CR>
nnoremap   <silent>   <leader>i  :FloatermNew --height=0.99 --width=0.99 lazygit<CR>

let g:vimspector_enable_mappings = 'HUMAN'
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
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR> nnoremap <silent> <leader>fh :History<CR>
map <Leader>f :Ack<CR>
nnoremap <silent> <leader>fl :BLines<CR>
nnoremap <silent> <leader>fm :Marks<CR>

" mappings
nnoremap <silent> <space>a       :<C-u>Telescope coc diagnostics<CR>
nnoremap <silent> <space>aa      :<C-u>Telescope coc workspace_diagnostics<CR>
nnoremap <silent> <space>c       :<C-u>Telescope coc commands<CR>
nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
" nnoremap <silent> <space>s       :<C-u>Telescope coc workspace_symbols<CR>
nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>

nnoremap <silent> <space><space> :<C-u>Telescope<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
" nnoremap <leader>t  <cmd>Telescope live_grep<cr>
nnoremap <c-t>  <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
local telescope = require('telescope')
telescope.setup {
  defaults = {
      layout_config = {
          prompt_position = "bottom",
          width=0.9,
          height=0.8,
    },
  },
  pickers = {
    live_grep = {
        layout_config = {
          prompt_position = "bottom",
        }
    },
    find_files = {
        previewer=false
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
telescope.load_extension('maven_search')
EOF

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeWinSize=45
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> <space><space>  :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <silent> <space>a  :lua require("harpoon.mark").add_file()<cr>
nnoremap <silent> <space>1  :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <silent> <space>2  :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <silent> <space>3  :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <silent> <space>4  :lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <silent> <space>5  :lua require("harpoon.ui").nav_file(5)<cr>


let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let test#java#runner = 'gradletest'
" let test#java#runner = 'maventest'

nnoremap H gT
nnoremap L gt
nmap te :tabedit<CR>
nmap tq :tabclose<CR>

nnoremap <silent>gb :Git blame<CR>

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> <space>q  :<C-u>CocAction<cr>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


let g:coc_global_extensions = [ 'coc-yank', 'coc-snippets', 'coc-prettier', 'coc-eslint', 'coc-vimlsp', 'coc-tsserver', 'coc-solargraph', 'coc-pyright', 'coc-markdownlint', 'coc-json', 'coc-java-lombok', 'coc-java', 'coc-go', 'coc-clangd']
