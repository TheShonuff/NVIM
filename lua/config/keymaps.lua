-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
-- This is going to get canceled.
keymap("i", "jk", "<Esc>")

-- increment and decrement
keymap("n", "<leader>+", "<C-a>")
keymap("n", "<leader>-", "<C-x>")

-- Proper Scrolling
keymap("n", "<c-d>", "<c-d>zz")
keymap("n", "<c-u>", "<c-u>zz")
-- Pasting in insert mode
keymap("i", "<c-r>", '<c-r>"')

-- window management
keymap("n", "<leader>sv", "<C-w>v") --split window vertically
keymap("n", "<leader>sh", "<C-w>s") --split window horizontally
keymap("n", "<leader>se", "<C-w>=") --make split windows equal width
keymap("n", "<leader>sx", ":close<CR>") --close current window

keymap("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Telescope File Browser:
-- keymap("n", "<leader>e", ":Telescope file_browser path=%:p:h<CR>")

-- LspSaga
keymap("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>")
keymap("n", "gd", ":Lspsaga peek_definition<CR>")
keymap("n", "ca", ":Lspsaga code_actions<CR>")
keymap("n", "<leader>k", ":Lspsaga hover_doc<CR>", { silent = true })

-- Neo-Tree
keymap("n", "<leader>ft", ":Neotree<CR>")
keymap("n", "<leader><esc>", ":NeoTreeClose<CR>")

--Rust Keymaps
keymap("n", "<leader>fmt", ":%! rustfmt<CR>")
