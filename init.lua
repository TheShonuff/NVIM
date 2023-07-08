-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.options")
require("config.lazy")

--vim.g.copilot_node_command = "~/.fnm/node-versions/v18.0.0/installation/bin/node"
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.autocmds")
    require("config.keymaps")
  end,
})
