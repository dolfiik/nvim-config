local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Leader key is Space (set in options.lua)

-- === VI BASICS ===
-- Delete without yanking
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all (modern convenience)
keymap.set("n", "<C-a>", "gg<S-v>G")

-- === FILE OPERATIONS ===
keymap.set("n", "<leader>w", ":w<CR>", opts)
keymap.set("n", "<leader>q", ":q<CR>", opts)
keymap.set("n", "<leader>Q", ":qa<CR>", opts)

-- === SEARCH ===
-- Clear search highlights
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- === WINDOW NAVIGATION ===
-- Use Ctrl+hjkl to move between windows
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- === TABS ===
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "<Tab>", ":tabnext<CR>", opts)
keymap.set("n", "<S-Tab>", ":tabprev<CR>", opts)
keymap.set("n", "tw", ":tabclose<CR>", opts)

-- === TERMINAL MODE ===
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- === DIAGNOSTICS ===
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project view" })

-- === TELESCOPE (set in telescope.lua) ===
-- <leader>ff - Find files
-- <leader>fg - Live grep
-- <leader>fb - Buffers
-- <leader>fh - Help tags
-- <leader>/ - Search in current buffer

-- === LSP (set in lsp.lua when LSP attaches) ===
-- gd - Go to definition
-- gr - Go to references
-- K - Hover documentation
-- <leader>rn - Rename
-- <leader>ca - Code action
