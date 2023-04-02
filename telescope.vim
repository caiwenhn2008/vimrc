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
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

map <leader>2  :Telescope maven_search query=

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

