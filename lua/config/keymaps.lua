local keymap = vim.keymap
local opts = { noremap = true, silent = true}

-- deleting via x wont store the value in any registers
keymap.set("n", "x", '"_x')

-- increase/decrease size
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":q<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- clear highlights on serach when pressing Esp
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- diagnostic keymaps
keymap.set("n", "<Leader>d", vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- diagnostic jump
keymap.set("n", "<C-j>", function()
  vim.diagnostic_goto_next()
end, opts)

-- exit terminal mode (?)
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- keybinds to make split navigation easier 
-- Use ctrl hjkl to swtich between windows
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

-- tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- AUTOCOMMANDS
-- highlight when yanking text - easeir to see what you have copied
-- use yap
vim.api.nvim_create_autocmd("TextYankPost" , {
  desc = "Highlight when copying text",
  group = vim.api.nvim_create_augroup("Dolfik-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- faster Ex
keymap.set("n", "<Leader>pv", vim.cmd.Ex)
