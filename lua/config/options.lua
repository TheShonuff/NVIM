-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

--opt.pumblend = 0
--opt.winblend = 0
opt.guicursor = ""
opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.cursorline = false

opt.breakindent = true
opt.ignorecase = true
opt.expandtab = true

opt.hlsearch = false
opt.incsearch = true

opt.smartindent = true
opt.scrolloff = 8

opt.wrap = true
-- Map Leader Key
vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.diagnostic.config({
  virtual_text = false,
})
-- Apperance
opt.termguicolors = true
-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
-- Custome Highlights
--set Pmenu to be transparent

--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", blend = 0 })
