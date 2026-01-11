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
vim.o.foldenable = false
vim.o.foldcolumn = "0"
vim.o.foldmethod = "manual"
vim.cmd("nnoremap q <nop>")
lvim.plugins = {
  {"ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
  {"weizheheng/ror.nvim"},
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
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
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
  {'greggh/claude-code.nvim',
    config = function()
      require('claude-code').setup({
        -- Terminal window settings
        window = {
          split_ratio = 0.5,      -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
          position = "vertical",  -- Position of the window: "botright", "topleft", "vertical", "float", etc.
          enter_insert = true,    -- Whether to enter insert mode when opening Claude Code
          hide_numbers = true,    -- Hide line numbers in the terminal window
          hide_signcolumn = true, -- Hide the sign column in the terminal window

          -- Floating window configuration (only applies when position = "float")
          float = {
            width = "80%",        -- Width: number of columns or percentage string
            height = "80%",       -- Height: number of rows or percentage string
            row = "center",       -- Row position: number, "center", or percentage string
            col = "center",       -- Column position: number, "center", or percentage string
            relative = "editor",  -- Relative to: "editor" or "cursor"
            border = "rounded",   -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
          },
        },
        -- File refresh settings
        refresh = {
          enable = true,           -- Enable file change detection
          updatetime = 100,        -- updatetime when Claude Code is active (milliseconds)
          timer_interval = 1000,   -- How often to check for file changes (milliseconds)
          show_notifications = true, -- Show notification when files are reloaded
        },
        -- Git project settings
        git = {
          use_git_root = true,     -- Set CWD to git root when opening Claude Code (if in git project)
        },
        -- Shell-specific settings
        shell = {
          separator = '&&',        -- Command separator used in shell commands
          pushd_cmd = 'pushd',     -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
          popd_cmd = 'popd',       -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
        },
        -- Command settings
        command = "claude",        -- Command used to launch Claude Code
        -- Command variants
        command_variants = {
          -- Conversation management
          continue = "--continue", -- Resume the most recent conversation
          resume = "--resume",     -- Display an interactive conversation picker

          -- Output options
          verbose = "--verbose",   -- Enable verbose logging with full turn-by-turn output
        },
        -- Keymaps
        keymaps = {
          toggle = {
            normal = "<C-,>",       -- Normal mode keymap for toggling Claude Code, false to disable
            terminal = "<C-,>",     -- Terminal mode keymap for toggling Claude Code, false to disable
            variants = {
              continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
              verbose = "<leader>cV",  -- Normal mode keymap for Claude Code with verbose flag
            },
          },
          window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
          scrolling = true,         -- Enable scrolling keymaps (<C-f/b>) for page up/down
        }
      }) 
    end
  },
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
  }
}

-- lvim.builtin.treesitter.ignore_install = { "javascript" }
-- lvim.builtin.treesitter.highlight.disable = { "javascript" }

-- Ensure treesitter java parser is installed and updated
lvim.builtin.treesitter.ensure_installed = {
  "java",
  "lua",
  "python",
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

lvim.builtin.which_key.mappings["c"] = {
  name = "Claude Code",
  c = { ":ClaudeCode<CR>", "open" },
}


--setup copilot
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
--end of setup copilot

