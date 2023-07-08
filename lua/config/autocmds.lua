-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- ColorScheme Adjustmenets
--vim.api.nvim_create_autocmd("ColorScheme", {
--  callback = function()
--    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None", ctermbg = "None", blend = 0 })
--    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none", blend = 0 })
--    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none", ctermbg = "none", blend = 0 })
--    vim.api.nvim_set_hl(0, "MyCustome", { bg = "None", fg = "ffffff", blend = 0 })
--  end,
--})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "None", ctermbg = "None", blend = 0 })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None", ctermbg = "None", blend = 0, fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "NoicePopup", { bg = "None", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermbg = "none", blend = 0 })

    vim.api.nvim_set_hl(0, "MsgArea", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "None", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NoicePopupmenu", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NoiceLspProgressTitle", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NoiceLspProgressClient", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NoiceMini", { bg = "none", ctermbg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NoiceFormatTitle", { bg = "none", ctermbg = "none", blend = 0 })

    vim.api.nvim_set_hl(0, "NoiceFormatProgressDone", { bg = "none", ctermbg = "none", blend = 0 })

    --    vim.api.nvim_set_hl(0, "NoiceCompletionMenu", { bg = "none", ctermbg = "none", blend = 0 })

    -- vim.api.nvim_set_hl(0, "NoiceLspProgressClient", { bg = "none", ctermbg = "none", blend = 0 })
  end,
})
-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })

-- Go to last loc when opening a bufferq
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*",
  callback = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "<buffer>",
      once = true,
      callback = function()
        vim.cmd(
          [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
        )
      end,
    })
  end,
})

-- windows to close
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "OverseerForm",
    "OverseerList",
    "floggraph",
    "fugitive",
    "git",
    "help",
    "lspinfo",
    "man",
    "neotest-output",
    "neotest-summary",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "toggleterm",
    "tsplayground",
    "vim",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})
-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })
