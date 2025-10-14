-- Minimal vi-like options
vim.g.mapleader = " "

vim.cmd("language en_US.UTF-8")
-- Essential encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Line numbers (vi had these with :set nu)
vim.opt.number = true

-- Indentation (keep it simple)
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Search behavior (vi-style)
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Scrolling
vim.opt.scrolloff = 8

-- No wrapping (vi default)
vim.opt.wrap = false

-- Backup files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Minimal UI
vim.opt.signcolumn = "yes"  -- Keep gutter stable for LSP
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Mouse (modern convenience)
vim.opt.mouse = "a"

-- Clipboard sync
vim.opt.clipboard = "unnamedplus"

-- Minimal status
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmode = true

-- Use terminal colors (no custom colorscheme)
vim.opt.termguicolors = true
vim.cmd("colorscheme default")

vim.cmd("syntax off")

-- Highlight on yank (useful feedback)
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
