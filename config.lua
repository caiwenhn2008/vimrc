-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.colorscheme = "gruvbox"
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.guifont = "monospace:h17"
vim.opt.wrap = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.g.ackprg = "ag --nogroup --nocolor --column"
-- Show special characters (whitespace, tabs, etc.)
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }
vim.o.foldenable = false
vim.o.foldcolumn = "0"
vim.o.foldmethod = "manual"
vim.cmd("nnoremap q <nop>")
lvim.plugins = {
  {"ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
  -- Disable illuminate for Java files to avoid treesitter errors
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        filetypes_denylist = {
          'java',
        },
      })
    end
  },
  {
    'unblevable/quick-scope' , -- Easy movement with f, F.
    init = function()
      vim.cmd([[
        " Trigger a highlight in the appropriate direction when pressing these keys:
        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

        highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
        highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

        let g:qs_max_chars=150
      ]])
    end
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = {
          min_width = { 60, 0.9 },
        },
        select = {
          -- telescope = require('telescope.themes').get_ivy({...})
          telescope = require('telescope.themes').get_dropdown({ layout_config = { height = 15, width = 90 } }), }
      })
    end,
  },
  {"rcarriga/nvim-notify"},
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function ()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  {
    "907th/vim-auto-save",
    config = function ()
      vim.cmd("let g:auto_save = 1")
    end
  },
  {
    "mileszs/ack.vim"
  },
  {
    "vim-test/vim-test"
  },
  { "mfussenegger/nvim-dap-python"},
  { "nvim-neotest/neotest"},
  { "nvim-neotest/neotest-python"},
  { "theHamsta/nvim-dap-virtual-text"},
  {'nvim-lua/plenary.nvim'},
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    end
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({
        -- Priority list of preferred backends for aerial
        backends = { "treesitter", "lsp", "markdown" },
        -- Show box drawing characters for the tree hierarchy
        show_guides = true,
        -- Keybindings
        on_attach = function(bufnr)
          -- Toggle aerial
          vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle<CR>", { buffer = bufnr })
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
    end
  }
}

-- lvim.builtin.treesitter.ignore_install = { "javascript" }
-- lvim.builtin.treesitter.highlight.disable = { "javascript" }

-- Ensure treesitter java parser is installed and updated
lvim.builtin.treesitter.ensure_installed = {
  "java",
  "lua",
  "python",
  "javascript"
}

lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
 require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

require("nvim-dap-virtual-text").setup {
  enabled = true,                        -- enable this plugin (the default)
}

lvim.builtin.which_key.mappings["v"] = {
  "<C-W>v", "split screen"
}
lvim.builtin.which_key.mappings["h"] = {
  "<C-W>s", "split screen"
}
lvim.builtin.which_key.mappings["t"] = {
  ":Ack<CR>", "ack search"
}
lvim.builtin.which_key.mappings["n"] = {
  ":let @/ = ''<CR>", "no highlight"
}
lvim.builtin.which_key.mappings["/"] = {
  ":e ~/.zshrc<CR>", "config bash"
}

lvim.builtin.which_key.mappings["r"] = {
  name = "Run App",
  t = { ":TestFile -strategy=neovim<CR>", "test file" },
  p = { ":!python3 %<CR>", "run python" },
}

lvim.builtin.which_key.mappings["o"] = {
  name = "Symbols/Outline",
  o = { ":AerialToggle<CR>", "toggle outline" },
  n = { ":AerialNext<CR>", "next symbol" },
  p = { ":AerialPrev<CR>", "prev symbol" },
}
