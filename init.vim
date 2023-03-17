"~/.config/nvim/init.vim
"pip3 install ipdb pdbpp autopep8 wheel set foldenable
source ~/.config/nvim/basic_config.vim
source ~/.config/nvim/plugin.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/which_key.vim
source ~/.config/nvim/undo.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/telescope.vim

nnoremap <leader>sv :source $MYVIMRC<CR>
colorscheme gruvbox
let g:airline_theme='simple'
nnoremap   <silent>   <F2>   :!run %:r<CR>
let test#java#runner = 'gradletest'
" let test#java#runner = 'maventest'
nnoremap   <silent>   <leader>i  :FloatermNew --height=0.99 --width=0.99 lazygit<CR>
nnoremap <silent>gb :Git blame<CR>
cmap <c-p> <Plug>CmdlineCompleteBackward
cmap <c-n> <Plug>CmdlineCompleteForward

"quickscope setting
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
let g:qs_max_chars=150


"debug setting
map <Leader>3 Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
let g:vimspector_enable_mappings = 'HUMAN'
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nnoremap <silent><nowait> <leader>ds :<C-u>VimspectorShowOutput<cr>
nnoremap <silent><nowait> <leader>de :<C-u>VimspectorReset<cr>
nnoremap <silent><nowait> <leader>dj :<C-u>CocCommand java.debug.vimspector.start<cr>

"fzf setting
let g:coc_fzf_preview = 'down:50%'
let g:coc_fzf_opts=['--layout=reverse']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
nnoremap <silent> <leader>fl :BLines<CR>
nnoremap <silent> <leader>fm :Marks<CR>

"search setting
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR> nnoremap <silent> <leader>fh :History<CR>
map <Leader>f :Ack<CR>

"harpoon setting
nnoremap <silent> <space><space>  :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <silent> <space>a  :lua require("harpoon.mark").add_file()<cr>
nnoremap <silent> <space>1  :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <silent> <space>2  :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <silent> <space>3  :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <silent> <space>4  :lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <silent> <space>5  :lua require("harpoon.ui").nav_file(5)<cr>

"slime setting
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}


"ultilsnips setting
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


