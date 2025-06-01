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
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
vim.g.ackprg = "ag --nogroup --nocolor --column"
lvim.plugins = {
  {"ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
  {"weizheheng/ror.nvim"},
  {"unblevable/quick-scope"},
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
  { "nvim-neotest/nvim-nio"},
 
}

lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
 require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)


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

